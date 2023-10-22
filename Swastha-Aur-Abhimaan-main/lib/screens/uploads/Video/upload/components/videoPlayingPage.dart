// ignore_for_file: sized_box_for_whitespace

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoPlayingPage extends StatefulWidget {
  String videoUrl;
  String title;
  String description;
  VideoPlayingPage(
      {Key? key,
      required this.videoUrl,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  State<VideoPlayingPage> createState() => _VideoPlayingPageState();
}

class _VideoPlayingPageState extends State<VideoPlayingPage> {
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: CustomAppBar(
            barColor: const Color.fromARGB(255, 157, 135, 149),
            title: capitalizeText(widget.title),
            tiColor: Colors.white,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.4,
            child: Chewie(controller: _chewieController!),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.1, right: size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  capitalizeText(widget.title),
                  style: TextStyle(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lexend',
                    color: const Color.fromARGB(255, 157, 135, 149),
                  ),
                ),
                SizedBox(
                    height: size.height * 0.03,
                    child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        endIndent: size.width * 0.3)),
                Text(
                  capitalizeText(widget.description),
                  style: TextStyle(
                    fontSize: size.width * 0.055,
                    fontFamily: 'Lexend',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  capitalizeText(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
