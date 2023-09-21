import 'package:flutter/material.dart';
import 'package:wellit/Pages/PagesList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      appBar: AppBar(title: Text("WellIt")),
      body: pages.elementAt(selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_rounded), label: "Community"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded), label: "Chatbot"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
        currentIndex: selectedindex,
        onTap: _onItemTapped,
      ),
    );
  }
}
