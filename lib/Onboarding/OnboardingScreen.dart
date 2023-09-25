import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:wellit/Onboarding/OnbComponents/animated_btn.dart';
import 'package:wellit/Onboarding/OnbComponents/login.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  bool isShowSignInDialog = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/images/background/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/rive/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 60,
                        child: Image.asset(
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                            'assets/images/logo.png')),
                    SizedBox(
                      width: 280,
                      child: Column(
                        children: [
                          Text("Well It",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 52, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          Text(
                            textAlign: TextAlign.center,
                            "Use this tool to predict wheather construction of well is possible or not in your location.",
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Loginscreen()));
                      },
                    ),
                    SizedBox(
                      height: 26,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
