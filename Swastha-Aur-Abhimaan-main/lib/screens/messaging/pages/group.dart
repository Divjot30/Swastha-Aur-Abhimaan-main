import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/components/noGroupWindow.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/models/groupTile.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class Group extends StatefulWidget {
  final bool? isUser;
  final bool? isDoctor;
  final bool? isTrainer;
  final bool? isTeacher;
  final bool? isAdmin;
  final String? email;
  const Group({
    Key? key,
    required this.isAdmin,
    required this.isDoctor,
    required this.isTeacher,
    required this.isTrainer,
    required this.isUser,
    this.email,
  }) : super(key: key);

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  bool _isLoading = false;
  QuerySnapshot? adminSnapshot;
  QuerySnapshot? userSnapshot;
  QuerySnapshot? trainerSnapshot;
  QuerySnapshot? teacherSnapshot;
  QuerySnapshot? doctorSnapshot;

  String groupName = "";
  String adminName = "";
  String doctorName = "";
  String teacherName = "";
  String trainerName = "";
  Stream? adminGroup;
  Stream? userGroup;
  Stream? trainerGroup;
  Stream? teacherGroup;
  Stream? doctorGroup;
  String adminId = "";
  // String email = "";

  getAdminDetails() async {
    await FirebaseFirestore.instance
        .collection("admin")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        adminName = value.data()!['name'];
      });
    });
  }

  getDoctorDetails() async {
    await FirebaseFirestore.instance
        .collection("doctors")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        doctorName = value.data()!['name'];
      });
    });
  }

  getTeacherDetails() async {
    await FirebaseFirestore.instance
        .collection("teachers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        teacherName = value.data()!['name'];
      });
    });
  }

  getTrainerDetails() async {
    await FirebaseFirestore.instance
        .collection("trainers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        trainerName = value.data()!['name'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    widget.isAdmin == true
        ? getAdminGroupData()
        : widget.isUser == true
            ? getUserGroupData()
            : widget.isTrainer == true
                ? getTrainerGroupData()
                : widget.isTeacher == true
                    ? getTeacherGroupData()
                    : widget.isDoctor == true
                        ? getDoctorGroupData()
                        : null;
    getAdminDetails();
    getDoctorDetails();
    getTeacherDetails();
    getTrainerDetails();
  }

  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  getAdminGroupData() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getAdminGroup()
        .then((snapshot) {
      setState(() {
        adminGroup = snapshot;
      });
    });
  }

  getUserGroupData() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroup()
        .then((snapshot) {
      setState(() {
        userGroup = snapshot;
      });
    });
  }

  getTrainerGroupData() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getTrainerGroup()
        .then((snapshot) {
      setState(() {
        trainerGroup = snapshot;
      });
    });
  }

  getTeacherGroupData() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getTeacherGroup()
        .then((snapshot) {
      setState(() {
        teacherGroup = snapshot;
      });
    });
  }

  getDoctorGroupData() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getDoctorGroup(FirebaseAuth.instance.currentUser!.uid)
        .then((snapshot) {
      setState(() {
        doctorGroup = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.isUser! == false
          ? FloatingActionButton(
              onPressed: () {
                popUpDialog(context);
              },
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 99, 96, 96),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            )
          : null,
      body: groupList(),
    );
  }

  popUpDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Create a new group",
              textAlign: TextAlign.left,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor))
                    : TextField(
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            groupName = value;
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(17)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(17)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(17)),
                        ),
                      ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 99, 96, 96),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                ),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: size.width * 0.05, fontFamily: 'Lexend'),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (groupName != "") {
                    setState(() {
                      _isLoading = true;
                    });
                    widget.isAdmin == true
                        ? DatabaseService(
                                uid: FirebaseAuth.instance.currentUser!.uid)
                            .createGroup(
                                adminName,
                                FirebaseAuth.instance.currentUser!.uid,
                                groupName)
                            .whenComplete(() {
                            _isLoading = false;
                          })
                        : widget.isDoctor == true
                            ? DatabaseService(
                                    uid: FirebaseAuth.instance.currentUser!.uid)
                                .createGroupByDoctor(
                                    doctorName,
                                    FirebaseAuth.instance.currentUser!.uid,
                                    groupName)
                                .whenComplete(() {
                                _isLoading = false;
                              })
                            : widget.isTeacher!
                                ? DatabaseService(
                                        uid: FirebaseAuth
                                            .instance.currentUser!.uid)
                                    .createGroupByTeacher(
                                        teacherName,
                                        FirebaseAuth.instance.currentUser!.uid,
                                        groupName)
                                    .whenComplete(() {
                                    _isLoading = false;
                                  })
                                : widget.isTrainer!
                                    ? DatabaseService(
                                            uid: FirebaseAuth
                                                .instance.currentUser!.uid)
                                        .createGroupByTrainer(
                                            trainerName,
                                            FirebaseAuth
                                                .instance.currentUser!.uid,
                                            groupName)
                                        .whenComplete(() {
                                        _isLoading = false;
                                      })
                                    : null;
                    Navigator.of(context).pop();
                    Fluttertoast.showToast(
                        msg: "Group created successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 99, 96, 96),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                ),
                child: Text(
                  "Create",
                  style: TextStyle(
                      fontSize: size.width * 0.05, fontFamily: 'Lexend'),
                ),
              ),
            ],
          );
        });
  }

  groupList() {
    return StreamBuilder(
        stream: widget.isUser! == true
            ? userGroup
            : widget.isAdmin! == true
                ? adminGroup
                : widget.isDoctor! == true
                    ? doctorGroup
                    : widget.isTrainer! == true
                        ? trainerGroup
                        : widget.isTeacher! == true
                            ? teacherGroup
                            : null,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['groups'] != null) {
              if (snapshot.data['groups'].length != 0) {
                return ListView.builder(
                  itemCount: snapshot.data['groups'].length,
                  itemBuilder: (context, index) {
                    int reverseIndex =
                        snapshot.data['groups'].length - index - 1;
                    // print(getId(snapshot.data['groups'][reverseIndex]));
                    return GroupTile(
                      groupId: getId(snapshot.data['groups'][reverseIndex]),
                      userName: snapshot.data['name'],
                      groupName: getName(snapshot.data['groups'][reverseIndex]),
                      isUser: widget.isUser!,
                      isDoctor: widget.isDoctor!,
                      isTrainer: widget.isTrainer!,
                      isTeacher: widget.isTeacher!,
                      isAdmin: widget.isAdmin!,
                    );
                  },
                );
              } else {
                return const NoGroupWidget();
              }
            } else {
              return const NoGroupWidget();
            }
          } else {
            return Center(
              child: Image.asset('Assets/Logo/noGroup.png'),
            );
          }
        });
  }
}
