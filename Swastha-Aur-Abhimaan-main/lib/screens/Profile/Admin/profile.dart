import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/Admin/components/adminProfileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  String name = '';
  String email = '';
  String gender = '';

  @override
  void initState() {
    super.initState();
    getAdminDetails();
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
    return Scaffold(
      body: AdminProfileModel(
        name: name,
        email: email,
        gender: gender,
      ),
    );
  }
}
