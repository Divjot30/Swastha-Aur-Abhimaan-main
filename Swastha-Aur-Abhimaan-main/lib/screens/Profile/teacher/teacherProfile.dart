import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/teacher/components/teacherProfileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  String name = '';
  String email = '';
  String gender = '';
  String subject = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTrainerDetails();
  }

  getTrainerDetails() async {
    await HelperFunctions.getUserEmailFromSF().then((value) => email = value!);
    await DatabaseService().gettingTeacherDetails(email).then((value) {
      setState(() {
        name = value.docs[0].data()['name'];
        gender = value.docs[0].data()['gender'];
        subject = value.docs[0].data()['subject'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : TeacherProfileModel(
              name: name,
              email: email,
              role: subject,
              gender: gender,
            ),
    );
  }
}
