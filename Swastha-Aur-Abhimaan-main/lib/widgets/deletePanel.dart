import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DeletePanel extends StatefulWidget {
  final String collectionName;
  final String id;
  const DeletePanel({Key? key, required this.collectionName, required this.id})
      : super(key: key);

  @override
  State<DeletePanel> createState() => _DeletePanelState();
}

class _DeletePanelState extends State<DeletePanel> {
  User? user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.04,
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      height: size.height * 0.35,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 34, 34, 36),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Are you sure you want to delete this user?',
            style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.05,
                fontFamily: 'LexendLight',
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      deleteDataFromFirebaseUsingUid();
                    },
                    child: Image.asset(
                      'Assets/Logo/yes.png',
                      width: size.width * 0.1,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.05,
                      fontFamily: 'LexendLight',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'Assets/Logo/noD.png',
                      width: size.width * 0.1,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.05,
                      fontFamily: 'LexendLight',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 72, 71, 71),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Cancel',
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
    );
  }

  deleteDataFromFirebaseUsingUid() async {
    await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .doc(widget.id)
        .delete()
        .whenComplete(() {
      Navigator.popAndPushNamed(context, '/adminHome');
    });
  }
}
