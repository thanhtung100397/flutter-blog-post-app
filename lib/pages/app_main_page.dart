import 'package:flutter/material.dart';
import 'package:news_feed_app/commons/app_menu.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:news_feed_app/widgets/app_bottom_navigation.dart';

class AppMainPage extends StatefulWidget {
  const AppMainPage({Key? key}) : super(key: key);

  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Hello world')
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(items: AppNavigationMenu.items),
    );
  }
}