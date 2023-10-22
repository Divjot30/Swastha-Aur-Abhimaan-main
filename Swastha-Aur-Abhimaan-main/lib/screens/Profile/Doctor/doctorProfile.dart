import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/Doctor/components/docProfileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class DoctorProfile extends StatefulWidget {
  final String userId;
  const DoctorProfile({Key? key, required this.userId}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  String name = '';
  String email = '';
  String type = '';
  String gender = '';
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getDoctorDetails();
  }

  getDoctorDetails() async {
    await DatabaseService().gettingDoctorData(widget.userId).then((value) {
      setState(() {
        name = value.docs[0].data()['name'];
        type = value.docs[0].data()['doctor'];
        email = value.docs[0].data()['email'];
        gender = value.docs[0].data()['gender'];
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
          : DocProfileModel(
              name: name,
              email: email,
              role: type,
              gender: gender,
            ),
    );
  }
}
