import 'package:flutter/material.dart';

import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/optionWidget.dart';
import 'package:swastha_aur_swabhimaan/screens/event/view/pages/eventView.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/view/prescriptionView.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/components/carousel.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/nutrition/nutritionUpload.dart';

class Options extends StatelessWidget {
  final String myName;
  const Options({Key? key, required this.myName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
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
                    nextScreen(
                      context,
                      PrescriptionView(
                        myName: myName,
                      ),
                    );
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/Logo/prescription.png',
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
                            builder: (context) =>
                                NutritionUpload(isUser: false)));
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/Logo/upHN.png',
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
                    rightRad: 50,
                    bottomRad: 17,
                    leftRad: 17,
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
