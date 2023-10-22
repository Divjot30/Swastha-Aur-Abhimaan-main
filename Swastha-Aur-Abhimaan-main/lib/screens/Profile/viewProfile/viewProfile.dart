import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/deletePanel.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewProfile extends StatefulWidget {
  final String id;
  final String collectionName;
  final String fieldName;
  final String adminName;

  const ViewProfile(
      {Key? key,
      required this.adminName,
      required this.id,
      required this.collectionName,
      required this.fieldName})
      : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  List users = [];
  List admin = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  getUserDetails() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .where(widget.fieldName, isEqualTo: widget.id)
        .get();

    setState(() {
      users = querySnapshot.docs; // Update the users list with fetched data
      isLoading = false;
    });
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (isLoading) {
      return const Center(
        child:
            CircularProgressIndicator(), // Display the circular progress indicator while loading
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
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
                capitaliseString(users[0]['name']),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lexend",
                  fontSize: 28,
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
                  style: const TextStyle(
                    fontFamily: "Lexend",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: users[0]['email'],
                        style: const TextStyle(
                          fontFamily: "Lexend",
                          fontSize: 16,
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
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Lexend",
                        fontSize: 18,
                      ),
                    )
                  : widget.collectionName == 'doctors'
                      ? Text(
                          'Specialization: ${users[0]['doctor']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Lexend",
                            fontSize: 18,
                          ),
                        )
                      : widget.collectionName == 'teachers'
                          ? Text(
                              'Subject: ${users[0]['subject']}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Lexend",
                                fontSize: 18,
                              ),
                            )
                          : const SizedBox(),
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
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => DeletePanel(
                                collectionName: widget.collectionName,
                                id: widget.id,
                              ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ));
                    },
                    child: Image.asset(
                      'Assets/Logo/delete.png',
                      width: size.width * 0.12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.08),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
}
