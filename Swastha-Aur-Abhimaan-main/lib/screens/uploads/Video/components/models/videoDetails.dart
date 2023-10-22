import 'package:flutter/material.dart';
import 'package:youtube/youtube_thumbnail.dart';

class VideoDetails extends StatelessWidget {
  final String? videoID;
  final String? videoTitle;
  final String? tag;
  const VideoDetails(
      {Key? key,
      required this.videoID,
      required this.videoTitle,
      required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(size.width * 0.03),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child:
                    Image.network(YoutubeThumbnail(youtubeId: videoID).hd())),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.04, right: size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  videoTitle!,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.064,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  tag!,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: const Color.fromARGB(255, 157, 135, 149),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lexend"),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
