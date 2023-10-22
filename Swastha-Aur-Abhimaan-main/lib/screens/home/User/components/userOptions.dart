import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/event/view/pages/eventView.dart';
import 'package:swastha_aur_swabhimaan/screens/nutrition/nutrition.dart';
import 'package:swastha_aur_swabhimaan/screens/education/education.dart';
import 'package:swastha_aur_swabhimaan/screens/medical/medicalPage.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/upload/presUp.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/components/carousel.dart';
import 'package:swastha_aur_swabhimaan/screens/skillDevelopment/skillDevelopment.dart';

// ignore: must_be_immutable
class UserOptions extends StatefulWidget {
  String name;
  String village;
  UserOptions({Key? key, required this.name, required this.village})
      : super(key: key);

  @override
  State<UserOptions> createState() => _UserOptionsState();
}

class _UserOptionsState extends State<UserOptions> {
  bool sick = false;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(hours: 12), (timer) {
      setState(() {
        sick = !sick;
      });
    });
  }

  capitalize(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Text(
              'Welcome',
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.08,
                // fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Text(
              capitalize(widget.name),
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.1,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          const SizedBox(
            child: ImageCarousel(),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.03, right: size.width * 0.03),
            child: Container(
              padding: EdgeInsets.all(size.width * 0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: const Color.fromARGB(255, 157, 135, 149),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'See our Latest Events',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      nextScreen(context, const EventView());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 157, 135, 149),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Text(
                      'Go to Events',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          sicks(),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  nextScreen(context, const Education());
                },
                child: Container(
                  width: size.width * 0.45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                      bottomLeft: Radius.circular(17),
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0.0,
                          3.0,
                        ),
                        blurRadius: 8.0,
                        // spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                      bottomLeft: Radius.circular(17),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.asset(
                      'Assets/images/edu.png',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  nextScreen(
                      context,
                      MedicalPage(
                        village: widget.village,
                      ));
                },
                child: Container(
                  width: size.width * 0.45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(17),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0.0,
                          3.0,
                        ),
                        blurRadius: 8.0,
                        // spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(17),
                    ),
                    child: Image.asset(
                      'Assets/images/medical.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  nextScreen(
                      context,
                      const SkillDevelopment(
                        isUser: true,
                      ));
                },
                child: Container(
                  width: size.width * 0.45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(17),
                      bottomRight: Radius.circular(17),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0.0,
                          3.0,
                        ),
                        blurRadius: 8.0,
                        // spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(17),
                      bottomRight: Radius.circular(17),
                    ),
                    child: Image.asset(
                      'Assets/images/skill.png',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  nextScreen(context, const Nutrition());
                },
                child: Container(
                  width: size.width * 0.45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(17),
                      bottomLeft: Radius.circular(17),
                      bottomRight: Radius.circular(17),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0.0,
                          3.0,
                        ),
                        blurRadius: 8.0,
                        // spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(17),
                      bottomLeft: Radius.circular(17),
                      bottomRight: Radius.circular(17),
                    ),
                    child: Image.asset('Assets/images/nutrition.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }

  Visibility sicks() {
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: !sick,
      child: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.03),
        child: Container(
          padding: EdgeInsets.all(size.width * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: const Color.fromARGB(255, 157, 135, 149),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Are you feeling sick?',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontFamily: 'Lexend',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      nextScreen(context, const PresUp());
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontFamily: 'Lexend',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                    child: const VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sick = true;
                      });
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontFamily: 'Lexend',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
