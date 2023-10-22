import 'package:flutter/material.dart';

class NoVideoWidget extends StatelessWidget {
  final Color colors;
  const NoVideoWidget({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle,
            color: colors,
            size: 65,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "There are no Videos to show.\nClick on the + icon to add a new Video.",
              style: TextStyle(
                color: colors,
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
