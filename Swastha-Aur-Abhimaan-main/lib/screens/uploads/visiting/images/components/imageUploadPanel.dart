import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class ImageUploadPanel extends StatefulWidget {
  const ImageUploadPanel({Key? key}) : super(key: key);

  @override
  State<ImageUploadPanel> createState() => _ImageUploadPanelState();
}

class _ImageUploadPanelState extends State<ImageUploadPanel> {
  TextEditingController dateController = TextEditingController();
  bool isLoading = false;
  List<XFile> selectedImages = [];
  List<String> imageUrls = [];
  String imageDescription = '';
  String visitDate = '';
  String visitVillage = '';
  bool uploaded = false;
  String? downloadUrl;
  final imagePicker = ImagePicker();

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

  // function to upload images link and description to firebase cloud firestore
  // uploadToCloudFirstore() async {
  //   await DatabaseService()
  //       .addImageUrl(
  //           imageUrls, imageDescription, visitDate, visitVillage, 'visit', now!)
  //       .whenComplete(() {
  //     Fluttertoast.showToast(
  //         msg: 'Uploaded Successfully',
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         fontSize: 16.0);
  //     Navigator.pop(context);
  //   });
  //   await DatabaseService().saveAllImages(imageUrls);
  // }

  // function to save image urls to list
  Future upload(List<XFile> images) async {
    for (int i = 0; i < images.length; i++) {
      uploadImage(images[i]);
    }
  }

  // function to upload image to firebase storage
  uploadImage(XFile image) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('visitingImages/${DateTime.now().millisecondsSinceEpoch}');
    await storageReference.putFile(File(image.path)).whenComplete(() {
      setState(() {
        uploaded = true;
      });
    });

    downloadUrl = await storageReference.getDownloadURL();
    imageUrls.add(downloadUrl!);
    return downloadUrl!;
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
              'Upload Image(s)',
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
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Image Description',
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
                      imageDescription = value;
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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Visited Village',
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
                      visitVillage = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        child: TextField(
                          style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: size.width * 0.04,
                              color: Colors.white),
                          controller:
                              dateController, //editing controller of this TextField
                          decoration: InputDecoration(
                            hintText: "Enter Visiting Date",
                            hintStyle: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.white.withOpacity(0.7),
                            ),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: size.width * 0.05,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          readOnly: true, // when true user cannot edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);

                              setState(() {
                                dateController.text = formattedDate;
                                visitDate = dateController.text;
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Date is not selected",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white);
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          imageDescription.isEmpty ||
                                  visitVillage.isEmpty ||
                                  visitDate.isEmpty
                              ? Fluttertoast.showToast(
                                  msg: "Please fill all the fields",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white)
                              : selectImage().whenComplete(() {
                                });
                        },
                        child: Image.asset(
                          'Assets/Logo/uploadImage.png',
                          height: size.height * 0.08,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Visibility(
                    visible: selectedImages.isEmpty ? false : true,
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
                            Icons.image,
                            color: Colors.white,
                            size: size.width * 0.04,
                          ),
                          Text(
                            '${selectedImages.length} Images Selected',
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: size.width * 0.035,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImages = [];
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
              height: size.height * 0.04,
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
              height: isLoading ? size.height * 0.18 : size.height * 0.22,
            ),
            selectedImages.isEmpty
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
                : uploaded
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.05, right: size.width * 0.05),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await DatabaseService()
                                      .addImageUrl(imageUrls, imageDescription,
                                          visitDate, visitVillage, 'visit')
                                      .whenComplete(() async {
                                    for (int i = 0; i < imageUrls.length; i++) {
                                      await DatabaseService()
                                          .saveAllImages(imageUrls[i]);
                                    }

                                    Fluttertoast.showToast(
                                        msg: "Images Uploaded Successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
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
                                  'Upload Links',
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
                                  Fluttertoast.showToast(
                                      msg: "Please wait for a few seconds",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                  setState(() {
                                    isLoading = true;
                                  });
                                  selectedImages.isEmpty
                                      ? Fluttertoast.showToast(
                                          msg: "Please select images",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white)
                                      : upload(selectedImages)
                                          .whenComplete(() => setState(() {
                                                isLoading = false;
                                              }));
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
                                  'Upload Images',
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
}
