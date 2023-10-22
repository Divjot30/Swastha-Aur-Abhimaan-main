import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/viewProfile/viewProfile.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/components/otoChatPage.dart';
import 'package:swastha_aur_swabhimaan/screens/quiz/pages/takeQuiz.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class UserActionsPanel extends StatefulWidget {
  final String name;
  final String village;
  final String id;
  final String adminName;
  const UserActionsPanel(
      {Key? key,
      required this.adminName,
      required this.name,
      required this.village,
      required this.id})
      : super(key: key);

  @override
  State<UserActionsPanel> createState() => _UserActionsPanelState();
}

class _UserActionsPanelState extends State<UserActionsPanel> {
  QuerySnapshot? surveyData;
  List users = [];

  @override
  void initState() {
    super.initState();
    getQuizData();
    getUserDetails();
  }

  getQuizData() async {
    await DatabaseService().gettingQuizData().then((value) {
      setState(() {
        surveyData = value;
      });
    });
  }

  

  getUserDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: widget.id)
        .get()
        .then((value) {
      setState(() {
        users = value.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.02,
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      height: size.height * 0.25,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 157, 135, 149),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.065,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Kollektif'),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
                color: Colors.white,
                iconSize: size.width * 0.05,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            '${widget.village}, Dehradun, Uttarakhand',
            style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w400,
                fontFamily: 'Kollektif'),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            children: [
              
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      nextScreen(
                          context,
                          ViewProfile(
                            adminName: widget.adminName,
                            id: widget.id,
                            collectionName: 'users',
                            fieldName: 'userId',
                          ));
                    },
                    icon: const Icon(Icons.person),
                    color: Colors.white,
                    iconSize: size.width * 0.08,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Kollektif'),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.03,
                height: size.height * 0.03,
                child: const VerticalDivider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      if (surveyData!.docs.isEmpty) {
                        nextScreen(
                          context,
                          TakeQuiz(
                            village: widget.village,
                            id: widget.id,
                          ),
                        );
                      } else if (surveyData!.docs[0]['id'] == widget.id) {
                        Fluttertoast.showToast(
                            msg: "You have already taken the quiz",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor:
                                const Color.fromARGB(255, 157, 135, 149),
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        nextScreen(
                          context,
                          TakeQuiz(
                            village: widget.village,
                            id: widget.id,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.info),
                    color: Colors.white,
                    iconSize: size.width * 0.08,
                  ),
                  Text(
                    'Saved Details',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Kollektif'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
