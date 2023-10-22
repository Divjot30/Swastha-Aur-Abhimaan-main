import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/widgets/widgets.dart';

class UserProfileModel extends StatelessWidget {
  final String name;
  final String email;
  final String village;
  final String gender;

  const UserProfileModel({
    Key? key,
    required this.name,
    required this.email,
    required this.village,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: size.height * 0.05),
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'LexendLight',
                        fontSize: size.width * 0.045,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          gender == 'Male' || gender == 'male'
              ? Image.asset('Assets/Logo/maleUser.png')
              : Image.asset('Assets/Logo/femaleUser.png'),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            capitaliseString(name),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "Lexend",
              fontSize: size.width * 0.08,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: size.width * 0.25,
            endIndent: size.width * 0.25,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text.rich(
            TextSpan(
              text: "Email: ",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: size.width * 0.055,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: email,
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text.rich(
            TextSpan(
              text: "Gender: ",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: size.width * 0.055,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: capitalizeString(gender),
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05,
                    color: gender == 'Male' || gender == 'male'
                        ? Colors.blue
                        : Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text.rich(
            TextSpan(
              text: "Village: ",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: size.width * 0.055,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: capitalizeString(village),
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: size.width * 0.05,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
