import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class VideoUploadPanel extends StatefulWidget {
  const VideoUploadPanel({super.key});

  @override
  State<VideoUploadPanel> createState() => _VideoUploadPanelState();
}

class _VideoUploadPanelState extends State<VideoUploadPanel> {
  String videoTitle = '';
  String videoLink = '';
  String videoTag = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 157, 135, 149),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      height: size.height * 0.7,
      child: Column(
        children: [
          const SizedBox(
            width: 40,
            child: Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 0.9,
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                hintText: 'Video Title',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
              ),
              onChanged: (value) {
                videoTitle = value;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 0.9,
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                hintText: 'Video Link',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                )),
              ),
              onChanged: (value) {
                videoLink = value;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SizedBox(
              width: size.width * 0.9,
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
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  items: subjectTags.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      videoTag = value.toString();
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          SizedBox(
            width: size.width * 0.9,
            child: ElevatedButton(
              onPressed: () async {
                videoLink.isEmpty ||
                        videoTag.isEmpty ||
                        videoTitle.isEmpty &&
                            videoLink.contains(
                                    'https://www.youtube.com/watch?v=') ==
                                false ||
                        videoLink.contains('https://youtu.be/') == false
                    ? Fluttertoast.showToast(
                        msg: "Please fill all the fields",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0)
                    : await DatabaseService()
                        .addVideoData(videoLink, videoTitle, videoTag)
                        .whenComplete(() {
                        Fluttertoast.showToast(
                            msg: "Video Uploaded Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.pop(context);
                      });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Upload',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Lexend",
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List subjectTags = [
    'Acountancy',
    'Biology',
    'Business Studies',
    'Chemistry',
    'Computer Science',
    'Economics',
    'English',
    'Geography',
    'Hindi',
    'History',
    'Informatics Practices',
    'Mathematics',
    'Physics',
    'Political Science',
  ];
}
