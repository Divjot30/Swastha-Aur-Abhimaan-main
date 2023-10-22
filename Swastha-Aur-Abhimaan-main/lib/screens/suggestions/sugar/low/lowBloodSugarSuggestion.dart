import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/visibleOption.dart';

class LowBloodSugarSuggestion extends StatefulWidget {
  const LowBloodSugarSuggestion({Key? key}) : super(key: key);

  @override
  State<LowBloodSugarSuggestion> createState() =>
      _LowBloodSugarSuggestionState();
}

class _LowBloodSugarSuggestionState extends State<LowBloodSugarSuggestion> {
  bool b0Clicked = true;
  bool b1Clicked = false;
  bool b2Clicked = false;
  bool b4Clicked = false;
  bool b5Clicked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.05,
                right: size.width * 0.05),
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Low Blood Sugar",
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontFamily: "Lexend",
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              b0Clicked = !b0Clicked;
                              b1Clicked = false;
                              b2Clicked = false;
                              b4Clicked = false;
                              b5Clicked = false;
                            });
                          },
                          child: OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                              click: b0Clicked, label: 'Candies')),
                      SizedBox(width: size.width * 0.02),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              b1Clicked = !b1Clicked;
                              b0Clicked = false;
                              b2Clicked = false;
                              b4Clicked = false;
                              b5Clicked = false;
                            });
                          },
                          child: OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                              click: b1Clicked, label: 'Beverages')),
                      SizedBox(width: size.width * 0.02),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              b2Clicked = !b2Clicked;
                              b0Clicked = false;
                              b1Clicked = false;
                              b4Clicked = false;
                              b5Clicked = false;
                            });
                          },
                          child: OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                              click: b2Clicked, label: 'Fruits')),
                      SizedBox(width: size.width * 0.02),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              b4Clicked = !b4Clicked;
                              b0Clicked = false;
                              b1Clicked = false;
                              b2Clicked = false;
                              b5Clicked = false;
                            });
                          },
                          child: OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                              click: b4Clicked, label: 'About & Cause')),
                      SizedBox(width: size.width * 0.02),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              b5Clicked = !b5Clicked;
                              b0Clicked = false;
                              b1Clicked = false;
                              b2Clicked = false;
                              b4Clicked = false;
                            });
                          },
                          child: OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                              click: b5Clicked, label: 'Symptoms')),
                    ],
                  )),
              SizedBox(height: size.height * 0.02),
              VisibleOption(
                click: b0Clicked,
                label: 'Candies and Other Sweets',
                toDisplay: lowBloodSugarCandy,
              ),
              VisibleOption(
                click: b1Clicked,
                label: 'Beverages',
                toDisplay: lowBloodSugarBev,
              ),
              VisibleOption(
                click: b2Clicked,
                label: 'Fruits',
                toDisplay: lowBloodSugarFruits,
              ), 
              VisibleOption(
                click: b4Clicked,
                label: 'About & Cause',
                toDisplay: lowBloodSugarAbout,
              ),
              VisibleOption(
                click: b5Clicked,
                label: 'Symptoms',
                toDisplay: lowBloodSugarSymp,
              ),
            ])),
      ),
    );
  }
}
