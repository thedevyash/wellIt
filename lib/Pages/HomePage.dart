import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellit/Onboarding/OnboardingScreen.dart';
import 'package:wellit/Onboarding/controllers/controller.dart';
import 'package:wellit/Pages/PagesList.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellit/Pages/splash.dart';

class HomePage extends StatefulWidget {
  final name;
  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                "Version 1.0.0",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Github",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut().then((value) async {
                      Controller.usernamecontroller.clear();
                      Controller.passwordcontroller.clear();
                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreenState.KEYLOGIN, false);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OnbordingScreen()));
                    });
                  },
                  child: Text(
                    "LogOut",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
      appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu)),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
          ],
          centerTitle: true,
          title: Text(
            "Well It !",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          )),
      body: Container(child: pages.elementAt(selectedindex)),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: GoogleFonts.poppins(),
        selectedIconTheme: IconThemeData(color: Colors.blue),
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_rounded), label: "Connect"),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("assets/images/Chatbot.svg",
                  color: Colors.blue),
              icon: SvgPicture.asset(
                "assets/images/Chatbot.svg",
              ),
              label: "Chatbot"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings")
        ],
        currentIndex: selectedindex,
        onTap: _onItemTapped,
      ),
    );
  }
}
