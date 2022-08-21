import 'package:flutter/material.dart';
import 'package:news_feed_app/commons/app_dimen.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:news_feed_app/utils/collection_utils.dart';
import 'package:news_feed_app/utils/string_utils.dart';

class MenuItem {
  final IconData icon;
  final String? label;
  final String Function(BuildContext context)? labelIntl;

  const MenuItem({
    required this.icon,
    this.label,
    this.labelIntl
  });
}

class AppBottomNavigation extends StatefulWidget {
  final List<MenuItem> items;

  const AppBottomNavigation({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();

}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 64,
      items: CollectionUtils.mapToList(widget.items, (MenuItem item, index) =>
          NavigationItem(
              icon: item.icon,
              label: item.labelIntl?.call(context) ?? item.label,
              showLabel: _selectedIndex != index
          )
      ),
      index: _selectedIndex,
      color: AppColor.appPrimaryLight,
      buttonBackgroundColor: AppColor.appPrimaryLight,
      backgroundColor: AppColor.appMainBackground,
      onTap: _onItemTapped,
    );
  }
}

class NavigationItem extends StatefulWidget {
  final IconData icon;
  final String? label;
  final bool showLabel;

  const NavigationItem({
    Key? key,
    required this.icon,
    this.label,
    this.showLabel = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigationItemState();
  }
}

class _NavigationItemState extends State<NavigationItem> {

  final TextStyle textStyle = TextStyle(
    color: AppColor.appTextAccent,
    fontSize: AppDimens.bottomNavigationItemLabelFontSize
  );

  bool shouldShowLabel() {
    return StringUtils.isNotEmpty(widget.label) && widget.showLabel;
  }

  Widget createLabelWidget() {
    return Container(
        margin: const EdgeInsets.only(top: 2),
        child: Text(widget.label!, style: textStyle));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(widget.icon, color: AppColor.appTextAccent),
        if (shouldShowLabel()) createLabelWidget()
      ]
    );
  }
}