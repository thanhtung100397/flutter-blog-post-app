import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_feed_app/themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLoginPage extends StatefulWidget {
  const AppLoginPage({Key? key}) : super(key: key);

  @override
  State<AppLoginPage> createState() => _AppLoginPageState();
}

class _AppLoginPageState extends State<AppLoginPage> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    GoogleSignInAccount? googleUser = await GoogleSignIn(
      clientId:
          "1029674613958-11p79r4ov0uni4bkua7r0frqji69u1k0.apps.googleusercontent.com",
    ).signIn();

    // Obtain the auth details from the request
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appMainBackground,
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
        body: Align(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(Buttons.GoogleDark,
                text: AppLocalizations.of(context)!.login_google,
                onPressed: () async {
              await signInWithGoogle();
              if (!mounted) return;
              Navigator.pop(context);
            }),
          ],
        )));
  }
}
