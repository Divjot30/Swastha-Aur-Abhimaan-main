import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/optionWidget.dart';
import 'package:swastha_aur_swabhimaan/screens/skillDevelopment/skillDevelopment.dart';
import 'package:swastha_aur_swabhimaan/screens/skillDevelopment/skillFromEvents.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/skill/skillUpload.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class SkillUp extends StatefulWidget {
  const SkillUp({Key? key}) : super(key: key);
  @override
  _SkillUpState createState() => _SkillUpState();
}

class _SkillUpState extends State<SkillUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          size.height * 0.07,
        ),
        child: const CustomAppBar(
          barColor: Color.fromARGB(255, 157, 135, 149),
          title: 'Skill Development',
          tiColor: Colors.white,
        ),
      ),
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
                  nextScreen(context, const SkillUpload(isUser: false));
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
          ),
        ),
      ),
    );
  }
}
