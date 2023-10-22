import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/skillDevelopment/components/skillTileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class SkillFromEvents extends StatefulWidget {
  const SkillFromEvents({super.key});

  @override
  State<SkillFromEvents> createState() => _SkillFromEventsState();
}

class _SkillFromEventsState extends State<SkillFromEvents> {
  QuerySnapshot? skillSnapshot;
  @override
  void initState() {
    super.initState();
    getSkillDevelopment();
  }

  getSkillDevelopment() async {
    await DatabaseService()
        .eventCollection
        .where('tag', isEqualTo: 'Skill')
        .get()
        .then((value) {
      setState(() {
        skillSnapshot = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.07),
          child: const CustomAppBar(
            barColor: Colors.white,
            tiColor: Colors.black,
            title: 'Skill Videos from Events',
          )),
      body: Container(
          padding: EdgeInsets.all(size.width * 0.02),
          child: skillSnapshot == null
              ? Center(
                  child: Image.asset('Assets/images/noSkill.png'),
                )
              : ListView.builder(
                  itemBuilder: ((context, index) {
                    return SkillTileModel(
                      title: skillSnapshot!.docs[index]['eventName'],
                      description: skillSnapshot!.docs[index]['eventDesc'],
                      videoUrl: skillSnapshot!.docs[index]['videoUrl'],
                      date: skillSnapshot!.docs[index]['eventStartDate'],
                      village: skillSnapshot!.docs[index]['village'],
                      day: skillSnapshot!.docs[index]['day'],
                    );
                  }),
                  itemCount: skillSnapshot!.docs.length)),
    );
  }
}
