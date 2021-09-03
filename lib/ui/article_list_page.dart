import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/provider/news_provider.dart';
import 'package:flutter_news_app/widgets/card_artilce.dart';
import 'package:flutter_news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class ArticleListPage extends StatelessWidget {
  Widget _buildList(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.articlesResult.articles.length,
              itemBuilder: (context, index) {
                var article = state.articlesResult.articles[index];
                return CardArticle(article: article);
              },
            );
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.Error) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text(''));
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News App'),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: _buildList(context),
    );
  }
}
