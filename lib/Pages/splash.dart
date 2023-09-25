import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellit/Onboarding/OnboardingScreen.dart';
import 'package:wellit/Pages/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "Login";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: SvgPicture.asset(
                fit: BoxFit.contain,
                alignment: Alignment.center,
                "assets/icons/logo.svg"),
          ),
        ]),
      ),
    );
  }

  whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.get(KEYLOGIN);
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);
    Timer(Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(name: ""),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => OnbordingScreen(),
          ));
        }
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => OnbordingScreen()));
      }
    });
  }
}
