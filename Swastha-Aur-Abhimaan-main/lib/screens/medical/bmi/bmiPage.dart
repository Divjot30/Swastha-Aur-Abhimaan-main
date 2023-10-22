import 'dart:math';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/screens/medical/bmi/pages/resultPage.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  bool isMale = true;
  double height = 180.0;
  int weight = 40;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: const CustomAppBar(
            barColor: Color.fromARGB(255, 141, 155, 184),
            tiColor: Colors.black,
            title: 'Calculate your BMI',
          )),
      body: Column(
        children: [
          /*Male or Female Section*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                          color: isMale
                              ? const Color.fromARGB(255, 87, 170, 238)
                              : Colors.white,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.male,
                                size: 100.0,
                                color: Color.fromRGBO(10, 15, 30, 1.0),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: const Color.fromRGBO(10, 15, 30, 1.0)
                                      .withOpacity(0.8),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                          color: !isMale
                              ? const Color.fromARGB(255, 255, 105, 155)
                              : Colors.white,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.female,
                                size: 100.0,
                                color: Color.fromRGBO(10, 15, 30, 1.0),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: const Color.fromRGBO(10, 15, 30, 1.0)
                                      .withOpacity(0.8),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /*Height Section*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
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
                        "HEIGHT",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: const Color.fromRGBO(10, 15, 30, 1.0)
                              .withOpacity(0.8),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${height.round()}",
                            style: const TextStyle(
                              color: Color.fromRGBO(10, 15, 30, 1.0),
                              fontSize: 60.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            "CM",
                            style: TextStyle(
                              color: Color.fromRGBO(10, 15, 30, 1.0),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        min: 80.0,
                        max: 220.0,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        activeColor: const Color.fromARGB(255, 160, 161, 173),
                        inactiveColor: const Color.fromARGB(255, 88, 89, 104),
                        thumbColor: const Color.fromARGB(255, 230, 20, 73),
                      ),
                    ]),
              ),
            ),
          ),

          /*Weight and Age Section*/
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(10, 15, 30, 1.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: const Color.fromRGBO(10, 15, 30, 1.0)
                                .withOpacity(0.8),
                          ),
                        ),
                        Text(
                          "$weight",
                          style: const TextStyle(
                            color: Color.fromRGBO(10, 15, 30, 1.0),
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag: 'Weight-',
                              mini: true,
                              child: const Icon(
                                Icons.remove,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.green,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              heroTag: 'Weight+',
                              mini: true,
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(10, 15, 30, 1.0),
                      ),
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
                          ),
                        ),
                        Text(
                          "$age",
                          style: const TextStyle(
                            color: Color.fromRGBO(10, 15, 30, 1.0),
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag: 'age-',
                              mini: true,
                              child: const Icon(
                                Icons.remove,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.green,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              heroTag: 'age+',
                              mini: true,
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          /*Calculate Button Section*/
          Container(
            width: double.infinity,
            height: size.height * 0.08,
            color: const Color.fromARGB(255, 141, 155, 184),
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                nextScreen(
                    context,
                    ResultPage(
                        result: result,
                        isMale: isMale,
                        age: age,
                        weight: weight,
                        height: height));
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.05,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
