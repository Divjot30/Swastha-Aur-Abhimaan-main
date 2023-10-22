import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/components/otoChatPage.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class ChatListTile extends StatefulWidget {
  final String name;
  final String role;
  final String id;
  const ChatListTile(
      {Key? key, required this.name, required this.role, required this.id})
      : super(key: key);

  @override
  State<ChatListTile> createState() => _ChatListTileState();
}

class _ChatListTileState extends State<ChatListTile> {
  String myName = '';
  @override
  void initState() {
    super.initState();
    getAdminName();
  }

  getAdminName() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .gettingAdminDataUsingUID()
        .then((value) {
      setState(() {
        myName = value['name'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            OtoChatPage(
              name: widget.name,
              myName: myName,
              receiverId: widget.id,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                5.0,
                0.0,
              ),
              blurRadius: 8.0,
              spreadRadius: 2.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromARGB(255, 99, 96, 96),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          title: Text(widget.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Lexend",
                fontSize: size.width * 0.05,
              )),
          subtitle: Text(widget.role,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontFamily: "Lexend",
                fontSize: size.width * 0.04,
              )),
        ),
      ),
    );
  }
}
