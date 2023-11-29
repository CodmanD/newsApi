import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news/bloc/news_bloc_event.dart';
import 'package:news/bloc/news_bloc_state.dart';
import 'package:news/common/constants.dart';

import '../domain/news_api.dart';
import '../model/article.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final apiClient = NewsApiClient(Dio());
  final String apiKey = dotenv.get('API_KEY');
  int numberPage = 1;
  List<Article> articles = [];
  final int pageSize = Constants.pageSize;

  NewsBloc(super.initialState) {
    on<NewsFetchEvent>((event, emit) async {
      emit(NewsFetchingState());
      try {
        final response = await apiClient.fetchArticles(apiKey, pageSize, numberPage);
        if (null != response && response.status == 'ok') {
          articles = response.articles ?? articles;
          emit(NewsFetchedState(articles: articles));
        } else {
          emit(NewsErrorState(errorMessage: "server error"));
        }
      } catch (exception) {
        emit(NewsErrorState(errorMessage: "undefined error"));
      }
    });
    on<NextNewsFetchEvent>((event, emit) async {
      emit(NextNewsFetchingState());
      try {
        final response = await apiClient.fetchArticles(apiKey, pageSize, ++numberPage);
        if (null != response && response.status == 'ok') {
          articles.addAll(response.articles ?? []);
          emit(NewsFetchedState(articles: articles));
        } else if (articles.isNotEmpty) {
          emit(NewsFetchedState(articles: articles));
        } else {
          numberPage--;
          emit(NewsErrorState(errorMessage: "server error"));
        }
      } catch (ex) {
        numberPage--;
        if (articles.isNotEmpty) {
          emit(NewsFetchedState(articles: articles));
        } else {
          emit(NewsErrorState(errorMessage: "undefined error"));
        }
      }
    });
  }
}
