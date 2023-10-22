import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/viewProfile/viewProfUser.dart';

// ignore: must_be_immutable
class DoctorTileModel extends StatelessWidget {
  String name;
  String role;
  String gender;
  String id;
  DoctorTileModel({
    Key? key,
    required this.name,
    required this.role,
    required this.gender,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            ViewProfileForUser(
                id: id, collectionName: 'doctors', fieldName: 'doctorId'));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              backgroundImage: gender == "Male"
                  ? const AssetImage('Assets/images/maleDoc.png')
                  : const AssetImage('Assets/images/femaleDoc.png'),
            ),
            Text(
              'Dr. ${capitalize(name)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
                fontFamily: 'Lexend',
                color: Colors.black,
              ),
            ),
            Text(
              role,
              style: TextStyle(
                fontSize: size.width * 0.04,
                fontFamily: 'Lexend',
                color: Colors.black.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }

  capitalize(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }
}
