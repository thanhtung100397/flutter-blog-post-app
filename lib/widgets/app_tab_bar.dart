import 'package:flutter/material.dart';
import 'package:news_feed_app/utils/collection_utils.dart';

class TabBarItem {
  final IconData icon;
  final String? label;
  final String Function(BuildContext context)? labelIntl;

  const TabBarItem({
    required this.icon,
    this.label,
    this.labelIntl
  });
}

class AppTabBarWidget<T extends TabBarItem> extends StatefulWidget {
  final List<T> items;

  const AppTabBarWidget({Key? key, required this.items}) : super(key: key);

  @override
  State<AppTabBarWidget> createState() => _AppTabBarWidgetState();
}

class _AppTabBarWidgetState extends State<AppTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        tabs: CollectionUtils.mapToList(widget.items, (TabBarItem item, index) =>
            Tab(icon: Icon(item.icon))
        )
    );
  }
}