import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({Key? key}) : super(key: key);

  @override
  State<AppSettingPage> createState() => _AppSettingPage();
}

class _AppSettingPage extends State<AppSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.setting)),
      body: Container(
        color: AppColor.appSecondaryBackground,
        child: Wrap(
          direction: Axis.horizontal,
          runSpacing: 5,
          children: const <Widget>[],
        ),
      ),
    );
  }
}
