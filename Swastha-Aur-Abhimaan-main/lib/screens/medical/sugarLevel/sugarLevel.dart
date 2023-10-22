import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/screens/medical/sugarLevel/pages/resultPage.dart';

class SugarLevel extends StatefulWidget {
  const SugarLevel({Key? key}) : super(key: key);

  @override
  State<SugarLevel> createState() => _SugarLevelState();
}

class _SugarLevelState extends State<SugarLevel> {
  double age = 30;
  bool fbs = true;
  bool bm = false;
  bool am = false;
  bool ab = false;
  double bgl = 99.0;
  String result = "";

  calculateRes() {
    if (fbs) {
      if (bgl < 70) {
        result = "Low";
      } else if (bgl > 70 && bgl < 100) {
        result = "Normal";
      } else if (bgl > 100 && bgl < 125) {
        result = "Prediabetes";
      } else if (bgl > 125) {
        result = "Diabetes";
      }
    } else if (bm) {
      if (bgl < 70) {
        result = "Low";
      } else if (bgl > 70 && bgl < 100) {
        result = "Normal";
      } else if (bgl > 100 && bgl < 125) {
        result = "Prediabetes";
      } else if (bgl > 125) {
        result = "Diabetes";
      }
    } else if (am) {
      if (bgl < 70) {
        result = "Low";
      } else if (bgl > 70 && bgl < 100) {
        result = "Normal";
      } else if (bgl > 100 && bgl < 125) {
        result = "Prediabetes";
      } else if (bgl > 125) {
        result = "Diabetes";
      }
    } else if (ab) {
      if (bgl < 70) {
        result = "Low";
      } else if (bgl > 70 && bgl < 100) {
        result = "Normal";
      } else if (bgl > 100 && bgl < 125) {
        result = "Prediabetes";
      } else if (bgl > 125) {
        result = "Diabetes";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
          barColor: Color.fromARGB(255, 141, 155, 184),
          tiColor: Colors.black,
          title: 'Check Your Sugar Level',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              // age slider
              Container(
                padding: EdgeInsets.only(
                    top: size.width * 0.05, bottom: size.width * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                  border: Border.all(
                    color: const Color.fromRGBO(10, 15, 30, 1.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromRGBO(10, 15, 30, 1.0)
                            .withOpacity(0.8),
                        fontFamily: 'Lexend',
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${age.round()}",
                          style: const TextStyle(
                            color: Color.fromRGBO(10, 15, 30, 1.0),
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          "YRS",
                          style: TextStyle(
                            color: Color.fromRGBO(10, 15, 30, 1.0),
                            fontSize: 20.0,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: age,
                      min: 2,
                      max: 110,
                      onChanged: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                      activeColor: const Color.fromARGB(255, 160, 161, 173),
                      inactiveColor: const Color.fromARGB(255, 88, 89, 104),
                      thumbColor: const Color.fromARGB(255, 230, 20, 73),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.04,
              ),
              // meal time
              Container(
                padding: EdgeInsets.only(
                    top: size.width * 0.05,
                    bottom: size.width * 0.03,
                    left: size.width * 0.02,
                    right: size.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                  border: Border.all(
                    color: const Color.fromRGBO(10, 15, 30, 1.0),
                  ),
                  // color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "MEAL TIME",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromRGBO(10, 15, 30, 1.0)
                            .withOpacity(0.8),
                        fontFamily: 'Lexend',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              fbs = true;
                              bm = false;
                              am = false;
                              ab = false;
                            });
                          },
                          child: Container(
                            width: size.width * 0.42,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: fbs
                                  ? const Color.fromARGB(255, 141, 155, 184)
                                  : const Color.fromARGB(255, 210, 212, 220),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'After\tFasting',
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 20.0,
                                    color: const Color.fromRGBO(10, 15, 30, 1.0)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  "Not eaten\nfor 8 hours",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 14.0,
                                    color: const Color.fromRGBO(10, 15, 30, 1.0)
                                        .withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              fbs = false;
                              bm = true;
                              am = false;
                              ab = false;
                            });
                          },
                          child: Container(
                            width: size.width * 0.42,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: bm
                                  ? const Color.fromARGB(255, 141, 155, 184)
                                  : const Color.fromARGB(255, 210, 212, 220),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Before\tMeal',
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 20.0,
                                    color: const Color.fromRGBO(10, 15, 30, 1.0)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  "Not eaten\nfor 2 hours",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 14.0,
                                    color: const Color.fromRGBO(10, 15, 30, 1.0)
                                        .withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              fbs = false;
                              bm = false;
                              am = true;
                              ab = false;
                            });
                          },
                          child: Container(
                            width: size.width * 0.42,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: am
                                  ? const Color.fromARGB(255, 141, 155, 184)
                                  : const Color.fromARGB(255, 210, 212, 220),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'After\tMeal',
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 20.0,
                                    color: const Color.fromRGBO(10, 15, 30, 1.0)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  "After 1 or 2\nhours of Eating",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 14.0,
                                    color: const Color.fromRGBO(10, 15, 30, 1.0)
                                        .withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              fbs = false;
                              bm = false;
                              am = false;
                              ab = true;
                            });
                          },
                          child: Container(
                            width: size.width * 0.42,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: ab
                                  ? const Color.fromARGB(255, 141, 155, 184)
                                  : const Color.fromARGB(255, 210, 212, 220),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'At\tBedtime',
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 20.0,
                                    color: const Color.fromRGBO(10, 15, 30, 1.0)
                                        .withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  "Before going\nto bed",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 14.0,
                                    color: const Color.fromRGBO(10, 15, 30, 1.0)
                                        .withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: size.width * 0.05, bottom: size.width * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                  border: Border.all(
                    color: const Color.fromRGBO(10, 15, 30, 1.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BLOOD SUGAR LEVEL",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: const Color.fromRGBO(10, 15, 30, 1.0)
                            .withOpacity(0.8),
                        fontFamily: 'Lexend',
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${bgl.round()}",
                          style: const TextStyle(
                            color: Color.fromRGBO(10, 15, 30, 1.0),
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          "mg/dL",
                          style: TextStyle(
                            color: Color.fromRGBO(10, 15, 30, 1.0),
                            fontSize: 20.0,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: bgl,
                      min: 60,
                      max: 250,
                      onChanged: (value) {
                        setState(() {
                          bgl = value;
                        });
                      },
                      activeColor: const Color.fromARGB(255, 160, 161, 173),
                      inactiveColor: const Color.fromARGB(255, 88, 89, 104),
                      thumbColor: const Color.fromARGB(255, 230, 20, 73),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateRes();
                        nextScreen(
                            context,
                            ResultPage(
                              fbs: fbs,
                              bp: bgl,
                              bm: bm,
                              am: am,
                              ab: ab,
                              age: age,
                              result: result,
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.9, size.height * 0.07),
                        backgroundColor:
                            const Color.fromARGB(255, 141, 155, 184),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lexend',
                          fontSize: size.width * 0.06,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
