import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/components/otoChatPage.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewProfileForUser extends StatefulWidget {
  final String id;
  final String collectionName;
  final String fieldName;

  const ViewProfileForUser(
      {Key? key,
      required this.id,
      required this.collectionName,
      required this.fieldName})
      : super(key: key);

  @override
  State<ViewProfileForUser> createState() => _ViewProfileForUserState();
}

class _ViewProfileForUserState extends State<ViewProfileForUser> {
  List users = [];
  List admin = [];

  @override
  void initState() {
    super.initState();
    getUserDetails();
    getCurrentUserDetails();
  }

  getUserDetails() async {
    var users = await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .where(widget.fieldName, isEqualTo: widget.id)
        .get();
    setState(() {
      this.users = users.docs;
    });
  }

  getCurrentUserDetails() async {
    var current = await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      admin = current.docs;
    });
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              users[0]['gender'] == 'Male'
                  ? Image.asset('Assets/images/maleU.png')
                  : Image.asset('Assets/images/femaleU.png'),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                capitalize(users[0]['name']),
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
              Text.rich(TextSpan(
                  text: "Email: ",
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: users[0]['email'],
                        style: TextStyle(
                          fontFamily: "Lexend",
                          fontSize: size.width * 0.045,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            mail(users[0]['email']);
                          }),
                  ])),
              SizedBox(
                height: size.height * 0.02,
              ),
              widget.collectionName == 'users'
                  ? Text(
                      'Village: ${users[0]['village']}, Dehradun, UK',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Lexend",
                        fontSize: size.width * 0.05,
                      ),
                    )
                  : widget.collectionName == 'doctors'
                      ? Text(
                          'Specialization: ${users[0]['doctor']}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Lexend",
                            fontSize: size.width * 0.05,
                          ),
                        )
                      : widget.collectionName == 'teacher'
                          ? Text(
                              'Subject: ${users[0]['subject']}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Lexend",
                                fontSize: size.width * 0.05,
                              ),
                            )
                          : const SizedBox(),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.8,
                indent: size.width * 0.1,
                endIndent: size.width * 0.1,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      mail(users[0]['email']);
                    },
                    child: Image.asset(
                      'Assets/Logo/gmail.png',
                      width: size.width * 0.12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreen(
                          context,
                          OtoChatPage(
                              name: users[0]['name'],
                              myName: admin[0]['name'],
                              receiverId: users[0][widget.fieldName]));
                    },
                    child: Image.asset(
                      'Assets/Logo/message.png',
                      width: size.width * 0.12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            'Go Back',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'LexendLight',
                              fontSize: size.width * 0.045,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  mail(String mailId) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: mailId,
    );
    await launchUrl(params);
  }

  capitalize(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }
}
