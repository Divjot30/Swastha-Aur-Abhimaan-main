import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/components/groupChatPage.dart';

class GroupTile extends StatefulWidget {
  final bool isUser;
  final bool isDoctor;
  final bool isTrainer;
  final bool isTeacher;
  final bool isAdmin;
  final String userName;
  final String groupId;
  final String groupName;

  const GroupTile({
    Key? key,
    required this.groupId,
    required this.userName,
    required this.groupName,
    required this.isAdmin,
    required this.isDoctor,
    required this.isTeacher,
    required this.isTrainer,
    required this.isUser,
  }) : super(key: key);

  @override
  _GroupTileState createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            GroupChatPage(
              groupId: widget.groupId,
              groupName: widget.groupName,
              userName: widget.userName,
              isAdmin: widget.isAdmin,
              isDoctor: widget.isDoctor,
              isTeacher: widget.isTeacher,
              isTrainer: widget.isTrainer,
              isUser: widget.isUser,
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: const Color.fromARGB(255, 99, 96, 96),
            child: Text(
              widget.groupName.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          title: Text(
            widget.groupName,
            style: const TextStyle(
              color: Color.fromARGB(255, 99, 96, 96),
              fontSize: 20,
              fontFamily: 'Lexend',
            ),
          ),
          subtitle: Text(
            "Join the conversation as ${widget.userName}",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 99, 96, 96).withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
