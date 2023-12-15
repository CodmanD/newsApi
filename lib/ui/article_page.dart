import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../model/article.dart';
import 'widgets/download_indicator.dart';

@RoutePage()
class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key, required this.article});

  final Article article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late final WebViewController _controller;
  bool isLoaded = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.article.url ?? ''))
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          if (mounted) {
            setState(() {
              isLoaded = false;
            });
          }
        },
      ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(Constants.titleApp),
            centerTitle: true,
            backgroundColor: ThemeData.light().colorScheme.background,
          ),
          body: isLoaded
              ?const DownloadIndicator(style: Indicator.web)
              : WebViewWidget(
                  controller: _controller,
                )),
    );
  }
}
