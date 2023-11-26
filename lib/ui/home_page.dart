import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/news_bloc_event.dart';
import 'package:news/bloc/news_bloc_state.dart';
import 'package:news/ui/widgets/articles_list.dart';

import '../bloc/news_bloc.dart';
import '../common/constants.dart';
import 'widgets/download_indicator.dart';
import 'widgets/error_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsInitialState()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ThemeData.light().colorScheme.background,
            title: const Text(
              Constants.titleApp,
            ),
          ),
          body: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              NewsBloc bloc = context.read<NewsBloc>();
              switch (state.runtimeType) {
                case const (NewsInitialState):
                  context.read<NewsBloc>().add(NewsFetchEvent());
                  return const DownloadIndicator(style: indicator.list);
                case const (NewsFetchingState):
                  return const DownloadIndicator(style: indicator.list);
                case const (NextNewsFetchingState):
                case const (NewsFetchedState):
                  return ArticlesList(articles: bloc.articles);
                case const (NewsErrorState):
                  return ErrorNewsWidget(
                    errorMessage: (state as NewsErrorState).errorMessage,
                  );
                default:
                  return const Text('undefined state');
              }
            },
          ),
        ),
      ),
    );
  }
}
