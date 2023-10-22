import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSearchTile extends StatelessWidget {
  final String title;
  final String tag;
  final String videoID;
  const VideoSearchTile(
      {Key? key, required this.title, required this.tag, required this.videoID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        _launchUrl(Uri.parse(videoID));
      },
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color.fromARGB(255, 157, 135, 149),
              width: 2,
            ),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lexend',
                fontSize: size.width * 0.05,
              ),
            ),
            subtitle: Text(
              tag,
              style: TextStyle(
                color: const Color.fromARGB(255, 157, 135, 149),
                fontFamily: 'Lexend',
                fontSize: size.width * 0.04,
              ),
            ),
            trailing: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(YoutubeThumbnail(
                        youtubeId: YoutubePlayer.convertUrlToId(videoID))
                    .hd())),
          ),
        ),
      ),
    );
  }

  _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
