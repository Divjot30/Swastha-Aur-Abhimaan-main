import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class AddGalleryPage extends StatefulWidget {
  final String eventName;
  final String eventDate;
  const AddGalleryPage(
      {Key? key, required this.eventName, required this.eventDate})
      : super(key: key);

  @override
  State<AddGalleryPage> createState() => _AddGalleryPageState();
}

class _AddGalleryPageState extends State<AddGalleryPage> {
  List<XFile> selectedImages = [];
  List<String> imageUrls = [];
  File? video;
  String videoName = '';
  bool uploaded = false;
  String? downloadUrl;
  List event = [];
  final ImagePicker imagePicker = ImagePicker();

  Future selectImage() async {
    try {
      final List<XFile> imgs = await imagePicker.pickMultiImage();
      setState(() {
        if (imgs.isNotEmpty) {
          selectedImages.addAll(imgs);
        } else {
          Fluttertoast.showToast(
              msg: 'No image(s) selected',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER);
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: 'No image selected');
    }
  }

  Future selectVideo() async {
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

  Future upload(List<XFile> images) async {
    for (int i = 0; i < images.length; i++) {
      uploadImage(images[i]);
    }
  }

  getEventfromName() async {
    await DatabaseService().getEventByName(widget.eventName).then((value) {
      setState(() {
        event = value.docs;
      });
    });
  }

  // function to upload image to firebase storage
  uploadImage(XFile image) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('${widget.eventName}/${DateTime.now().millisecondsSinceEpoch}');
    await storageReference.putFile(File(image.path)).whenComplete(() {
      setState(() {
        uploaded = true;
      });
    });

    downloadUrl = await storageReference.getDownloadURL();
    imageUrls.add(downloadUrl!);
    return downloadUrl!;
  }

  uploadVideo() async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('${widget.eventName}/${DateTime.now().millisecondsSinceEpoch}');
    await ref.putFile(video!);
    downloadUrl = await ref.getDownloadURL();

    await DatabaseService()
        .addEventVideos(downloadUrl!, widget.eventName, widget.eventDate)
        .whenComplete(() {
      Fluttertoast.showToast(
          msg: 'Video Uploaded Successfully',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      Navigator.popAndPushNamed(context, '/adminHome');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22.0),
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.video_call, color: Colors.white),
            backgroundColor: const Color.fromARGB(255, 157, 135, 149),
            label: 'Add Videos',
            labelStyle: const TextStyle(fontSize: 18.0, fontFamily: 'Lexend'),
            onTap: () {
              selectVideo();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.05,
            bottom: size.height * 0.03,
            left: size.width * 0.05,
            right: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Video',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: size.width * 0.06,
                color: const Color.fromARGB(255, 157, 135, 149),
              ),
            ),
            video == null
                ? const SizedBox()
                : Container(
                    width: size.width * 0.5,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color.fromARGB(255, 157, 135, 149),
                          width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.video_file,
                          color: const Color.fromARGB(255, 157, 135, 149),
                          size: size.width * 0.04,
                        ),
                        Text(
                          descriptionText(videoName),
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: size.width * 0.035,
                            color: const Color.fromARGB(255, 157, 135, 149),
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
                            color: const Color.fromARGB(255, 157, 135, 149),
                            size: size.width * 0.04,
                          ),
                        )
                      ],
                    ),
                  ),
            SizedBox(
              height: size.height * 0.03,
            ),
            video != null
                ? SizedBox(
                    width: size.width * 0.8,
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          uploadVideo();
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor:
                                const Color.fromARGB(255, 157, 135, 149),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Text(
                          'Upload Video',
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: size.width * 0.05,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  descriptionText(String description) {
    if (description.length > 20) {
      return '${description.substring(0, 20)}...';
    } else {
      return description;
    }
  }
}
