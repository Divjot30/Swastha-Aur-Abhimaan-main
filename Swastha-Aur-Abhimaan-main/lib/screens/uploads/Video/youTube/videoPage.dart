import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/components/models/videoDetails.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/components/noVideoWidget.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/components/videoSearchPage.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/youTube/components/videoUploadPanel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class VideoPage extends StatefulWidget {
  bool isUser;
  VideoPage({Key? key, required this.isUser}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List video = [];

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  getVideos() async {
    var videoLink = await FirebaseFirestore.instance.collection('videos').get();
    setState(() {
      video = videoLink.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
        title: Text(
          'Videos',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lexend',
            fontSize: size.width * 0.055,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: size.width * 0.05,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(context, const VideoSearchPage());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: videoList(),
      ),
      floatingActionButton: widget.isUser == false
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const VideoUploadPanel();
                    },
                    enableDrag: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ));
              },
              backgroundColor: const Color.fromARGB(255, 157, 135, 149),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  videoList() {
    return video.isEmpty
        ? const NoVideoWidget(
            colors: Color.fromARGB(255, 157, 135, 149),
          )
        : ListView.builder(
            itemCount: video.length,
            itemBuilder: (context, index) {
              return videoTile(
                video[index].data()['videoID'],
                video[index].data()['videoTitle'],
                video[index].data()['tag'],
              );
            },
          );
  }

  videoTile(String videoURL, String videoTitle, String videoTag) {
    return GestureDetector(
      onTap: () {
        _launchUrl(Uri.parse(videoURL));
      },
      onLongPress: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) {
              return Container(
                height: 60,
                color: Colors.transparent,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text('Delete'),
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('videos')
                            .doc(videoTitle)
                            .delete();

                        setState(() {
                          getVideos();
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            });
      },
      child: Column(
        children: [
          VideoDetails(
            videoID: YoutubePlayer.convertUrlToId(videoURL),
            videoTitle: videoTitle,
            tag: videoTag,
          )
        ],
      ),
    );
  }

  _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
