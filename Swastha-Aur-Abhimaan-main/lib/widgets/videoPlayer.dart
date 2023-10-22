// ignore_for_file: sized_box_for_whitespace

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoPlayer extends StatefulWidget {
  String videoUrl;

  VideoPlayer({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      widget.videoUrl, // Replace with your video URL
    );
    _chewieController = ChewieController(
      fullScreenByDefault: true,
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: size.width,
        height: size.height * 0.4,
        child: Chewie(controller: _chewieController!),
      ),
    ]));
  }
}
