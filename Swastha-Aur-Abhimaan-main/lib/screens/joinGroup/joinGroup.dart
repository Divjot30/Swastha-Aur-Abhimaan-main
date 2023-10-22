import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/user/pages/fillDetails.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class JoinGroup extends StatefulWidget {
  final String? groupName;
  final String userName;
  final String gender;
  final String email;
  final bool isAdminRegistering;

  const JoinGroup(
      {Key? key,
      required this.groupName,
      required this.isAdminRegistering,
      required this.email,
      required this.userName,
      required this.gender})
      : super(key: key);

  @override
  State<JoinGroup> createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  bool isLoading = false;
  QuerySnapshot? groupSnapshot;
  bool hasUserSearched = false;
  bool isJoined = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 56, 54, 54),
                borderRadius: BorderRadius.only(
                  bottomRight:
                      Radius.elliptical(size.width * 0.3, size.height * 0.1),
                  bottomLeft:
                      Radius.elliptical(size.width * 0.3, size.height * 0.1),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    CircleAvatar(
                      radius: size.width * 0.15,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: size.width * 0.17,
                        backgroundImage: widget.gender == 'Male'
                            ? const AssetImage('Assets/Logo/maleUser.png')
                            : const AssetImage('Assets/Logo/femaleUser.png'),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.12,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Lexend"),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      widget.userName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.09,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Lexend"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.07, right: size.width * 0.07),
              child: TextFormField(
                readOnly: true,
                initialValue: widget.groupName!,
                decoration: InputDecoration(
                  hintText: "Enter Village Name",
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: size.width * 0.046,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Lexend"),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              onPressed: () {
                searchMethod();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 56, 54, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                ),
              ),
              child: Text(
                "Go",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Lexend"),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : groupList(),
          ],
        ),
      ),
    ));
  }

  searchMethod() async {
    if (widget.groupName!.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .searchGroupByName(widget.groupName!)
          .then((snapshot) {
        setState(() {
          groupSnapshot = snapshot;
          isLoading = false;
          hasUserSearched = true;
        });
      });
    }
  }

  groupList() {
    return hasUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: groupSnapshot!.docs.length,
            itemBuilder: (context, index) {
              return groupTile(
                widget.userName,
                groupSnapshot!.docs[index]['groupId'],
                groupSnapshot!.docs[index]['groupName'],
              );
            },
          )
        : Container();
  }

  joinedOrNot(String userName, String groupId, String groupName) async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .isUserJoined(groupName, groupId, userName)
        .then((value) {
      setState(() {
        isJoined = value;
      });
    });
  }

  Widget groupTile(String userName, String groupId, String groupName) {
    Size size = MediaQuery.of(context).size;
    // already in group
    joinedOrNot(userName, groupId, groupName);
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 56, 54, 54),
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Text(
              groupName.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 56, 54, 54),
                fontSize: 22,
              ),
            ),
          ),
          title: Text(
            groupName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: InkWell(
            onTap: () async {
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .togglegroupJoin(groupId, userName, groupName);
              if (isJoined) {
                setState(() {
                  isJoined = !isJoined;
                });

                Fluttertoast.showToast(
                    msg: "Successfully Joined the Group $groupName",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Future.delayed(
                    const Duration(
                      seconds: 2,
                    ), () {
                  nextScreenReplace(
                      context,
                      FillDetails(
                        isAdminRegistering: widget.isAdminRegistering,
                        email: widget.email,
                      ));
                });
              } else {
                setState(() {
                  isJoined = !isJoined;
                });
                Fluttertoast.showToast(
                    msg: "Successfully Left the Group $groupName",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            child: isJoined
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 239, 238, 240),
                      border: Border.all(
                        color: const Color.fromARGB(255, 56, 54, 54)
                            .withOpacity(0.7),
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: const Text(
                      "Joined",
                      style: TextStyle(
                        color: Color.fromARGB(255, 56, 54, 54),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Text(
                      "Join Now",
                      style: TextStyle(
                        color: Color.fromARGB(255, 56, 54, 54),
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
