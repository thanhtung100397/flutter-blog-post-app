import 'package:flutter/material.dart';
import 'package:news_feed_app/commons/app_menu.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:news_feed_app/widgets/app_bottom_navigation.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {

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