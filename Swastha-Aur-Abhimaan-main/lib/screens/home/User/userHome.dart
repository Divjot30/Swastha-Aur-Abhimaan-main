import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/User/userProfile.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/components/userOptions.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/drawer.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String name = '';
  String email = '';
  String phone = '';
  String gender = '';
  String village = '';
  @override
  void initState() {
    //
    super.initState();
    getUserDetails();
  }

  getUserDetails() async {
    await HelperFunctions.getUserEmailFromSF().then((value) => email = value!);
    await DatabaseService().gettingUserData(email).then((value) {
      setState(() {
        name = value.docs[0].data()['name'];
        village = value.docs[0].data()['village'];
        gender = value.docs[0].data()['gender'];
      });
    });
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
        isDoctor: false,
        isTeacher: false,
        isTrainer: false,
        who: 'User',
        gender: gender,
        name: name,
        email: email,
        isUser: true,
        child: const UserProfile(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              UserOptions(
                name: name,
                village: village,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
