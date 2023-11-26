// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticlePage(
          key: args.key,
          article: args.article,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [ArticlePage]
class ArticleRoute extends PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    Key? key,
    required Article article,
    List<PageRouteInfo>? children,
  }) : super(
          ArticleRoute.name,
          args: ArticleRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleRoute';

  static const PageInfo<ArticleRouteArgs> page =
      PageInfo<ArticleRouteArgs>(name);
}

class ArticleRouteArgs {
  const ArticleRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final Article article;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
