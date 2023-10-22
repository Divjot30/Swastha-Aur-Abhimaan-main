
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/Doctor/doctorProfile.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Doctor/components/doctorOptions.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/drawer.dart';
import 'package:swastha_aur_swabhimaan/widgets/widgets.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  String name = "";
  String email = "";
  String gender = "";

  @override
  void initState() {
    super.initState();
    getDoctorInfo();
  }

  getDoctorInfo() async {
    try {
      await DatabaseService()
          .gettingDoctorData(FirebaseAuth.instance.currentUser!.uid)
          .then((value) {
        setState(() {
          name = value.docs[0].data()['name'];
          email = value.docs[0].data()['email'];
          gender = value.docs[0].data()['gender'];
        });
      });
    } catch (e) {
      showSnackBar(context, Colors.red, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: MenuDrawer(
        isDoctor: true,
        isTeacher: false,
        isTrainer: false,
        who: 'Doctor',
        gender: gender,
        name: name,
        email: email,
        isUser: false,
        child: DoctorProfile(
          userId: FirebaseAuth.instance.currentUser!.uid,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Options(
              myName: name,
            ),
          ],
        ),
      ),
    );
  }
}
