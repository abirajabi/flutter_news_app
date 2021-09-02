import 'package:flutter/material.dart';
import 'package:flutter_news_app/widgets/cutom_scaffold_dart.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';

  final String url;

  ArticleWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
