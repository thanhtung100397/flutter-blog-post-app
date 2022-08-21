import 'package:flutter/material.dart';
import 'package:news_feed_app/themes/app_theme.dart';

class AppArticlePage extends StatefulWidget {
  const AppArticlePage({Key? key}) : super(key: key);

  @override
  State<AppArticlePage> createState() => _AppArticlePageState();
}

class _AppArticlePageState extends State<AppArticlePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Article page')
          ],
        ),
      ),
    );
  }
}