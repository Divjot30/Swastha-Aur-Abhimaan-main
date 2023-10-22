import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/Admin/profile.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/addMembers/addMembers.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/components/adminOptions.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/drawer.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  String name = '';
  String gender = '';
  String email = '';
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    getAdminDetails();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      getAdminDetails();
    });
  }

  getAdminDetails() async {
    await HelperFunctions.getUserEmailFromSF().then((value) => email = value!);
    await DatabaseService().gettingAdminData(email).then((value) {
      setState(() {
        name = value.docs[0].data()['name'];
        gender = value.docs[0].data()['gender'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(
                    context,
                    AddMembers(
                      admin: true,
                      user: false,
                      trainer: false,
                      doctor: false,
                      teacher: false,
                    ));
              },
              icon: Icon(
                Icons.person_add_alt_1,
                size: size.width * 0.06,
              )),
        ],
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: MenuDrawer(
        isDoctor: false,
        isTrainer: false,
        isTeacher: false,
        who: 'Admin',
        name: name,
        gender: gender,
        email: email,
        isUser: false,
        child: const AdminProfile(),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: size.height,
          color: Colors.white,
          child: Column(
            children: [
              AdminOptions(
                name: name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
