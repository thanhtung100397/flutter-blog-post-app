import 'package:flutter/material.dart';
import 'package:news_feed_app/commons/app_menu.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:news_feed_app/utils/collection_utils.dart';
import 'package:news_feed_app/widgets/app_bottom_navigation.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  final Duration animationDuration = const Duration(milliseconds: 500);

  int currentPageIndex = 0;
  Future<void>? pagerAnimateProgress;
  PageController pagerController = PageController();

  Future<void> animatePagerToNewPage(int newPageIndex) {
    Future<void> animateProgress = pagerController.animateToPage(
        newPageIndex,
        duration: animationDuration,
        curve: Curves.easeInOut
    );
    pagerAnimateProgress = animateProgress;
    return animateProgress;
  }

  Widget createPagerWidget(BuildContext context) {
    return PageView(
      controller: pagerController,
      children: CollectionUtils.mapToList(
          AppMenu.navigation,
          (AppMenuItem item, index) => item.widget(context)
      ),
      onPageChanged: (index) async {
        await pagerAnimateProgress;
        setState(() {
          currentPageIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      body: createPagerWidget(context),
      bottomNavigationBar: AppBottomNavigationWidget(
        items: AppMenu.navigation,
        selectedIndex: currentPageIndex,
        animationDuration: animationDuration,
        onItemChanged: (index) =>
            setState(() {
              currentPageIndex = index;
              animatePagerToNewPage(index);
            }),
      ),
    );
  }
}