import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/quiz/components/quizOptions.dart';

class QuizPage extends StatefulWidget {
  final bool isUser;
  const QuizPage({Key? key, required this.isUser}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz',
            style: TextStyle(
              fontSize: size.width * 0.07,
              color: Colors.black,
            )),
        backgroundColor: const Color.fromARGB(190, 245, 203, 200),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: QuizOptions(
          isUser: widget.isUser,
        ),
      ),
    );
  }
}
