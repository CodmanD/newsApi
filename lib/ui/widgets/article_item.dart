import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/model/article.dart';
import 'package:news/router/router.dart';
import 'package:news/ui/widgets/download_indicator.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(ArticleRoute(article: article));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                    flex: 1,
                    child: Image.network(
                      article.imagePath ?? "",
                      loadingBuilder: (context, __, ___) {
                        if (___ == null) {
                          return __;
                        } else {
                          return const DownloadIndicator(
                            style: Indicator.image,
                          );
                        }
                      },
                    )),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      children: [
                        Text(article.title ?? "",
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(article.subTitle ?? "", maxLines: 4, style: TextStyle(fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(article.source?.name ?? ""),
                Text(
                  DateFormat('yyyy-MM-dd kk:mm')
                      .format(article.publishedAt ?? DateTime.now()),
                ),
              ],
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            )
          ],
        ),
      ),
    );
  }
}
