import 'package:flutter/material.dart';
import 'package:news_feed_app/themes/app_theme.dart';

class AppPersonalPage extends StatefulWidget {
  const AppPersonalPage({Key? key}) : super(key: key);

  @override
  State<AppPersonalPage> createState() => _AppPersonalPageState();
}

class _AppPersonalPageState extends State<AppPersonalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Personal page')
          ],
        ),
      ),
    );
  }
}