import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../model/article.dart';
import '../ui/article_page.dart';
import '../ui/home_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page,path: '/'),
    AutoRoute(page: ArticleRoute.page,path: '/article',)
  ];
}