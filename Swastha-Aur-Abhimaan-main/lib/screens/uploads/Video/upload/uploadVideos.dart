import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/components/searchPage.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/components/uploadVideoPanel.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/Video/upload/components/videoTileModel.dart';

// ignore: must_be_immutable
class UploadVideos extends StatefulWidget {
  bool isUser;
  UploadVideos({Key? key, required this.isUser}) : super(key: key);

  @override
  State<UploadVideos> createState() => _UploadVideosState();
}

class _UploadVideosState extends State<UploadVideos> {
  final imagePicker = ImagePicker();
  List videos = [];

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  getVideos() async {
    var videos = await FirebaseFirestore.instance
        .collection('uploadVideos')
        .where('label', isEqualTo: 'education')
        .get();
    setState(() {
      this.videos = videos.docs;
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
          'Uploaded Videos',
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
              nextScreen(context, const SearchPage());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        child: videoView(),
      ),
      floatingActionButton: widget.isUser == false
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const UploadVideoPanel();
                    },
                    enableDrag: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ));
              },
              backgroundColor: const Color.fromARGB(255, 157, 135, 149),
              child: const Icon(
                Icons.upload,
                color: Colors.white,
              ),
            )
          : null,
    );
  }

  videoView() {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        String vid = videos[index].id;
        Size size = MediaQuery.of(context).size;
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onLongPress: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    context: context,
                    builder: (context) => Container(
                          height: size.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection('uploadVideos')
                                      .doc(vid)
                                      .delete();
                                  Navigator.pop(context);
                                  setState(() {
                                    getVideos();
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                      size: size.width * 0.08,
                                    ),
                                    Text(
                                      'Delete',
                                      style: TextStyle(
                                        fontSize: size.width * 0.04,
                                        fontFamily: 'Lexend',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
              },
              child: VideoTileModel(
                  videoUrl: videos[index]['videoUrl'],
                  description: videos[index]['description'],
                  title: videos[index]['title'],
                  videoTag: videos[index]['eduTag']),
            ),
          ],
        );
      },
    );
  }
}
