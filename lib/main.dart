import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/login/login_ui.dart';
import 'package:shopping_app/screens/register/register_ui.dart';
import 'package:shopping_app/utills/size_config.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shopping_app/utills/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool checkIntro = false;

  Future introScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checkIntro = prefs.getBool('counter') ?? false;

  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constrains, orientation);
            return FutureBuilder(
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                return FutureBuilder(
                  future: introScreen(),
                  builder: (context, snapshot) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: AppTheme.lightTheme,
                      home: checkIntro ? LoginUi() : IntroScreen(),
                      routes: {
                        LoginUi.id: (context) => LoginUi(),
                        RegisterUi.id: (context) => RegisterUi(),
                      },
                    );
                  },
                );
              },

            );
          },
        );
      },
    );
  }
}

class IntroScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Welcome to QRCreate',
      subTitle: 'Easiest and fastest way to create your own QR code',
      imageUrl: 'assets/grow.png',
    ),
    Introduction(
      title: 'Create and Share QR code',
      subTitle: 'Generate QR code for Website or a text and share it across',
      imageUrl: 'assets/desktop.png',
    ),
    Introduction(
      title: 'Scan any QR code',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/social.png',
    ),
  ];

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('counter') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginUi(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}