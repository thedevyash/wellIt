import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellit/Pages/HomeScreenPage.dart';
import 'package:wellit/Pages/ViaState.dart';
import 'package:wellit/utils/constant.dart';
import 'dart:math';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int? perc;
  int? percwaterindex;
  double? percwaterlevel;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    percwaterindex = random.nextInt(3);
    perc = 20 + random.nextInt(40);
    percwaterlevel = random.nextDouble() + 5;
    percwaterlevel = double.parse(percwaterlevel!.toStringAsFixed(2));
    List<String> waterQuality = ["Not Suitable", "Moderate", "Moderately Safe"];
    var qual = waterQuality[percwaterindex!];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          textAlign: TextAlign.center,
          "Results",
          style: GoogleFonts.poppins(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            selectedDistrict = null;
            selectedBlock = null;
            selectedTehsil = null;
            selectedState = null;
            Navigator.of(context).pop();
            // setState(() {});
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(14),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 200,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Card(
                      elevation: 6,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Your Location",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text("State",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "$selectedState",
                                    style: GoogleFonts.poppins(fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("District",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "$selectedDistrict",
                                    style: GoogleFonts.poppins(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Tehsil",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "$selectedTehsil",
                                    style: GoogleFonts.poppins(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Block",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "$selectedBlock",
                                    style: GoogleFonts.poppins(fontSize: 20),
                                  )
                                ],
                              )
                            ]),
                      ),
                      color: Color.fromRGBO(238, 238, 238, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Card(
                      elevation: 6,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(children: [
                          Text("Well Prediction",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              perc! < 40
                                  ? SizedBox(
                                      width: 150,
                                      child: Text(
                                        "It Will Be Difficult To Construct The Well",
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                    )
                                  : SizedBox(
                                      width: 150,
                                      child: Text(
                                          "Well Can Be Constructed If Proper Technique Is Used",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16)),
                                    ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "$perc%",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ]),
                      ),
                      color: Color.fromRGBO(238, 238, 238, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Card(
                      elevation: 6,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(children: [
                          Text("Ground Water Quality",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: 20,
                          ),
                          Text("$qual",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ]),
                      ),
                      color: Color.fromRGBO(238, 238, 238, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Card(
                      elevation: 6,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Column(
                          children: [
                            Text("Depth Of Ground Water",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "$percwaterlevel m",
                              style: GoogleFonts.poppins(fontSize: 24),
                            )
                          ],
                        ),
                      ),
                      color: Color.fromRGBO(238, 238, 238, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
