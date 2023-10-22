import 'dart:async';

import 'package:flutter/material.dart';

import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/userCountModel.dart';
import 'package:swastha_aur_swabhimaan/screens/event/events.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/pages/allDoctors.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/pages/allTeachers.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/pages/allTrainers.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/pages/allUsers.dart';
import 'package:swastha_aur_swabhimaan/models/optionWidget.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/components/carousel.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/uploads.dart';
import 'package:swastha_aur_swabhimaan/screens/viewData/viewData.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class AdminOptions extends StatefulWidget {
  final String name;
  const AdminOptions({Key? key, required this.name}) : super(key: key);

  @override
  State<AdminOptions> createState() => _AdminOptionsState();
}

class _AdminOptionsState extends State<AdminOptions> {
  int userCount = 0;
  int doctorCount = 0;
  int teacherCount = 0;
  int trainerCount = 0;

  getUserCount() async {
    await DatabaseService().getUserLength().then((value) {
      setState(() {
        userCount = value;
      });
    });
  }

  getDoctorCount() async {
    await DatabaseService().getDoctorLength().then((value) {
      setState(() {
        doctorCount = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserCount();
    getDoctorCount();
    getTeacherCount();
    getTrainerCount();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      getUserCount();
      getDoctorCount();
      getTeacherCount();
      getTrainerCount();
    });
  }

  getTeacherCount() async {
    await DatabaseService().getTeacherLength().then((value) {
      setState(() {
        teacherCount = value;
      });
    });
  }

  getTrainerCount() async {
    await DatabaseService().getTrainerLength().then((value) {
      setState(() {
        trainerCount = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      // height: size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageCarousel(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: Text(
                'Our Users',
                style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.06,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    nextScreen(
                        context,
                        AllUsers(
                          name: widget.name,
                        ));
                  },
                  child: UserCountModel(
                    count: userCount.toString(),
                    label: 'Users',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, AllDoctors(adminName: widget.name));
                  },
                  child: UserCountModel(
                    count: doctorCount.toString(),
                    label: 'Doctors',
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
                    nextScreen(context, AllTeachers(adminName: widget.name));
                  },
                  child: UserCountModel(
                    count: teacherCount.toString(),
                    label: 'Teachers',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, AllTrainers(adminName: widget.name));
                  },
                  child: UserCountModel(
                    count: trainerCount.toString(),
                    label: 'Trainers',
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
                    nextScreen(context, const Events());
                  },
                  child: OptionWidget(
                    dim: 0.9,
                    image: 'Assets/images/events.png',
                    topRad: 17,
                    rightRad: 17,
                    bottomRad: 17,
                    leftRad: 17,
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
                      const Uploads(isUser: false),
                    );
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/images/upload.png',
                    topRad: 17,
                    rightRad: 17,
                    bottomRad: 50,
                    leftRad: 17,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ViewData()));
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/Logo/view.png',
                    topRad: 17,
                    rightRad: 17,
                    bottomRad: 17,
                    leftRad: 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
