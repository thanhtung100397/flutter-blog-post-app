import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:news_feed_app/utils/string_utils.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({
    Key? key,
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
      items: <Widget>[
        NavigationItem(icon: Icons.article, label: AppLocalizations.of(context)!.articles, showLabel: _selectedIndex != 0),
        NavigationItem(icon: Icons.podcasts, label: AppLocalizations.of(context)!.podcast, showLabel: _selectedIndex != 1),
        NavigationItem(icon: Icons.search, label: AppLocalizations.of(context)!.search, showLabel: _selectedIndex != 2),
        NavigationItem(icon: Icons.notifications, label: AppLocalizations.of(context)!.notification, showLabel: _selectedIndex != 3),
        NavigationItem(icon: Icons.person, label: AppLocalizations.of(context)!.personal, showLabel: _selectedIndex != 4),
      ],
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(widget.icon, color: AppColor.appTextAccent),
        if (StringUtils.isNotEmpty(widget.label) && widget.showLabel) Text(widget.label!, style: TextStyle(color: AppColor.appTextAccent))
      ]
    );
  }
}