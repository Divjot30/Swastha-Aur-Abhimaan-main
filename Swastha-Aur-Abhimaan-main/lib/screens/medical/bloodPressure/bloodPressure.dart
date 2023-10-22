import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/screens/medical/bloodPressure/pages/resultPage.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  State<BloodPressure> createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  bool isMale = true;
  double age = 20.0;
  double systolic = 120.0;
  double diastolic = 80.0;
  String result = '';

  calculateBloodPressure() {
    if (systolic <= 120 && diastolic <= 80) {
      result = 'Normal';
    } else if (systolic > 120 && systolic <= 129 && diastolic < 80) {
      result = 'Pre-Hypertension';
    } else if (systolic >= 130 && systolic <= 139 && diastolic >= 80) {
      result = 'High Blood Pressure (Hypertension) Stage 1';
    } else if (systolic >= 140 && systolic <= 180 && diastolic >= 80) {
      result = 'High Blood Pressure (Hypertension) Stage 2';
    } else if (systolic > 180 && diastolic > 120) {
      result = 'Hypertensive Crisis';
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
            title: 'Check Your Blood Pressure',
          )),
      body: Container(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.05),
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
                      padding: EdgeInsets.all(size.width * 0.05),
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
            SizedBox(
              height: size.width * 0.03,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: size.width * 0.03, bottom: size.width * 0.03),
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
              height: size.width * 0.03,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.4,
                      padding: EdgeInsets.only(
                          top: size.width * 0.05, bottom: size.width * 0.03),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(18),
                          bottomRight: Radius.circular(75),
                          bottomLeft: Radius.circular(18),
                          topLeft: Radius.circular(18),
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
                            "SYSTOLIC",
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
                                "${systolic.round()}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(10, 15, 30, 1.0),
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Lexend',
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: systolic,
                            min: 75,
                            max: 200,
                            onChanged: (value) {
                              setState(() {
                                systolic = value;
                              });
                            },
                            activeColor:
                                const Color.fromARGB(255, 160, 161, 173),
                            inactiveColor:
                                const Color.fromARGB(255, 88, 89, 104),
                            thumbColor: const Color.fromARGB(255, 230, 20, 73),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.4,
                      padding: EdgeInsets.only(
                          top: size.width * 0.05, bottom: size.width * 0.03),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                          bottomLeft: Radius.circular(75),
                          topLeft: Radius.circular(18),
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
                            "DIASTOLIC",
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
                                "${diastolic.round()}",
                                style: const TextStyle(
                                  color: Color.fromRGBO(10, 15, 30, 1.0),
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Lexend',
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: diastolic,
                            min: 50,
                            max: 150,
                            onChanged: (value) {
                              setState(() {
                                diastolic = value;
                              });
                            },
                            activeColor:
                                const Color.fromARGB(255, 160, 161, 173),
                            inactiveColor:
                                const Color.fromARGB(255, 88, 89, 104),
                            thumbColor: const Color.fromARGB(255, 230, 20, 73),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                    '${systolic.toStringAsFixed(0)}/${diastolic.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: const Color.fromRGBO(10, 15, 30, 1.0)
                          .withOpacity(0.8),
                      fontFamily: 'Lexend',
                    )),
              ],
            ),
            Text(
              'mmHg',
              style: TextStyle(
                fontSize: 20.0,
                color: const Color.fromRGBO(10, 15, 30, 1.0).withOpacity(0.8),
                fontFamily: 'Lexend',
              ),
            ),
            SizedBox(
              height: size.width * 0.05,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      calculateBloodPressure();
                      nextScreen(
                          context,
                          ResultPage(
                            systolic: systolic,
                            diastolic: diastolic,
                            result: result,
                            age: age,
                            isMale: isMale,
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.9, size.height * 0.07),
                      backgroundColor: const Color.fromARGB(255, 141, 155, 184),
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
    );
  }
}
