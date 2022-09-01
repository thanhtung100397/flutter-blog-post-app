import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_feed_app/routes/app_route.dart';
import 'package:http/http.dart' as http;
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:news_feed_app/utils/api_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      // Replace with actual values
      options: const FirebaseOptions(
          apiKey: "AIzaSyAXJuKbNCppyJmkMnJza_R3uPwCn89tsr8",
          authDomain: "news-feed-e767b.firebaseapp.com",
          projectId: "news-feed-e767b",
          storageBucket: "news-feed-e767b.appspot.com",
          messagingSenderId: "1029674613958",
          appId: "1:1029674613958:web:5a2a93026aa1d035756bc7"),
    );
  } catch (e) {}

  FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
    if (user != null) {
      String idToken = await user.getIdToken();
      final response = await http.post(
          ApiUtils.buildUri(path: "/auth/login-firebase"),
          body: json.encode({'idToken': idToken}));
      if (response.statusCode != 200) {
        throw Exception(
            "Error when calling api to login ${response.statusCode} ${response.body}");
      }
    }
  });

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        theme: AppTheme().data,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('vi', ''),
        supportedLocales: const [
          Locale('en', ''),
          Locale('vi', ''),
        ],
        initialRoute: AppRoute.initialRoute,
        routes: AppRoute.routes);
  }
}
