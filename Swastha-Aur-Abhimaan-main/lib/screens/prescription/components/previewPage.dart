import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/components/custTextBox.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class PreviewPage extends StatefulWidget {
  final String name;
  final String age;
  final String village;
  final String description;
  final File? image;
  const PreviewPage(
      {Key? key,
      required this.image,
      required this.name,
      required this.age,
      required this.village,
      required this.description})
      : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  String? downloadUrl;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
        title: const Text('Preview Consultation'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CusTextBox(
                label: widget.name,
                fontWeight: FontWeight.w700,
                fontSize: 0.08,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CusTextBox(
                label: widget.village,
                fontWeight: FontWeight.w500,
                fontSize: 0.07,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CusTextBox(
                label: widget.age,
                fontWeight: FontWeight.w400,
                fontSize: 0.06,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CusTextBox(
                label: widget.description,
                fontWeight: FontWeight.w400,
                fontSize: 0.06,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.3,
                child: Image.file(widget.image!),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 157, 135, 149),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontFamily: "Lexend",
                        color: Colors.white,
                        // fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      uploadImage().whenComplete(() {
                        Fluttertoast.showToast(
                            msg: "Prescription Uploaded",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.popAndPushNamed(context, '/userHome');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 157, 135, 149),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Text(
                      'Upload',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontFamily: "Lexend",
                        // fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadImage() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("Prescriptions/$postID" "$widget.image!.path");
    await ref.putFile(widget.image!);
    downloadUrl = await ref.getDownloadURL();
    DatabaseService().uploadingUserPrescription(
      widget.name,
      widget.village,
      widget.age,
      widget.description,
      downloadUrl!,
      FirebaseAuth.instance.currentUser!.uid,
    );
  }
}
