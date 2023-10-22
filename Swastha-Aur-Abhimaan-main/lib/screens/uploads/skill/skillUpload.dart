import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/nutrition/components/nutritionVideoTile.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/skill/components/skillUploadPanel.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class SkillUpload extends StatefulWidget {
  final bool isUser;
  const SkillUpload({Key? key, required this.isUser}) : super(key: key);

  @override
  State<SkillUpload> createState() => _SkillUploadState();
}

class _SkillUploadState extends State<SkillUpload> {
  final imagePicker = ImagePicker();
  List videoss = [];

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  getVideos() async {
    var videos = await FirebaseFirestore.instance
        .collection('uploadVideos')
        .where('label', isEqualTo: 'skill')
        .get();
    setState(() {
      videoss = videos.docs;
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
          title: 'Skill Development Videos',
          tiColor: Colors.white,
        ),
      ),
      body: videoss.isEmpty
          ? Center(
              child: Image.asset('Assets/Logo/noSkillVid.png'),
            )
          : Container(
              child: videoView(),
            ),
      floatingActionButton: widget.isUser == false
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const SkillUploadPanel();
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
          : Container(),
    );
  }

  videoView() {
    return ListView.builder(
      itemCount: videoss.length,
      itemBuilder: (context, index) {
        String vid = videoss[index].reference.id;
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
              child: NutritionVideoTile(
                vid: videoss[index].reference.id,
                videoUrl: videoss[index]['videoUrl'],
                title: videoss[index]['title'],
                description: videoss[index]['description'],
              ),
            ),
          ],
        );
      },
    );
  }
}
