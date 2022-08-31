import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_feed_app/utils/api_utils.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({Key? key}) : super(key: key);

  @override
  State<AppSettingPage> createState() => _AppSettingPage();
}

class _AppSettingPage extends State<AppSettingPage> {
  late Future<dynamic> userSettings;

  Future<Map<String, dynamic>> fetchUserSettings() async {
    final response = await http.get(ApiUtils.buildUri(path: "/settings"));
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  void initState() {
    super.initState();
    userSettings = fetchUserSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appMainBackground,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.setting)),
      body: ListView(
        children: <Widget>[
          FutureBuilder<Map<String, dynamic>>(builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.toString());
              return SwitchListTile(
                value: true,
                title: Text("Nhận thông báo đẩy"),
                subtitle: Text("Giúp bạn luôn cập nhật các bài viết mới nhất"),
                onChanged: (bool value) {
                  print(value);
                },
              );
            }
            return Container();
          })
        ],
      ),
    );
  }
}
