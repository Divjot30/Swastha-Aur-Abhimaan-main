import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullPageSkillView extends StatefulWidget {
  final String title;
  final String description;
  final String videoUrl;
  final String dateOfEvent;
  final String village;
  final String day;
  const FullPageSkillView({
    Key? key,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.dateOfEvent,
    required this.village,
    required this.day,
  }) : super(key: key);

  @override
  State<FullPageSkillView> createState() => _FullPageSkillViewState();
}

class _FullPageSkillViewState extends State<FullPageSkillView> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      widget.videoUrl, // Replace with your video URL
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      looping: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: const Color.fromARGB(255, 157, 135, 149),
        handleColor: Colors.black,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white,
      ),
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],

      // You can customize other Chewie options here
    );
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: size.height * 0.05,
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: size.width * 0.05,
                      color: Colors.black,
                    )),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.065,
                  ),
                ),
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: size.width * 0.05,
                  color: Colors.transparent,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
                height: size.height * 0.4,
                child: widget.videoUrl.isEmpty
                    ? Image.asset('Assets/images/noVideo.png')
                    : Chewie(controller: _chewieController!)),
            SizedBox(
              height: size.height * 0.02,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.057,
                          fontFamily: "Lexend",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "${widget.village}, Dehradun, Uttarakhand",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
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
                        widget.dateOfEvent.split('-')[0],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.05,
                          fontFamily: "Lexend",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Text(
                        getMonthFromDate(widget.dateOfEvent.split('-')[1]) +
                            " " +
                            widget.dateOfEvent.split('-')[2],
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: size.width * 0.045,
                          fontFamily: "Lexend",
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.day,
                    style: TextStyle(
                      color: Colors.black,
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
                    color: Colors.black,
                    fontSize: size.width * 0.05,
                    fontFamily: "Lexend",
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: size.width * 0.045,
                  fontFamily: "LexendLight",
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

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
}
