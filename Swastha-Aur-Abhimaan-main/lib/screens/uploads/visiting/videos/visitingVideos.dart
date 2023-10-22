import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/videos/components/visitVideoTileModel.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/videos/components/visitVideoUploadPanel.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

// ignore: must_be_immutable
class VisitingVideos extends StatefulWidget {
  bool isUser;
  VisitingVideos({Key? key, required this.isUser}) : super(key: key);

  @override
  State<VisitingVideos> createState() => _VisitingVideosState();
}

class _VisitingVideosState extends State<VisitingVideos> {
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
        .where('label', isEqualTo: 'visit')
        .get();
    setState(() {
      this.videos = videos.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
          barColor: Color.fromARGB(255, 157, 135, 149),
          title: 'Visiting Videos',
          tiColor: Colors.white,
        ),
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
                      return const VisitVideoUploadPanel();
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
              child: VisitVideoTileModel(
                videoUrl: videos[index]['videoUrl'],
                title: videos[index]['title'],
                description: videos[index]['description'],
                visitDate: videos[index]['visitDate'],
                visitVillage: videos[index]['visitVillage'],
              ),
            ),
          ],
        );
      },
    );
  }
}
