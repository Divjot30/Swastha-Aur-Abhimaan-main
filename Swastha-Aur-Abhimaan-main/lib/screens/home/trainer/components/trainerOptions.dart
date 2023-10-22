import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/optionWidget.dart';
import 'package:swastha_aur_swabhimaan/screens/event/events.dart';
import 'package:swastha_aur_swabhimaan/screens/event/view/pages/eventView.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/components/carousel.dart';
import 'package:swastha_aur_swabhimaan/screens/home/trainer/pages/skillup.dart';

// ignore: must_be_immutable
class TrainerOptions extends StatefulWidget {
  String name;
  TrainerOptions({Key? key, required this.name}) : super(key: key);

  @override
  State<TrainerOptions> createState() => _TrainerOptionsState();
}

class _TrainerOptionsState extends State<TrainerOptions> {
  bool isJoined = false;
  bool isLoading = false;
  QuerySnapshot? groupSnapshot;
  bool hasUserSearched = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageCarousel(),
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
                    nextScreen(context, const EventView());
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/Logo/viewEv.png',
                    topRad: 17,
                    rightRad: 17,
                    bottomRad: 50,
                    leftRad: 17,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, SkillUp());
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/images/skill.png',
                    topRad: 17,
                    rightRad: 17,
                    bottomRad: 17,
                    leftRad: 50,
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
