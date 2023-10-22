import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/addParticipant/addParticipant.dart';
import 'package:swastha_aur_swabhimaan/services/authServices.dart';

class GroupInfo extends StatefulWidget {
  final bool isUser;
  final bool isDoctor;
  final bool isTrainer;
  final bool isTeacher;
  final bool isAdmin;
  final String groupName;
  final String groupId;

  const GroupInfo({
    Key? key,
    required this.groupName,
    required this.groupId,
    required this.isAdmin,
    required this.isDoctor,
    required this.isTeacher,
    required this.isTrainer,
    required this.isUser,
  }) : super(key: key);

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  List members = [];
  // Stream? groupMembers;
  AuthServices authServices = AuthServices();

  @override
  void initState() {
    getMembers();
    super.initState();
  }

  getMembers() async {
    var groupList = await FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .get();
    setState(() {
      members = groupList['members'];
    });
  }

  String getName(String r) {
    return r.substring(r.indexOf("_") + 1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Group Info",
          style: TextStyle(
            fontFamily: 'Lexend',
            color: Colors.white,
            fontSize: size.width * 0.05,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: size.width * 0.05,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 99, 96, 96),
        actions: [
          widget.isUser == false
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddParticipant(
                          groupId: widget.groupId,
                          groupName: widget.groupName,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(size.width * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 99, 96, 96).withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 99, 96, 96),
                    child: Text(
                      widget.groupName.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: size.width * 0.06,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Group: ${widget.groupName}",
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            memberList(),
          ],
        ),
      ),
    );
  }

  memberList() {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 99, 96, 96).withOpacity(0.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(180, 99, 96, 96),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: size.width * 0.08,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getName(members[index]),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.05,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              )
            ],
          );
        },
      ),
    );
  }
}
