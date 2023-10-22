import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/components/videoPlayingPage.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

// ignore: must_be_immutable
class VisitVideoTileModel extends StatelessWidget {
  String videoUrl, title, description, visitVillage, visitDate;
  VisitVideoTileModel(
      {Key? key,
      required this.videoUrl,
      required this.description,
      required this.title,
      required this.visitDate,
      required this.visitVillage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: GestureDetector(
          onTap: () {
            nextScreen(
                context,
                VideoPlayingPage(
                  videoUrl: videoUrl,
                  title: title,
                  description: description,
                ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  FutureBuilder<Uint8List?>(
                    future: VideoThumbnail.thumbnailData(
                      video: videoUrl, // Replace with the actual video path
                      imageFormat: ImageFormat.PNG,
                      maxHeight: 80,
                      maxWidth: 80,
                      timeMs: 0,
                    ),
                    builder: (BuildContext context,
                        AsyncSnapshot<Uint8List?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(
                            snapshot.data!,
                            fit: BoxFit.fitWidth,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Error loading thumbnail');
                      } else {
                        return const CircularProgressIndicator(
                          color: Color.fromARGB(255, 157, 135, 149),
                        );
                      }
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    capitalizeText(title),
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontFamily: 'Lexend',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Text(
                    capitalizeText(descriptionText(description)),
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontFamily: 'Lexend',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Text(
                    capitalizeText(visitVillage),
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontFamily: 'Lexend',
                      color: Colors.deepOrange[700],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.008,
                  ),
                  Text(
                    visitDate,
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontFamily: 'Lexend',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  descriptionText(String description) {
    if (description.length > 20) {
      return '${description.substring(0, 20)}...';
    } else {
      return description;
    }
  }

  capitalizeText(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
