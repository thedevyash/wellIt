import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellit/Pages/HomePage.dart';
import 'package:wellit/Pages/HomeScreenPage.dart';
import 'package:wellit/Pages/Result.dart';
import 'package:wellit/utils/constant.dart';

class ViaState extends StatefulWidget {
  const ViaState({super.key});

  @override
  State<ViaState> createState() => ViaStateState();
}

class ViaStateState extends State<ViaState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Select Your Location",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 35)),
                  SizedBox(
                    height: 70,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownMenuTheme(
                                data: DropdownMenuThemeData(
                                    menuStyle: MenuStyle(
                                        elevation:
                                            MaterialStatePropertyAll(12))),
                                child: DropDown(
                                  icon: Icon(Icons.arrow_drop_down_rounded),
                                  items: [
                                    'Andhra Pradesh',
                                    'Arunachal Pradesh',
                                    'Assam',
                                    'Bihar',
                                    'Chhattisgarh',
                                    'Goa',
                                    'Gujarat',
                                    'Haryana',
                                    'Himachal Pradesh',
                                    'Jharkhand',
                                    'Karnataka',
                                    'Kerala',
                                    'Madhya Pradesh',
                                    'Maharashtra',
                                    'Manipur',
                                    'Meghalaya',
                                    'Mizoram',
                                    'Nagaland',
                                    'Odisha',
                                    'Punjab',
                                    'Rajasthan',
                                    'Sikkim',
                                    'Tamil Nadu',
                                    'Telangana',
                                    'Tripura',
                                    'Uttar Pradesh',
                                    'Uttarakhand',
                                    'West Bengal',
                                  ],
                                  hint: Text(
                                    'Select State',
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDistrict = null;
                                      selectedBlock = null;
                                      selectedTehsil = null;
                                      selectedState = value!;
                                      print(selectedDistrict);
                                    });
                                  },
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropDown(
                        icon: Icon(Icons.arrow_drop_down_rounded),
                        items: selectedState != null
                            ? district[states.indexOf(selectedState)]
                            : [],
                        hint: Text('Select District',
                            style: GoogleFonts.poppins(fontSize: 16)),
                        onChanged: (value) {
                          setState(() {
                            selectedDistrict = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropDown(
                        icon: Icon(Icons.arrow_drop_down_rounded),
                        items: selectedDistrict == "Ajmer" &&
                                selectedState == "Rajasthan"
                            ? tehsil
                            : [],
                        hint: Text('Select Tehsil',
                            style: GoogleFonts.poppins(fontSize: 16)),
                        onChanged: (value) {
                          setState(() {
                            selectedTehsil = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DropDown(
                        icon: Icon(Icons.arrow_drop_down_rounded),
                        items: selectedTehsil != null &&
                                selectedDistrict == "Ajmer" &&
                                selectedState == "Rajasthan"
                            ? blocks[tehsil.indexOf(selectedTehsil)]
                            : [],
                        hint: Text('Select Block',
                            style: GoogleFonts.poppins(fontSize: 16)),
                        onChanged: (value) {
                          setState(() {
                            selectedBlock = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        if (selectedState != null && selectedDistrict != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Result()));
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(0, 46, 110, 1),
                          foregroundColor: Colors.white,
                          fixedSize: Size(250, 60),
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                      child: Text("Submit",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white)))
                ],
              )),
        ),
      ),
    );
  }
}
