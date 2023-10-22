import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/models/otoImageMessageTile.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/models/otoMessageTile.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class OtoChatPage extends StatefulWidget {
  final String name;
  final String myName;
  final String receiverId;

  const OtoChatPage(
      {Key? key,
      required this.name,
      required this.myName,
      required this.receiverId})
      : super(key: key);

  @override
  State<OtoChatPage> createState() => _OtoChatPageState();
}

class _OtoChatPageState extends State<OtoChatPage> {
  TextEditingController messageController = TextEditingController();
  List chats = [];
  List rChats = [];
  bool empty = false;
  File? _image;
  String? downloadUrl;
  final imagePicker = ImagePicker();
  @override
  void initState() {
    super.initState();
    getChat();
  }

  getChat() async {
    DatabaseService()
        .otoMessageGet(
            widget.receiverId, FirebaseAuth.instance.currentUser!.uid)
        .then((value) {
      setState(() {
        chats = value.docs;
      });
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CustomAppBar(
          title: widget.name,
          barColor: const Color.fromARGB(255, 99, 96, 96),
          tiColor: Colors.white,
        ),
      ),
      body: Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: chatMessages(),
              ),
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
          )),
    );
  }

  Widget chatMessages() {
    return ListView.builder(
        reverse: true,
        itemCount: chats.length,
        itemBuilder: (context, index) {
          int reverseIndex = chats.length - index - 1;
          return chats[reverseIndex]['message']
                      .toString()
                      .contains('https://') ||
                  chats[reverseIndex]['message'].toString().contains('http://')
              ? OtoImageMessageTile(
                  myName: widget.myName,
                  name: widget.name,
                  message: chats.isEmpty
                      ? rChats[reverseIndex]['message']
                      : chats[reverseIndex]['message'],
                  sentByMe: chats.isEmpty
                      ? FirebaseAuth.instance.currentUser!.uid ==
                          rChats[reverseIndex]['sender']
                      : FirebaseAuth.instance.currentUser!.uid ==
                          chats[reverseIndex]['sender'],
                  sender: chats.isEmpty
                      ? rChats[reverseIndex]['sender']
                      : chats[reverseIndex]['sender'],
                )
              : OtoMessageTile(
                  message: chats.isEmpty
                      ? rChats[reverseIndex]['message']
                      : chats[reverseIndex]['message'],
                  sentByMe: chats.isEmpty
                      ? FirebaseAuth.instance.currentUser!.uid ==
                          rChats[reverseIndex]['sender']
                      : FirebaseAuth.instance.currentUser!.uid ==
                          chats[reverseIndex]['sender'],
                  sender: chats.isEmpty
                      ? rChats[reverseIndex]['sender']
                      : chats[reverseIndex]['sender'],
                );
        });
  }

  sendMessage() async {
    if (messageController.text.isNotEmpty) {
      String message = messageController.text;
      await DatabaseService()
          .otoMessageSend(
              widget.receiverId,
              FirebaseAuth.instance.currentUser!.uid,
              message,
              FirebaseAuth.instance.currentUser!.uid,
              widget.receiverId,
              DateTime.now().millisecondsSinceEpoch.toString())
          .then((value) {
        setState(() {
          messageController.text = '';
          refresh();
        });
      });
    }
  }

  attachMediaPopUp() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Select Media"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // attachMedia();
                  },
                  child: const ListTile(
                    leading: Icon(Icons.image),
                    title: Text("Image"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // attachMedia();
                  },
                  child: const ListTile(
                    leading: Icon(Icons.file_copy),
                    title: Text("File"),
                  ),
                ),
              ],
            ),
          );
        });
  }

  refresh() {
    setState(() {
      getChat();
    });
  }

  sendImageMessage(String url) async {
    if (_image != null) {
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .otoMessageSend(
              widget.receiverId,
              FirebaseAuth.instance.currentUser!.uid,
              url,
              FirebaseAuth.instance.currentUser!.uid,
              widget.receiverId,
              DateTime.now().millisecondsSinceEpoch.toString());
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
          .child(
              '${widget.receiverId}_${FirebaseAuth.instance.currentUser!.uid}')
          .child('${DateTime.now()}.png');
      await ref.putFile(_image!);
      downloadUrl = await ref.getDownloadURL();
      sendImageMessage(downloadUrl!);
    }
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
