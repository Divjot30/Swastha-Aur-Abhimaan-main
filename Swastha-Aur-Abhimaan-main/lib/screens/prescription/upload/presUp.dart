import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/components/previewPage.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/widgets.dart';

class PresUp extends StatefulWidget {
  const PresUp({Key? key}) : super(key: key);

  @override
  State<PresUp> createState() => _PresUpState();
}

class _PresUpState extends State<PresUp> {
  final TextEditingController _controller = TextEditingController();
  String userName = '';
  String email = '';
  String village = '';
  String userAge = '';
  String desc = '';
  File? _image;
  String? downloadUrl;
  final imagePicker = ImagePicker();
  List images = [];

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) => email = value!);
    await DatabaseService().gettingUserData(email).then((value) {
      setState(() {
        userName = value.docs[0].data()['name'];
        village = value.docs[0].data()['village'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 157, 135, 149),
          title: const Text('Help Desk'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Name',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              name(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Your Village',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              villagee(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Your Age',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              age(),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              description(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Upload Prescription',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontSize: size.width * 0.045,
                ),
              ),
              uploadPres(),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField name() {
    Size size = MediaQuery.of(context).size;
    return TextField(
      readOnly: true,
      decoration: userInputDecoration.copyWith(
        hintText: userName,
        hintStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Lexend',
          fontSize: size.width * 0.045,
        ),
      ),
    );
  }

  TextField villagee() {
    Size size = MediaQuery.of(context).size;
    return TextField(
      readOnly: true,
      decoration: userInputDecoration.copyWith(
        hintText: village,
        hintStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Lexend',
          fontSize: size.width * 0.045,
        ),
      ),
    );
  }

  TextField age() {
    Size size = MediaQuery.of(context).size;
    return TextField(
      keyboardType: TextInputType.number,
      maxLength: 2,
      cursorColor: const Color.fromARGB(255, 157, 135, 149),
      controller: _controller,
      decoration: userInputDecoration.copyWith(
        labelText: 'Age',
        hintText: 'Enter your age',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontFamily: 'Lexend',
          fontSize: size.width * 0.045,
        ),
      ),
      onChanged: (value) {
        setState(() {
          userAge = value;
        });
      },
    );
  }

  TextField description() {
    Size size = MediaQuery.of(context).size;
    return TextField(
      cursorColor: const Color.fromARGB(255, 157, 135, 149),
      minLines: 1,
      maxLines: 10,
      autocorrect: true,
      keyboardType: TextInputType.multiline,
      decoration: userInputDecoration.copyWith(
        labelText: 'Description',
        hintText: 'Describe your issue',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontFamily: 'Lexend',
          fontSize: size.width * 0.045,
        ),
      ),
      onChanged: (value) {
        setState(() {
          desc = value;
        });
      },
    );
  }

  ElevatedButton uploadPres() {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        if (userAge != '' && desc != '') {
          uploadPrescription();
        } else {
          Fluttertoast.showToast(
            msg: "Please fill all the details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size.width, size.height * 0.05),
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      child: Text(
        'Upload Prescription',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Lexend',
          fontSize: size.width * 0.045,
        ),
      ),
    );
  }

  uploadPrescription() {
    return showDialog(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            title: const Text("Upload Prescription"),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
              ),
              height: 50,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          selectFromCamera().whenComplete(() {
                            nextScreen(
                                context,
                                PreviewPage(
                                  image: _image,
                                  name: userName,
                                  age: userAge,
                                  village: village,
                                  description: desc,
                                ));
                          });
                        },
                        icon: Icon(
                          Icons.photo_camera_rounded,
                          size: size.width * 0.09,
                          color: const Color.fromARGB(255, 157, 135, 149),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          selectFromGallery().whenComplete(() => nextScreen(
                              context,
                              PreviewPage(
                                image: _image,
                                name: userName,
                                age: userAge,
                                village: village,
                                description: desc,
                              )));
                        },
                        icon: Icon(
                          Icons.photo_library_rounded,
                          size: size.width * 0.09,
                          color: const Color.fromARGB(255, 157, 135, 149),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future selectFromGallery() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar(
          context,
          Colors.red,
          const Text("No Image Selected"),
        );
      }
    });
  }

  Future selectFromCamera() async {
    final pick = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar(
          context,
          Colors.red,
          const Text("No Image clicked"),
        );
      }
    });
  }

  uploadPrescriptionToFirebase() {}
}
