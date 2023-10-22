import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/Trainer/components/trainerProfileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class TrainerProfile extends StatefulWidget {
  const TrainerProfile({Key? key}) : super(key: key);

  @override
  State<TrainerProfile> createState() => _TrainerProfileState();
}

class _TrainerProfileState extends State<TrainerProfile> {
  String name = '';
  String email = '';
  String gender = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTrainerDetails();
  }

  getTrainerDetails() async {
    await HelperFunctions.getUserEmailFromSF().then((value) => email = value!);
    await DatabaseService().gettingTrainerDetails(email).then((value) {
      setState(() {
        name = value.docs[0].data()['name'];
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
          : TrainerProfileModel(
              name: name,
              email: email,
              gender: gender,
            ),
    );
  }
}
