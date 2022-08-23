import 'package:flutter/material.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLoginPage extends StatefulWidget {
  const AppLoginPage({Key? key}) : super(key: key);

  @override
  State<AppLoginPage> createState() => _AppLoginPageState();
}

class _AppLoginPageState extends State<AppLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
      body: Column(
        children: const [],
      ),
    );
  }
}
