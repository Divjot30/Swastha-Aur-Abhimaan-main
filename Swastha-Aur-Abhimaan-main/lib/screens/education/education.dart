import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/uploadVideos.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/youTube/videoPage.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/ncert/ncertBooksEnglish.dart';
import 'package:swastha_aur_swabhimaan/screens/education/components/topResources.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: const CustomAppBar(
            barColor: Colors.white,
            tiColor: Colors.black,
            title: 'Education',
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: size.width * 0.05,
              left: size.width * 0.03,
              right: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Resources",
                style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontFamily: 'Lexend',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const TopResource(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      nextScreen(context, UploadVideos(isUser: true));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              0.0,
                              4.0,
                            ),
                            blurRadius: 8.0,
                            // spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.asset(
                          'Assets/Logo/videos.png',
                          width: size.width * 0.45,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreen(
                          context,
                          VideoPage(
                            isUser: true,
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              0.0,
                              4.0,
                            ),
                            blurRadius: 8.0,
                            // spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.asset(
                          'Assets/Logo/yt.png',
                          width: size.width * 0.45,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "NCERT Books (in English)",
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontFamily: 'Lexend',
                ),
              ),
              const NcertBooks(),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
