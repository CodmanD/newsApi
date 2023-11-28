import 'package:dio/dio.dart';

import '../model/article.dart';
import 'package:retrofit/retrofit.dart';
import '../model/response.dart' ;
part 'news_api.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class NewsApiClient {
  factory NewsApiClient(Dio dio, {String baseUrl}) = _NewsApiClient;

  @GET('everything?q=all')
  Future<ServerMessage>? fetchArticles( @Query('apiKey') String apiKey,
      @Query('pageSize') int pageSize, @Query('page') int size);
}
