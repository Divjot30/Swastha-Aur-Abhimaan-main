import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/viewProfile/viewProfile.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/components/otoChatPage.dart';

class ActionsPanel extends StatefulWidget {
  final String collectionName;
  final String fieldName;
  final String name;
  final String id;
  final String adminName;
  const ActionsPanel(
      {Key? key,
      required this.adminName,
      required this.name,
      required this.id,
      required this.collectionName,
      required this.fieldName})
      : super(key: key);

  @override
  State<ActionsPanel> createState() => _ActionsPanelState();
}

class _ActionsPanelState extends State<ActionsPanel> {
  List datas = [];
  List admin = [];

  @override
  void initState() {
    super.initState();
    getDetails();
    getCurrentDetais();
  }

  getDetails() async {
    await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .where(widget.fieldName, isEqualTo: widget.id)
        .get()
        .then((value) {
      setState(() {
        datas = value.docs;
      });
    });
  }

  getCurrentDetais() async {
    var current = await FirebaseFirestore.instance
        .collection('admin')
        .where('adminId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      admin = current.docs;
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
                            collectionName: widget.collectionName,
                            fieldName: widget.fieldName,
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
            ],
          ),
        ],
      ),
    );
  }
}
