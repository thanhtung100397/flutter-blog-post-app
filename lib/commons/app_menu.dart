import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_feed_app/widgets/app_bottom_navigation.dart' as bottom_navigation show MenuItem;

class AppNavigationMenu {
  static final List<bottom_navigation.MenuItem> items = [
    bottom_navigation.MenuItem(icon: Icons.article, label: 'articles', labelIntl: (context) => AppLocalizations.of(context)!.articles),
    bottom_navigation.MenuItem(icon: Icons.podcasts, label: 'podcast', labelIntl: (context) => AppLocalizations.of(context)!.podcast),
    bottom_navigation.MenuItem(icon: Icons.search, label: 'search', labelIntl: (context) => AppLocalizations.of(context)!.search),
    bottom_navigation.MenuItem(icon: Icons.notifications, label: 'notifications', labelIntl: (context) => AppLocalizations.of(context)!.notification),
    bottom_navigation.MenuItem(icon: Icons.person, label: 'person', labelIntl: (context) => AppLocalizations.of(context)!.personal),
  ];
}