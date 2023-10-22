import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByMe;
  const MessageTile(
      {super.key,
      required this.message,
      required this.sender,
      required this.sentByMe});

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          top: 2,
          bottom: 2,
          left: widget.sentByMe ? 0 : 20,
          right: widget.sentByMe ? 20 : 0),
      alignment: widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.03),
        margin: widget.sentByMe
            ? const EdgeInsets.only(left: 30)
            : const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            color: widget.sentByMe
                ? const Color.fromARGB(255, 26, 31, 22).withOpacity(0.9)
                : const Color.fromARGB(255, 128, 128, 128),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomLeft:
                    widget.sentByMe ? const Radius.circular(25) : Radius.zero,
                bottomRight:
                    widget.sentByMe ? Radius.zero : const Radius.circular(25))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sender.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.03,
                color: widget.sentByMe
                    ? const Color.fromARGB(255, 228, 231, 64)
                    : const Color.fromARGB(255, 54, 244, 235),
                fontWeight: FontWeight.w500,
                fontFamily: 'Lexend',
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: Colors.white,
                fontFamily: 'Lexend',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
