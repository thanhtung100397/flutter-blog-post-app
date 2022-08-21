import 'package:flutter/material.dart';
import 'package:news_feed_app/themes/app_theme.dart';

class AppPodcastPage extends StatefulWidget {
  const AppPodcastPage({Key? key}) : super(key: key);

  @override
  State<AppPodcastPage> createState() => _AppPodcastPageState();
}

class _AppPodcastPageState extends State<AppPodcastPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Podcast page')
          ],
        ),
      ),
    );
  }
}