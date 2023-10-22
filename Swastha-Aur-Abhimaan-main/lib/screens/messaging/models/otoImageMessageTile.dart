import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/models/fullImagePreview.dart';

class OtoImageMessageTile extends StatelessWidget {
  final String message;
  final String sender;
  final bool sentByMe;
  final String myName;
  final String name;
  const OtoImageMessageTile(
      {super.key,
      required this.name,
      required this.myName,
      required this.message,
      required this.sender,
      required this.sentByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 2, bottom: 2, left: sentByMe ? 0 : 20, right: sentByMe ? 20 : 0),
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        margin: sentByMe
            ? const EdgeInsets.only(left: 30)
            : const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            color: sentByMe
                ? const Color.fromARGB(255, 26, 31, 22).withOpacity(0.9)
                : const Color.fromARGB(255, 128, 128, 128),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomLeft: sentByMe ? const Radius.circular(25) : Radius.zero,
                bottomRight:
                    sentByMe ? Radius.zero : const Radius.circular(25))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                nextScreen(
                    context,
                    FullImagePreview(
                      imageUrl: message,
                      sender: sentByMe ? myName : name,
                    ));
              },
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    message,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
