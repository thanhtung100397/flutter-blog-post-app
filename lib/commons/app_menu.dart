import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_feed_app/widgets/app_bottom_navigation.dart';
import 'package:news_feed_app/pages/home/article/app_article_page.dart';
import 'package:news_feed_app/pages/home/podcast/app_podcast_page.dart';
import 'package:news_feed_app/pages/home/search/app_search_page.dart';
import 'package:news_feed_app/pages/home/notification/app_notification_page.dart';
import 'package:news_feed_app/pages/home/personal/app_personal_page.dart';

class AppMenuItem implements NavigationItem {
  @override
  final IconData icon;
  @override
  final String? label;
  @override
  final String Function(BuildContext context)? labelIntl;
  final Widget Function(BuildContext context) widget;

  const AppMenuItem({
    required this.icon,
    this.label,
    this.labelIntl,
    required this.widget,
  });
}

class AppMenu {
  static final List<AppMenuItem> navigation = [
    AppMenuItem(
      icon: Icons.article,
      label: 'articles',
      labelIntl: (context) => AppLocalizations.of(context)!.articles,
      widget: (context) => const AppArticlePage()
    ),
    AppMenuItem(
      icon: Icons.podcasts,
      label: 'podcast',
      labelIntl: (context) => AppLocalizations.of(context)!.podcast,
      widget: (context) => const AppPodcastPage()
    ),
    AppMenuItem(
      icon: Icons.search,
      label: 'search',
      labelIntl: (context) => AppLocalizations.of(context)!.search,
      widget: (context) => const AppSearchPage()
    ),
    AppMenuItem(
      icon: Icons.notifications,
      label: 'notifications',
      labelIntl: (context) => AppLocalizations.of(context)!.notification,
      widget: (context) => const AppNotificationPage()
    ),
    AppMenuItem(
      icon: Icons.person,
      label: 'person',
      labelIntl: (context) => AppLocalizations.of(context)!.personal,
      widget: (context) => const AppPersonalPage()
    ),
  ];
}