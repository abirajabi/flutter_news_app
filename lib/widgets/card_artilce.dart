import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/navigation.dart';
import 'package:flutter_news_app/common/styles.dart';
import 'package:flutter_news_app/data/models/article.dart';
import 'package:flutter_news_app/ui/article_detail_page.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage,
          child: Image.network(
            article.urlToImage,
            width: 100,
            errorBuilder: (context, exception, stacktrace) {
              return Image.asset('assets/placeholder100.png');
            },
          ),
        ),
        title: Text(article.title),
        subtitle: Text(article.author),
        onTap: () =>
            Navigation.intentWithData(ArticleDetailPage.routeName, article),
      ),
    );
  }
}
