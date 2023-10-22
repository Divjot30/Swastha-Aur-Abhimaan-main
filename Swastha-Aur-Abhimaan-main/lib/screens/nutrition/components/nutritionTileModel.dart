import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/components/videoPlayingPage.dart';

class NutritionTileModel extends StatelessWidget {
  final String title;
  final String description;
  final String videoUrl;
  const NutritionTileModel({
    Key? key,
    required this.title,
    required this.description,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'Assets/Logo/nutrtionVideo.png',
                width: size.width * 0.2,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.05,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  descriptionText(description),
                  style: TextStyle(
                    color: const Color.fromARGB(190, 103, 105, 105),
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.04,
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  nextScreen(
                      context,
                      VideoPlayingPage(
                        title: title,
                        description: description,
                        videoUrl: videoUrl,
                      ));
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: size.width * 0.05,
                ))
          ],
        ),
      ),
    );
  }

  // Description Formatter
  descriptionText(String description) {
    if (description.length > 30) {
      return '${description.substring(0, 30)}...';
    } else {
      return description;
    }
  }
}
