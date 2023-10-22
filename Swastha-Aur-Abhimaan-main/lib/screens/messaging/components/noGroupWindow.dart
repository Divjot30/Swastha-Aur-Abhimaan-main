import 'package:flutter/material.dart';


class NoGroupWidget extends StatelessWidget {
  const NoGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_circle,
            color: Color.fromARGB(255, 99, 96, 96),
            size: 65,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "There are no Groups to show.\nClick on the + icon to add a new Group.",
              style: TextStyle(
                color: const Color.fromARGB(255, 99, 96, 96),
                fontSize: MediaQuery.of(context).size.width * 0.045,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
