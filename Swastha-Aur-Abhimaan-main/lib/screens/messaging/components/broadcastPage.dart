import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/services/notificationServices.dart';

class BroadcastPage extends StatefulWidget {
  final String title;
  const BroadcastPage({Key? key, required this.title}) : super(key: key);

  @override
  State<BroadcastPage> createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 99, 96, 96),
        title: Text(
          'Send Broadcast to ${widget.title}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: "Lexend",
            fontSize: size.width * 0.05,
          ),
        ),
      ),
      body: Column(
        children: [
      Expanded(child: Container()),
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
                    sendBroadcast();
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

  sendBroadcast() async {
    await NotificationService.showNotification(
        title: 'New Notification',
        body: messageController.text,
        notificationLayout: NotificationLayout.Inbox);
  }
}
