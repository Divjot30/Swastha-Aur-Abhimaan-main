// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/sugar/low/lowBloodSugarSuggestion.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/sugar/high/highBloodSugarSuggestion.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  bool fbs;
  bool bm;
  bool am;
  bool ab;
  double age;
  String result;
  double bp;
  ResultPage(
      {Key? key,
      required this.fbs,
      required this.bm,
      required this.ab,
      required this.am,
      required this.age,
      required this.bp,
      required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: const CustomAppBar(
            barColor:  Color.fromARGB(255, 141, 155, 184),
            tiColor: Colors.black,
            title: 'Blood Sugar Result',
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: size.width * 0.7,
              height: size.height * 0.4,
              child: SfRadialGauge(
                animationDuration: 8000,
                enableLoadingAnimation: true,
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 40,
                        color: Colors.green,
                      ),
                      GaugeRange(
                        startValue: 40,
                        endValue: 70,
                        color: Colors.amber[700],
                      ),
                      GaugeRange(
                        startValue: 70,
                        endValue: 100,
                        color: Colors.red,
                      ),
                    ],
                    pointers: [
                      NeedlePointer(
                        value: result == "Normal"
                            ? 30
                            : result == "Prediabetes"
                                ? 60
                                : result == "Diabetes"
                                    ? 100
                                    : 50,
                        enableAnimation: true,
                        animationType: AnimationType.ease,
                        animationDuration: 5000,
                      ),
                    ],
                    annotations: [
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            result == "Normal"
                                ? "Normal"
                                : result == "Prediabetes"
                                    ? "Prediabetes"
                                    : result == "Diabetes"
                                        ? "Diabetes"
                                        : "Unknown",
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lexend',
                                color: result == "Normal"
                                    ? Colors.green
                                    : result == "Prediabetes"
                                        ? Colors.amber[700]
                                        : result == "Diabetes"
                                            ? Colors.red
                                            : Colors.black),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: size.height * 0.05,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                child: Column(
                  children: [
                    fbs
                        ? Text(
                            "After Fasting",
                            style: TextStyle(
                                fontFamily: "Lexend",
                                fontSize: size.width * 0.08),
                          )
                        : bm
                            ? Text(
                                "Before Meal",
                                style: TextStyle(
                                    fontFamily: "Lexend",
                                    fontSize: size.width * 0.08),
                              )
                            : am
                                ? Text(
                                    "After Meal",
                                    style: TextStyle(
                                        fontFamily: "Lexend",
                                        fontSize: size.width * 0.08),
                                  )
                                : ab
                                    ? Text(
                                        "At Bed Time",
                                        style: TextStyle(
                                            fontFamily: "Lexend",
                                            fontSize: size.width * 0.08),
                                      )
                                    : Text(
                                        "Unknown",
                                        style: TextStyle(
                                            fontFamily: "Lexend",
                                            fontSize: size.width * 0.08),
                                      ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text('Meal Time',
                        style: TextStyle(
                            fontFamily: "Lexend", fontSize: size.width * 0.05))
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
                child: const VerticalDivider(
                  thickness: 1.0,
                  color: Colors.black,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      age.round().toString(),
                      style: TextStyle(
                          fontFamily: "Lexend", fontSize: size.width * 0.09),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                          fontFamily: "Lexend", fontSize: size.width * 0.05),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
                child: const VerticalDivider(
                  thickness: 1.0,
                  color: Colors.black,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      bp.round().toString(),
                      style: TextStyle(
                          fontFamily: "Lexend", fontSize: size.width * 0.09),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Blood Suagr Level",
                      style: TextStyle(
                          fontFamily: "Lexend", fontSize: size.width * 0.05),
                    )
                  ],
                ),
              ),
            ]),
            // // isMale
            // //     ? MaleIcon(isMale: isMale)
            // //     : FemaleIcon(
            // //         isMale: isMale,
            // //       ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              result,
              style: TextStyle(
                  fontFamily: "Lexend",
                  fontSize: size.width * 0.1,
                  fontWeight: FontWeight.bold,
                  color: result == "Normal"
                      ? Colors.green
                      : result == "Prediabetes"
                          ? Colors.amber[700]
                          : result == "Diabetes"
                              ? Colors.red
                              : Colors.black),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            TextButton(
              onPressed: () {
                if (result == 'Normal') {
                  nextScreen(context, const LowBloodSugarSuggestion());
                } else if (result == 'Prediabetes' || result == 'Diabetes') {
                  nextScreen(context, const HighBloodSugarSuggestion());
                }
              },
              child: Text(
                'View Suggestions',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: size.width * 0.05,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
