import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class UploadVideoPanel extends StatefulWidget {
  const UploadVideoPanel({Key? key}) : super(key: key);

  @override
  State<UploadVideoPanel> createState() => _UploadVideoPanelState();
}

class _UploadVideoPanelState extends State<UploadVideoPanel> {
  bool isLoading = false;
  File? video;
  String videoName = '';
  String videoTitle = '';
  String videoTag = '';
  String videoDescription = '';

  String? downloadUrl;
  final imagePicker = ImagePicker();

  Future selectFromGallery() async {
    final pick = await imagePicker.pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        videoName = pick.name;
        video = File(pick.path);
      } else {
        Fluttertoast.showToast(
            msg: 'No video selected',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 157, 135, 149),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        height: size.height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: size.width * 0.45,
              endIndent: size.width * 0.45,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: size.width * 0.05,
                  color: Colors.white),
              'Upload Video',
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.07, right: size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: size.width * 0.04,
                        color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter Video Title',
                      hintStyle: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: size.width * 0.04,
                          color: Colors.white.withOpacity(0.7)),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      videoTitle = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextField(
                    style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: size.width * 0.04,
                        color: Colors.white),
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Video Description',
                      hintStyle: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: size.width * 0.04,
                          color: Colors.white.withOpacity(0.7)),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      videoDescription = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        child: DropdownButtonFormField(
                            borderRadius: BorderRadius.circular(7),
                            menuMaxHeight: size.height * 0.3,
                            itemHeight: 50,
                            iconEnabledColor: Colors.white,
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: "Add Tag",
                              hintStyle: TextStyle(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Lexend",
                                color: Colors.white.withOpacity(0.7),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: "Biology", child: Text("Biology")),
                              DropdownMenuItem(
                                  value: "Chemistry", child: Text("Chemistry")),
                              DropdownMenuItem(
                                  value: "Computer", child: Text("Computer")),
                              DropdownMenuItem(
                                  value: "Economics", child: Text("Economics")),
                              DropdownMenuItem(
                                  value: "English", child: Text("English")),
                              DropdownMenuItem(
                                  value: "Geography", child: Text("Geography")),
                              DropdownMenuItem(
                                  value: "Hindi", child: Text("Hindi")),
                              DropdownMenuItem(
                                  value: "History", child: Text("History")),
                              DropdownMenuItem(
                                  value: "Maths", child: Text("Maths")),
                              DropdownMenuItem(
                                  value: "Physics", child: Text("Physics")),
                              DropdownMenuItem(
                                  value: "Science", child: Text("Science")),
                              DropdownMenuItem(
                                  value: "Social Science",
                                  child: Text("Social Science")),
                            ],
                            onChanged: (value) {
                              setState(() {
                                videoTag = value.toString();
                              });
                            }),
                      ),
                      GestureDetector(
                        onTap: () {
                          videoTitle.isEmpty || videoDescription.isEmpty
                              ? Fluttertoast.showToast(
                                  msg: 'Please fill all the fields',
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM)
                              : selectFromGallery().whenComplete(() {});
                        },
                        child: Image.asset(
                          'Assets/Logo/videoUp.png',
                          height: size.height * 0.08,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Visibility(
                    visible: video == null ? false : true,
                    child: Container(
                      width: size.width * 0.5,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                          vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.video_file,
                            color: Colors.white,
                            size: size.width * 0.04,
                          ),
                          Text(
                            descriptionText(videoName),
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: size.width * 0.035,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                video = null;
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: size.width * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            isLoading
                ? Center(
                    child: Column(
                      children: [
                        const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        Text(
                          'Uploading...',
                          style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: size.width * 0.04,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              height: isLoading ? size.height * 0.18 : size.height * 0.25,
            ),
            video == null
                ? Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, right: size.width * 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 211, 189, 203)
                                      .withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: size.width * 0.05,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, right: size.width * 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isLoading = true;
                              });
                              videoTitle == '' ||
                                      videoDescription == '' ||
                                      videoTag == '' ||
                                      video == null
                                  ? Fluttertoast.showToast(
                                      msg: 'Please fill all the fields',
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM)
                                  : uploadVideo().whenComplete(() {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 211, 189, 203)
                                      .withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Upload Video',
                              style: TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: size.width * 0.05,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ));
  }

  descriptionText(String description) {
    if (description.length > 20) {
      return '${description.substring(0, 20)}...';
    } else {
      return description;
    }
  }

  uploadVideo() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('uploadedVideos/${videoTitle}_$postID');
    await ref.putFile(video!);
    downloadUrl = await ref.getDownloadURL();

    await DatabaseService()
        .addVideoUrl(
      videoTitle,
      videoDescription,
      'education',
      videoTag,
      downloadUrl!,
    )
        .whenComplete(() {
      Fluttertoast.showToast(
          msg: 'Video Uploaded Successfully',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      Navigator.pop(context);
    });
  }
}
