import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DocProfileModel extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final String gender;

  const DocProfileModel({
    Key? key,
    required this.name,
    required this.email,
    required this.role,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: size.height * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 231, 231, 231),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'LexendLight',
                          fontSize: size.width * 0.045,
                        ),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        deleteAccountPopUp(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'LexendLight',
                          fontSize: size.width * 0.045,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          gender == 'Male' || gender == 'male'
              ? Image.asset('Assets/Logo/maleUser.png')
              : Image.asset('Assets/Logo/femaleUser.png'),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            capitaliseString(name),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "Lexend",
              fontSize: size.width * 0.08,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: size.width * 0.25,
            endIndent: size.width * 0.25,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text.rich(
            TextSpan(
              text: "Email: ",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: size.width * 0.055,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: email,
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text.rich(
            TextSpan(
              text: "Gender: ",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: size.width * 0.055,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: capitalizeString(gender),
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05,
                    color: gender == 'Male' || gender == 'male'
                        ? Colors.blue
                        : Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text.rich(
            TextSpan(
              text: "Specialized: ",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: size.width * 0.055,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: capitalizeString(role),
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  deleteAccountPopUp(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Delete Account',
            style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: size.width * 0.05,
            ),
          ),
          content: Text.rich(
            TextSpan(
              text: "You cannot recover your account after deleting it !!!\n\n",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: size.width * 0.04,
                color: Colors.red,
                decoration: TextDecoration.underline,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Are you sure you want to delete your account?',
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.04,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'No',
                style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.04,
                    color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                deleteAccountFromFirebase();
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: size.width * 0.04,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void launchWhatsApp({required String phone, required String message}) {
    String url() {
      if (Platform.isAndroid) {
        return "whatsapp://send?phone=$phone&text=$message";
      } else {
        return "whatsapp://send?phone=$phone&text=$message";
      }
    }

    launchUrl(
      Uri.parse(url()),
    );
  }

  deleteAccountFromFirebase() {
    FirebaseAuth.instance.currentUser!.delete();
  }
}
