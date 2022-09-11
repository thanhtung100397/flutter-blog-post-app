import 'package:flutter/material.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:news_feed_app/utils/collection_utils.dart';

class NavigationItem {
  final IconData icon;
  final String? label;
  final String Function(BuildContext context)? labelIntl;

  const NavigationItem({
    required this.icon,
    this.label,
    this.labelIntl
  });
}

class AppBottomNavigationWidget<T extends NavigationItem> extends StatefulWidget {
  final List<T> items;
  final int selectedIndex;
  final ValueChanged<int>? onItemChanged;

  const AppBottomNavigationWidget({
    Key? key,
    required this.items,
    this.selectedIndex = 0,
    this.onItemChanged,
  }) : super(key: key);

  @override
  State<AppBottomNavigationWidget> createState() => _AppBottomNavigationWidgetState();

}

class _AppBottomNavigationWidgetState extends State<AppBottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: CollectionUtils.mapToList(widget.items, (NavigationItem item, index) =>
          NavigationItemWidget(
              icon: Icon(item.icon),
              label: item.labelIntl?.call(context) ?? item.label,
          )
      ),
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.selectedIndex,
      selectedItemColor: AppColor.appPrimaryLight,
      backgroundColor: AppColor.appTextAccent,
      onTap: widget.onItemChanged,
    );
  }
}

class NavigationItemWidget extends BottomNavigationBarItem {

  NavigationItemWidget({required super.icon, super.label});
}