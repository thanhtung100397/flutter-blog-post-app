import 'package:flutter/material.dart';
import 'package:news_feed_app/commons/app_menu.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:news_feed_app/utils/collection_utils.dart';
import 'package:news_feed_app/widgets/app_bottom_navigation.dart';
import 'package:news_feed_app/widgets/app_pager.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      body: AppPagerWidget(
        pages: CollectionUtils.mapToList(
            AppMenu.navigation,
            (AppMenuItem item, index) => item.widget(context)
        ),
        currentPage: currentPageIndex,
        onPageChanged: (index) => setState(() {
          currentPageIndex = index;
        }),
      ),
      bottomNavigationBar: AppBottomNavigationWidget(
        items: AppMenu.navigation,
        selectedIndex: currentPageIndex,
        onItemChanged: (index) =>
            setState(() {
              currentPageIndex = index;
            }),
      ),
    );
  }
}