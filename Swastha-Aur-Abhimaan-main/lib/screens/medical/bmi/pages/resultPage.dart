// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class ResultPage extends StatelessWidget {
  final bool isMale;
  final double result;
  final int age;
  final int weight;
  final double height;

  const ResultPage(
      {Key? key,
      required this.result,
      required this.age,
      required this.isMale,
      required this.weight,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
          barColor: Color.fromARGB(255, 141, 155, 184),
          tiColor: Colors.black,
          title: 'BMI Result',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: size.width * 0.3,
              lineWidth: 15.0,
              animation: true,
              animationDuration: 1200,
              percent: result / 40,
              center: Text(
                result.toDouble().toStringAsFixed(1),
                style: TextStyle(
                    fontSize: size.width * 0.2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend'),
              ),
              progressColor: result < 18.5
                  ? Colors.blue
                  : result < 25 && result > 18.5
                      ? Colors.green
                      : result < 30 && result > 25
                          ? Colors.orange
                          : Colors.red,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      isMale
                          ? Icon(
                              Icons.male,
                              size: size.width * 0.12,
                            )
                          : const Icon(Icons.female),
                      isMale
                          ? Text(
                              'Male',
                              style: TextStyle(
                                  fontFamily: "Lexend",
                                  fontSize: size.width * 0.05),
                            )
                          : Text(
                              "Female",
                              style: TextStyle(
                                  fontFamily: "Lexend",
                                  fontSize: size.width * 0.05),
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
                        '$age',
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
                        '$weight',
                        style: TextStyle(
                            fontFamily: "Lexend", fontSize: size.width * 0.09),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Weight",
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
                        height.toDouble().toStringAsFixed(1),
                        style: TextStyle(
                            fontFamily: "Lexend", fontSize: size.width * 0.09),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Height',
                        style: TextStyle(
                            fontFamily: "Lexend", fontSize: size.width * 0.05),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              result < 18.5
                  ? "Underweight"
                  : result < 25 && result > 18.5
                      ? "Normal"
                      : result < 30 && result > 25
                          ? "Overweight"
                          : "Obese",
              style: TextStyle(
                  fontFamily: "Lexend",
                  fontSize: size.width * 0.1,
                  fontWeight: FontWeight.bold,
                  color: result < 18.5
                      ? Colors.blue
                      : result < 25 && result > 18.5
                          ? Colors.green
                          : result < 30 && result > 25
                              ? Colors.orange
                              : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
