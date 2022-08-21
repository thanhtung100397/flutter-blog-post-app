import 'package:flutter/material.dart';
import 'package:news_feed_app/pages/app_main_page.dart';

class AppRoute {
  static String initialRoute = '/';
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/': (context) => const AppMainPage(),
  };
}