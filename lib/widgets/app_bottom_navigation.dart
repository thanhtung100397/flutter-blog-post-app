import 'package:flutter/material.dart';
import 'package:news_feed_app/commons/app_dimen.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:news_feed_app/utils/collection_utils.dart';
import 'package:news_feed_app/utils/string_utils.dart';

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
  final Duration animationDuration;
  final Curve animationCurve;
  final ValueChanged<int>? onItemChanged;

  const AppBottomNavigationWidget({
    Key? key,
    required this.items,
    this.selectedIndex = 0,
    this.onItemChanged,
    this.animationDuration = const Duration(milliseconds: 600),
    this.animationCurve = Curves.easeOutCubic,
  }) : super(key: key);

  @override
  State<AppBottomNavigationWidget> createState() => _AppBottomNavigationWidgetState();

}

class _AppBottomNavigationWidgetState extends State<AppBottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 64,
      items: CollectionUtils.mapToList(widget.items, (NavigationItem item, index) =>
          NavigationItemWidget(
              icon: item.icon,
              label: item.labelIntl?.call(context) ?? item.label,
              showLabel: widget.selectedIndex != index
          )
      ),
      index: widget.selectedIndex,
      animationDuration: widget.animationDuration,
      animationCurve: widget.animationCurve,
      color: AppColor.appPrimary,
      buttonBackgroundColor: AppColor.appPrimaryLight,
      backgroundColor: AppColor.appMainBackground,
      onTap: widget.onItemChanged,
    );
  }
}

class NavigationItemWidget extends StatefulWidget {
  final IconData icon;
  final String? label;
  final bool showLabel;

  const NavigationItemWidget({
    Key? key,
    required this.icon,
    this.label,
    this.showLabel = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigationItemWidgetState();
  }
}

class _NavigationItemWidgetState extends State<NavigationItemWidget> {

  final TextStyle textStyle = TextStyle(
    color: AppColor.appTextAccent,
    fontSize: AppDimens.bottomNavigationItemLabelFontSize
  );

  bool shouldShowLabel() {
    return StringUtils.isNotEmpty(widget.label) && widget.showLabel;
  }

  Widget createLabelWidget() {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 2, 0, 10),
        child: Text(widget.label!, style: textStyle));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon(widget.icon, color: AppColor.appTextAccent),
        if (shouldShowLabel()) createLabelWidget()
      ]
    );
  }
}