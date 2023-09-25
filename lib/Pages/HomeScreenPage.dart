import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellit/Pages/ViaMap.dart';
import 'package:wellit/Pages/ViaState.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Choose Your Location",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 18,
          ),
          ButtonTheme(
            height: 30,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ViaMap()));
                },
                child: Text(
                  "Via Maps",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 46, 110, 1),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(8),
                  fixedSize: Size.fromWidth(300),
                )),
          ),
          SizedBox(
            height: 12,
          ),
          ButtonTheme(
            height: 30,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ViaState()));
                },
                style: TextButton.styleFrom(
                  fixedSize: Size.fromWidth(300),
                  backgroundColor: Color.fromRGBO(0, 46, 110, 1),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Via State",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
          )
        ],
      ),
    );
  }
}
