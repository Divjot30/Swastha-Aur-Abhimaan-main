import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.w300,
    fontFamily: "Kollektif",
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 164, 5, 238),
      width: 2,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 0, 0, 0),
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 255, 0, 0),
      width: 2,
    ),
  ),
);

var lightInputDecoration = InputDecoration(
  labelStyle: const TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w300,
    fontFamily: "Kollektif",
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 5, 145, 238),
      width: 2,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
      width: 2,
    ),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 255, 0, 0),
      width: 2,
    ),
  ),
);

var darkInputDecoration = InputDecoration(
  labelStyle: const TextStyle(
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.w300,
    fontFamily: "Kollektif",
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 5, 145, 238),
      width: 2,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
      width: 2,
    ),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 255, 0, 0),
      width: 2,
    ),
  ),
);

var userInputDecoration = const InputDecoration(
  labelStyle: TextStyle(
    color: Color.fromARGB(255, 157, 135, 149),
    fontWeight: FontWeight.w300,
    fontFamily: "Lexend",
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(17.0)),
    borderSide:
        BorderSide(color: Color.fromARGB(255, 157, 135, 149), width: 1.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(17.0)),
    borderSide:
        BorderSide(color: Color.fromARGB(255, 157, 135, 149), width: 1.5),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(17.0)),
    borderSide:
        BorderSide(color: Color.fromARGB(255, 157, 135, 149), width: 1.5),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(17.0)),
    borderSide:
        BorderSide(color: Color.fromARGB(255, 157, 135, 149), width: 1.5),
  ),
);

class CustumInputDecoration {
  static InputDecoration getDecoration(
      String label, String hint, IconData icon, Color color, double dbl) {
    return InputDecoration(
      label: Text(label),
      labelStyle: TextStyle(
        fontSize: dbl,
        fontWeight: FontWeight.w400,
        fontFamily: "Lexend",
        color: color,
      ),
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: dbl,
        fontWeight: FontWeight.w400,
        fontFamily: "Lexend",
        color: color,
      ),
      suffixIcon: Icon(
        icon,
        color: color,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: 1),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
    );
  }
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}

FloatingActionButton backArrow(context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Icon(Icons.arrow_back),
  );
}

basicText(String text, String variable, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Text.rich(
    TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: "Lexend",
        fontSize: size.width * 0.05,
        color: Colors.black,
      ),
      children: [
        TextSpan(
          text: capitalizeString(variable),
          style: TextStyle(
            fontFamily: "Lexend",
            fontSize: size.width * 0.045,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}

capitalizeString(String s) {
    String str = s;
    String newStr = "";
    for (int i = 0; i < str.length; i++) {
      if (i == 0) {
        newStr = newStr + str[i].toUpperCase();
      } else {
        newStr = newStr + str[i];
      }
    }
    return newStr;
  }