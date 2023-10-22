import 'package:flutter/material.dart';

class QuizOptions extends StatelessWidget {
  final bool isUser;
  const QuizOptions({Key? key, required this.isUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.15),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isUser == false,
            child: GestureDetector(
              child: SizedBox(
                width: size.width * 0.7,
                child: ClipRRect(
                  child: Column(
                    children: [
                      Image.asset('Assets/Logo/makeQuiz.png'),
                      Text(
                        'Create Quiz',
                        style: TextStyle(
                          fontFamily: "Protrakt",
                          fontSize: size.width * 0.09,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 0.8,
            endIndent: size.width * 0.1,
            indent: size.width * 0.1,
          ),
          GestureDetector(
            onTap: () {
              // nextScreen(context, Village());
            },
            child: SizedBox(
              width: size.width * 0.7,
              child: ClipRRect(
                child: Column(
                  children: [
                    Image.asset('Assets/Logo/takeQuiz.png'),
                    Text(
                      'Take Quiz',
                      style: TextStyle(
                        fontFamily: "Protrakt",
                        fontSize: size.width * 0.09,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 0.8,
            endIndent: size.width * 0.1,
            indent: size.width * 0.1,
          ),
        ],
      ),
    );
  }
}
