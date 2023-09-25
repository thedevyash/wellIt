import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellit/Onboarding/OnbComponents/login.dart';
import 'package:wellit/Onboarding/OnbComponents/login_field.dart';
import 'package:wellit/Onboarding/controllers/controller.dart';
import 'package:wellit/Pages/splash.dart';
import 'package:wellit/buttons/gradientButton.dart';
import 'package:wellit/buttons/social_button.dart';
import 'package:wellit/services/auth.dart';

class Signup extends StatefulWidget {
  Signup({super.key});
  bool showloading = false;
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
            child: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 45,
                color: Color.fromRGBO(0, 46, 110, 1),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SocialButton(
              iconPath: 'assets/icons/g_logo.svg', label: "Google"),
          const SocialButton(
            iconPath: 'assets/icons/f_logo.svg',
            label: "Facebook",
            horizontalPadding: 60,
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              "or",
              style:
                  TextStyle(fontSize: 20, color: Color.fromRGBO(0, 46, 110, 1)),
            ),
          ),
          const SizedBox(
            height: 5,
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
          SizedBox(
            height: 5,
          ),
          Gradient_Button(
            button: () async {
              if (Controller.usernamecontroller.text.isEmpty ||
                  Controller.passwordcontroller.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Enter required details")));
              } else {
                setState(() {
                  widget.showloading = true;
                });
                await AuthServices().registerUser(
                    Controller.usernamecontroller.text,
                    Controller.passwordcontroller.text,
                    context);
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                setState(() {
                  widget.showloading = false;
                });
              }
            },
            label: "Sign Up",
            showloading: widget.showloading,
          ),
          SizedBox(
            height: 10,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  Controller.usernamecontroller.clear();
                  Controller.passwordcontroller.clear();
                  return const Loginscreen();
                },
              ));
            },
            elevation: 0,
            fillColor: Color.fromRGBO(0, 46, 110, 1),
            child: const Icon(
              color: Colors.white,
              Icons.arrow_back_ios_new_rounded,
              size: 25.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          )
        ],
      ),
    ));
  }
}
