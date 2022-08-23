import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_feed_app/routes/app_route.dart';
import 'package:news_feed_app/themes/app_theme.dart';

class AppPersonalPage extends StatefulWidget {
  const AppPersonalPage({Key? key}) : super(key: key);

  @override
  State<AppPersonalPage> createState() => _AppPersonalPageState();
}

class _AppPersonalPageState extends State<AppPersonalPage> {
  Widget personalInfoSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
      color: AppColor.appMainBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.sign_in_hint),
          Container(
              margin: const EdgeInsets.only(top: 8),
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: AppColor.appPrimary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: AppRoute.routes['/login']!),
                  );
                },
                child: Text(AppLocalizations.of(context)!.sign_in,
                    style: TextStyle(color: AppColor.appTextAccent)),
              )),
        ],
      ),
    );
  }

  Widget settingSection() {
    return Container(
        color: AppColor.appMainBackground,
        child: ListTile(
          leading: const Icon(Icons.settings),
          title: Text(AppLocalizations.of(context)!.settings),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ));
  }

  Widget otherSection() {
    return Container(
        color: AppColor.appMainBackground,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.view_list),
              title: Text(AppLocalizations.of(context)!.followed_articles),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              leading: const Icon(Icons.work_history),
              title: Text(AppLocalizations.of(context)!.read_history),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(AppLocalizations.of(context)!.liked_posts),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: Text(AppLocalizations.of(context)!.send_feedbacks),
              trailing: const Icon(Icons.keyboard_arrow_right),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.personal)),
      body: Container(
        color: AppColor.appSecondaryBackground,
        child: Wrap(
          direction: Axis.horizontal,
          runSpacing: 5,
          children: <Widget>[
            personalInfoSection(),
            settingSection(),
            otherSection()
          ],
        ),
      ),
    );
  }
}
