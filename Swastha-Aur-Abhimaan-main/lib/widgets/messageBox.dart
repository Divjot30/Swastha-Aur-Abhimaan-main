import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageBox extends StatelessWidget {
  String message = "";
  MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 99, 96, 96),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Lexend",
                ),
                decoration: InputDecoration(
                  hintText: "Send the Message...",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.04,
                    fontFamily: "Lexend",
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  message = value;
                },
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.send_sharp,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
