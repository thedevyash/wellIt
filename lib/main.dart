import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wellit/Onboarding/OnboardingScreen.dart';
import 'package:wellit/Pages/splash.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 1));
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA9KfKuHbupMTcmnkaPIyadiBuV6MxuSDY", // Your apiKey
      appId: "1:59921787046:android:55a3e6141182fc83372c67", // Your appId
// Your messagingSenderId
      projectId: "wellit-a650b",
      messagingSenderId: 'sharmu', // Your projectId
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
