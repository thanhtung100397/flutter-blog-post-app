import 'package:flutter/material.dart';
import 'package:news_feed_app/themes/app_theme.dart';

class AppNotificationPage extends StatefulWidget {
  const AppNotificationPage({Key? key}) : super(key: key);

  @override
  State<AppNotificationPage> createState() => _AppNotificationPageState();
}

class _AppNotificationPageState extends State<AppNotificationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Notification page')
          ],
        ),
      ),
    );
  }
}