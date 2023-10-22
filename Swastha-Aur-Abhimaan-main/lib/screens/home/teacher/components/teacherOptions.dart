import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/optionWidget.dart';
import 'package:swastha_aur_swabhimaan/screens/education/education.dart';
import 'package:swastha_aur_swabhimaan/screens/event/view/pages/eventView.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/components/carousel.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/uploadVideos.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/youTube/videoPage.dart';

class TeacherOptions extends StatelessWidget {
  const TeacherOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ImageCarousel(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    nextScreen(
                        context,
                        VideoPage(
                          isUser: false,
                        ));
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/Logo/yvideos.png',
                    topRad: 17,
                    rightRad: 17,
                    bottomRad: 50,
                    leftRad: 17,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    nextScreen(context, UploadVideos(isUser: false));
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/images/recVideos.png',
                    topRad: 17,
                    rightRad: 17,
                    bottomRad: 17,
                    leftRad: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
                GestureDetector(
                  onTap: () {
                    nextScreen(context, const Education());
                  },
                  child: OptionWidget(
                    dim: 0.45,
                    image: 'Assets/images/edu.png',
                    topRad: 50,
                    rightRad: 17,
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
