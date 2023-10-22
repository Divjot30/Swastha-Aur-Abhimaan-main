import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/skillDevelopment/components/fullPageSkillView.dart';

class SkillTileModel extends StatelessWidget {
  final String title;
  final String description;
  final String videoUrl;
  final String date;
  final String village;
  final String day;
  const SkillTileModel(
      {Key? key,
      required this.title,
      required this.description,
      required this.videoUrl,
      required this.date,
      required this.day,
      required this.village})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            FullPageSkillView(
              title: title,
              description: description,
              dateOfEvent: date,
              videoUrl: videoUrl,
              village: village,
              day: day,
            ));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'Assets/Logo/skillDevVideoThumb.png',
                  width: size.width * 0.2,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lexend',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    descriptionText(description),
                    style: const TextStyle(
                      color: Color.fromARGB(190, 103, 105, 105),
                      fontFamily: 'Lexend',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    nextScreen(
                        context,
                        FullPageSkillView(
                          title: title,
                          description: description,
                          dateOfEvent: date,
                          videoUrl: videoUrl,
                          village: village,
                          day: day,
                        ));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: size.width * 0.05,
                  ))
            ],
          ),
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
