import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/bloc/news_bloc_event.dart';
import 'package:news/model/article.dart';
import 'package:news/ui/widgets/article_item.dart';
import 'package:news/ui/widgets/download_indicator.dart';

import '../../bloc/news_bloc_state.dart';

class ArticlesList extends StatefulWidget {
  ArticlesList({super.key, required this.articles});

  List<Article> articles;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        context.read<NewsBloc>().add(NextNewsFetchEvent());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  return (state is NextNewsFetchingState &&
                          index == widget.articles.length - 1)
                      ? Column(children: [
                          ArticleItem(article: widget.articles[index]),
                          const DownloadIndicator(style: indicator.nextPage)
                        ])
                      : ArticleItem(article: widget.articles[index]);
                },
              );
            },
            childCount: widget.articles.length,
          ),
        )
      ],
    );
  }
}
