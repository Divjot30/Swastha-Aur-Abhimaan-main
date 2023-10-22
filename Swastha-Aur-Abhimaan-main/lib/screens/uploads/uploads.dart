import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/optionWidget.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/uploadVideos.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/youTube/videoPage.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/nutrition/nutritionUpload.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/skill/skillUpload.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/images/visitingImage.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/videos/visitingVideos.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class Uploads extends StatefulWidget {
  final bool isUser;
  const Uploads({Key? key, required this.isUser}) : super(key: key);

  @override
  State<Uploads> createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
            barColor: Color.fromARGB(255, 157, 135, 149),
            title: 'Uploads',
            tiColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: size.height * 0.023),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Text(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.05,
                  ),
                  'Education',
                ),
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
                          VideoPage(
                            isUser: widget.isUser,
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
                      nextScreen(context, UploadVideos(isUser: widget.isUser));
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
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Text(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.05,
                  ),
                  'Visiting',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      nextScreen(context, const VisitingImage());
                    },
                    child: OptionWidget(
                      dim: 0.45,
                      image: 'Assets/images/visitingImageUpload.png',
                      topRad: 17,
                      rightRad: 50,
                      bottomRad: 50,
                      leftRad: 17,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreen(
                          context, VisitingVideos(isUser: widget.isUser));
                    },
                    child: OptionWidget(
                      dim: 0.45,
                      image: 'Assets/images/visitingVideoUpload.png',
                      topRad: 50,
                      rightRad: 17,
                      bottomRad: 17,
                      leftRad: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 18,
                      ),
                      'Nutrition',
                    ),
                    Text(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 18,
                      ),
                      'Skill Development',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: GestureDetector(
                      onTap: () {
                        nextScreen(context, NutritionUpload(isUser: false));
                      },
                      child: OptionWidget(
                        dim: 0.45,
                        image: 'Assets/images/nutritionUpload.png',
                        topRad: 17,
                        rightRad: 50,
                        bottomRad: 17,
                        leftRad: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: GestureDetector(
                      onTap: () {
                        nextScreen(context, const SkillUpload(isUser: false));
                      },
                      child: OptionWidget(
                        dim: 0.45,
                        image: 'Assets/Logo/skillVid.png',
                        topRad: 50,
                        rightRad: 17,
                        bottomRad: 17,
                        leftRad: 17,
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
