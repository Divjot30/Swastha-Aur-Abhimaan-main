// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swastha_aur_swabhimaan/screens/skillDevelopment/skillFromEvents.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/skill/skillUpload.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/optionWidget.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class SkillDevelopment extends StatefulWidget {
  final bool isUser;
  const SkillDevelopment({Key? key, required this.isUser}) : super(key: key);

  @override
  State<SkillDevelopment> createState() => _SkillDevelopmentState();
}

class _SkillDevelopmentState extends State<SkillDevelopment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: const CustomAppBar(
            barColor: Colors.white,
            tiColor: Colors.black,
            title: 'Skill Development',
          )),
      body: Padding(
          padding:
              EdgeInsets.fromLTRB(0, size.height * 0.02, 0, size.width * 0.05),
          child: SingleChildScrollView(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  nextScreen(context, const SkillFromEvents());
                },
                child: OptionWidget(
                  dim: 0.45,
                  image: 'Assets/Logo/skillVdUp.png',
                  topRad: 17,
                  rightRad: 17,
                  bottomRad: 50,
                  leftRad: 17,
                ),
              ),
              GestureDetector(
                onTap: () {
                  nextScreen(
                      context,
                      SkillUpload(
                        isUser: widget.isUser,
                      ));
                },
                child: OptionWidget(
                  dim: 0.45,
                  image: 'Assets/Logo/skillVid.png',
                  topRad: 17,
                  rightRad: 17,
                  bottomRad: 17,
                  leftRad: 50,
                ),
              ),
            ],
          ))),
    );
  }
}
