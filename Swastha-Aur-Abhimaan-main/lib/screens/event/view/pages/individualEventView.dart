import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/videoPlayer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

// ignore: must_be_immutable
class IndividualEventView extends StatefulWidget {
  String eventName;
  String eventDescription;
  String eventDate;
  String? village;
  String day;
  String tag;
  IndividualEventView(
      {Key? key,
      required this.eventName,
      required this.eventDate,
      required this.eventDescription,
      required this.day,
      required this.tag,
      required this.village})
      : super(key: key);

  @override
  State<IndividualEventView> createState() => _IndividualEventViewState();
}

class _IndividualEventViewState extends State<IndividualEventView> {
  String videoUrl = '';
  getMonthFromDate(String eventMonth) {
    switch (eventMonth) {
      case '01':
        return 'January';
      case '02':
        return 'February';
      case '03':
        return 'March';
      case '04':
        return 'April';
      case '05':
        return 'May';
      case '06':
        return 'June';
      case '07':
        return 'July';
      case '08':
        return 'August';
      case '09':
        return 'September';
      case '10':
        return 'October';
      case '11':
        return 'November';
      case '12':
        return 'December';
    }
  }

  getDayFromDate(String date) {
    return date.split('-')[2];
  }

  @override
  void initState() {
    super.initState();
    getEventVideo();
  }

  getEventVideo() async {
    await FirebaseFirestore.instance
        .collection('events')
        .doc('${widget.eventName}_${widget.eventDate}')
        .collection('videos')
        .doc()
        .get()
        .then((value) {
      setState(() {
        videoUrl = value['videoUrl'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: widget.tag == 'Skill'
                ? const AssetImage('Assets/images/skillEvent.png')
                : widget.tag == 'Health'
                    ? const AssetImage('Assets/images/healthEvent.png')
                    : widget.tag == 'Education'
                        ? const AssetImage('Assets/images/eduEvent.png')
                        : const AssetImage('Assets/images/otherEvent.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  top: size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white.withOpacity(0.5)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    capitaliseString(widget.eventName),
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lexend",
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: widget.tag == 'Education'
                        ? const Color.fromARGB(255, 250, 224, 216)
                        : widget.tag == 'Health'
                            ? const Color.fromARGB(255, 0, 99, 191)
                            : widget.tag == 'Skill'
                                ? const Color.fromARGB(255, 152, 188, 236)
                                : const Color.fromARGB(255, 22, 148, 50),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // image with blur bottom
            SizedBox(
              height: size.height * 0.3,
              width: size.width,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                // top: size.height * 0.05),
              ),
              height: size.height * 0.58,
              decoration: BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.9),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            capitaliseString(widget.eventName),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.057,
                              fontFamily: "Lexend",
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "${widget.village!}, Dehradun, Uttarakhand",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: size.width * 0.045,
                              fontFamily: "Lexend",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.eventDate.split('-')[0],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.05,
                              fontFamily: "Lexend",
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Text(
                            getMonthFromDate(widget.eventDate.split('-')[1]) +
                                " " +
                                widget.eventDate.split('-')[2],
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: size.width * 0.045,
                              fontFamily: "Lexend",
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.day,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                          fontFamily: "Lexend",
                        ),
                      ),
                      Image(
                        image: const AssetImage("Assets/Logo/calendar.png"),
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text("About the Event",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.05,
                        fontFamily: "Lexend",
                      )),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    capitaliseString(widget.eventDescription),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: size.width * 0.045,
                      fontFamily: "LexendLight",
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  // image carousel
                  GestureDetector(
                    onTap: () {
                      nextScreen(
                          context,
                          VideoPlayer(
                            videoUrl: videoUrl,
                          ));
                    },
                    child: FutureBuilder<Uint8List?>(
                      future: VideoThumbnail.thumbnailData(
                        video: videoUrl, // Replace with the actual video path
                        imageFormat: ImageFormat.PNG,
                        maxHeight: 100,
                        maxWidth: 100,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
