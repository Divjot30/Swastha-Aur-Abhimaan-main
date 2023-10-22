import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/models/imageMessageTile.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/models/messageTile.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/pages/groupInfo.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class GroupChatPage extends StatefulWidget {
  final bool isUser;
  final bool isDoctor;
  final bool isTrainer;
  final bool isTeacher;
  final bool isAdmin;
  final String groupName;
  final String groupId;
  final String userName;

  const GroupChatPage({
    Key? key,
    required this.groupId,
    required this.groupName,
    required this.userName,
    required this.isAdmin,
    required this.isDoctor,
    required this.isTeacher,
    required this.isTrainer,
    required this.isUser,
  }) : super(key: key);

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  List message = [];
  List sender = [];
  List time = [];
  File? _image;
  String? downloadUrl;
  final imagePicker = ImagePicker();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getChatandAdmin();
  }

  getChatandAdmin() async {
    var chats = await FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .collection('messages')
        .orderBy('time')
        .get();
    setState(() {
      message = chats.docs;
      sender = chats.docs;
      time = chats.docs;
    });
  }

  Future selectImageFromGallery() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        Fluttertoast.showToast(msg: 'No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 99, 96, 96),
        title: Text(
          widget.groupName,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.05,
            fontFamily: 'Lexend',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: size.width * 0.05,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(
                    context,
                    GroupInfo(
                      groupName: widget.groupName,
                      groupId: widget.groupId,
                      isAdmin: widget.isAdmin,
                      isDoctor: widget.isDoctor,
                      isTeacher: widget.isTeacher,
                      isTrainer: widget.isTrainer,
                      isUser: widget.isUser,
                    ));
              },
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: size.width * 0.07,
              )),
        ],
      ),
      body: Column(
        children: [
      Expanded(child: chatMessages()),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          width: size.width,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 99, 96, 96),
              borderRadius: BorderRadius.circular(40),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Send a Message...",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(141, 255, 255, 255),
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectImageFromGallery().whenComplete(() {
                      imagePreviewPopUp().whenComplete(() {
                        Navigator.pop(context);
                      });
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 65, 65),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(Icons.image,
                        color: Colors.white, size: 20),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    sendMessage();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 65, 65),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        ],
      ),
    );
  }

  Widget chatMessages() {
    return ListView.builder(
        reverse: true,
        itemCount: sender.length,
        itemBuilder: (context, index) {
          int reverseIndex = message.length - index - 1;
          return message[reverseIndex]
                      .data()['message']
                      .toString()
                      .contains('https://') ||
                  message[reverseIndex]
                      .data()['message']
                      .toString()
                      .contains('http://')
              ? ImageMessageTile(
                  message: message[reverseIndex].data()['message'],
                  sender: sender[reverseIndex].data()['sender'],
                  sentByMe:
                      widget.userName == sender[reverseIndex].data()['sender'])
              : MessageTile(
                  message: message[reverseIndex].data()['message'],
                  sender: sender[reverseIndex].data()['sender'],
                  sentByMe:
                      widget.userName == sender[reverseIndex].data()['sender']);
        });
  }

  sendMessage() async {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": messageController.text,
        "sender": widget.userName,
        "time": DateTime.now().millisecondsSinceEpoch,
      };
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .sendMessage(widget.groupId, chatMessageMap);
      setState(() {
        messageController.clear();
        refresh();
      });
    }
  }

  sendImageMessage(String url) async {
    if (_image != null) {
      Map<String, dynamic> chatMessageMap = {
        "message": url,
        "sender": widget.userName,
        "time": DateTime.now().millisecondsSinceEpoch,
      };
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .sendMessage(widget.groupId, chatMessageMap);
      setState(() {
        messageController.clear();
        refresh();
      });
    }
  }

  uploadImage() async {
    if (_image != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child(widget.groupName)
          .child('${DateTime.now()}.png');
      await ref.putFile(_image!);
      downloadUrl = await ref.getDownloadURL();
      sendImageMessage(downloadUrl!);
    }
  }

  bool checkIfMessageisaLink(String message) {
    if (message.contains('https://') || message.contains('http://')) {
      return true;
    } else {
      return false;
    }
  }

  // refresh screen
  refresh() {
    setState(() {
      getChatandAdmin();
    });
  }

  imagePreviewPopUp() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Preview Image',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Lexend',
              )),
          content: Image.file(_image!),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                uploadImage().whenComplete(() {
                  Navigator.pop(context);
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 66, 65, 65).withOpacity(0.5)),
              ),
              child: const Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
