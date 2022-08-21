import 'package:flutter/material.dart';
import 'package:news_feed_app/themes/app_theme.dart';

class AppSearchPage extends StatefulWidget {
  const AppSearchPage({Key? key}) : super(key: key);

  @override
  State<AppSearchPage> createState() => _AppSearchPageState();
}

class _AppSearchPageState extends State<AppSearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Search page')
          ],
        ),
      ),
    );
  }
}