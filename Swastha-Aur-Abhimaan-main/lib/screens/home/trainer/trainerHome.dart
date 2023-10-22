import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/Trainer/trainerProfile.dart';
import 'package:swastha_aur_swabhimaan/screens/home/trainer/components/trainerOptions.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/drawer.dart';

class TrainerHome extends StatefulWidget {
  const TrainerHome({Key? key}) : super(key: key);

  @override
  State<TrainerHome> createState() => _TrainerHomeState();
}

class _TrainerHomeState extends State<TrainerHome> {
  @override
  void initState() {
    //
    super.initState();
    getTrainerDetails();
  }

  String name = '';
  String gender = '';
  String email = '';

  getTrainerDetails() async {
    await HelperFunctions.getUserEmailFromSF().then((value) => email = value!);
    await DatabaseService().gettingTrainerDetails(email).then((value) {
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
      drawerEnableOpenDragGesture: false,
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
        isTrainer: true,
        who: 'Trainer',
        name: name,
        gender: gender,
        email: email,
        isUser: false,
        child: const TrainerProfile(),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          color: Colors.white,
          child: Column(
            children: [
              TrainerOptions(name: name),
            ],
          ),
        ),
      ),
    );
  }
}
