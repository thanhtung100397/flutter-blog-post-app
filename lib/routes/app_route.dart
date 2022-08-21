import 'package:flutter/material.dart';
import 'package:news_feed_app/pages/home/app_home_page.dart';

class AppRoute {
  static String initialRoute = '/home';
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/home': (context) => const AppHomePage(),
  };
}