import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/visibleOption.dart';

class HighBloodPressureSuggestion extends StatefulWidget {
  const HighBloodPressureSuggestion({Key? key}) : super(key: key);

  @override
  State<HighBloodPressureSuggestion> createState() =>
      _HighBloodPressureSuggestionState();
}

class _HighBloodPressureSuggestionState
    extends State<HighBloodPressureSuggestion> {
  bool b0Clicked = true;
  bool b1Clicked = false;
  bool b2Clicked = false;
  bool b3Clicked = false;
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
                "High Blood Pressure",
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
                              b3Clicked = false;
                            });
                          },
                          child: OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                              click: b0Clicked, label: 'Remedies')),
                      SizedBox(width: size.width * 0.02),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              b1Clicked = !b1Clicked;
                              b0Clicked = false;
                              b2Clicked = false;
                              b3Clicked = false;
                            });
                          },
                          child:
                              OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),click: b1Clicked, label: 'About')),
                      SizedBox(width: size.width * 0.02),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              b0Clicked = false;
                              b1Clicked = false;
                              b2Clicked = !b2Clicked;
                              b3Clicked = false;
                            });
                          },
                          child: OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                              click: b2Clicked, label: 'Symptoms')),
                      SizedBox(width: size.width * 0.02),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              b0Clicked = false;
                              b1Clicked = false;
                              b2Clicked = false;
                              b3Clicked = !b3Clicked;
                            });
                          },
                          child: OptionBarModel(borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                              click: b3Clicked, label: 'Causes')),
                    ],
                  )),
              SizedBox(height: size.height * 0.02),
              VisibleOption(
                click: b0Clicked,
                label: 'Remedies',
                toDisplay: highBPRemedies,
              ),
              VisibleOption(
                click: b1Clicked,
                label: 'About',
                toDisplay: highBPAbout,
              ),
              VisibleOption(
                click: b2Clicked,
                label: 'Symptoms',
                toDisplay: highBPSymp,
              ),
              VisibleOption(
                click: b3Clicked,
                label: 'Causes',
                toDisplay: highBPCause,
              ),
            ])),
      ),
    );
  }
}
