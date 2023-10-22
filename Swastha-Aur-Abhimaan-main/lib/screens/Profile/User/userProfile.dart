import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/User/components/userProfileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String name = '';
  String email = '';
  String phone = '';
  String village = '';
  String gender = '';
  bool isLoading = true;

  @override
  void initState() {
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
          : UserProfileModel(
              name: name,
              email: email,
              village: village,
              gender: gender,
            ),
    );
  }
}
