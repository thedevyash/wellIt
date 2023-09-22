import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wellit/Onboarding/OnboardingScreen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 1));
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA9KfKuHbupMTcmnkaPIyadiBuV6MxuSDY", // Your apiKey
      appId: "1:59921787046:android:55a3e6141182fc83372c67", // Your appId
// Your messagingSenderId
      projectId: "wellit-a650b",
      messagingSenderId: 'sharmu', // Your projectId
    ),
  );
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
        home: OnbordingScreen());
  }
}
