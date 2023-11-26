import 'package:flutter/cupertino.dart';

import '../model/article.dart';

@immutable
abstract class NewsState{}

class NewsInitialState extends NewsState{}
class NewsFetchingState extends NewsState{}
class NextNewsFetchingState extends NewsState{}
class NewsErrorState extends NewsState{
  final String errorMessage;

  NewsErrorState({required this.errorMessage});
}
class NewsFetchedState extends NewsState{
  final List<Article> articles;

  NewsFetchedState({required this.articles});
}
