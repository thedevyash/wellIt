import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellit/Onboarding/OnbComponents/login_field.dart';
import 'package:wellit/Onboarding/OnbComponents/signup.dart';
import 'package:wellit/Onboarding/controllers/controller.dart';
import 'package:wellit/Pages/HomePage.dart';
import 'package:wellit/Pages/splash.dart';
import 'package:wellit/buttons/gradientButton.dart';
import 'package:wellit/buttons/social_button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Loginscreen> {
  bool showloading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 28,
            ),
            CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 60,
                child: Image.asset(
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                    'assets/images/logo.png')),
            Center(
              child: Text('Sign In/Up',
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(0, 45, 110, 1),
                      fontSize: 45,
                      fontWeight: FontWeight.bold)),
            ),
            const SocialButton(
                iconPath: 'assets/icons/g_logo.svg', label: "Google"),
            const SocialButton(
              iconPath: 'assets/icons/f_logo.svg',
              label: "Facebook",
              horizontalPadding: 90,
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                "or",
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(0, 185, 241, 1)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            LoginField(
              textEditingController: Controller.usernamecontroller,
              hint: "Username",
            ),
            const SizedBox(
              height: 10,
            ),
            LoginField(
              textEditingController: Controller.passwordcontroller,
              hint: "Password",
            ),
            const SizedBox(
              height: 10,
            ),
            Gradient_Button(
              button: () async {
                if (Controller.usernamecontroller.text.isEmpty ||
                    Controller.passwordcontroller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter Login details")));
                } else {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: Controller.usernamecontroller.text,
                        password: Controller.passwordcontroller.text);
                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return HomePage(name: "");
                      },
                    ));
                  } catch (e) {
                    print(e.toString());
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                }
              },
              label: "Log In",
              showloading: showloading,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          Controller.usernamecontroller.clear();
                          Controller.passwordcontroller.clear();
                          return Signup();
                        },
                      ));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
