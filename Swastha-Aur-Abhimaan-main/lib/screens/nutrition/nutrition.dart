// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/screens/nutrition/components/nutritionTileModel.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  QuerySnapshot? nutritionSnapshot;
  @override
  void initState() {
    super.initState();
    getNutrition();
  }

  getNutrition() async {
    await DatabaseService()
        .uploadVideoCollection
        .where('label', isEqualTo: 'nutrition')
        .get()
        .then((value) {
      setState(() {
        nutritionSnapshot = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CustomAppBar(
          barColor: const Color.fromARGB(255, 141, 155, 184),
          tiColor: Colors.black,
          title: 'Nutrition',
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(size.width * 0.02),
          child: nutritionSnapshot == null
              ? Center(
                  child: Image.asset('Assets/images/noNutrition.png'),
                )
              : ListView.builder(
                  itemBuilder: ((context, index) {
                    return NutritionTileModel(
                      title: nutritionSnapshot!.docs[index]['title'],
                      description: nutritionSnapshot!.docs[index]
                          ['description'],
                      videoUrl: nutritionSnapshot!.docs[index]['videoUrl'],
                    );
                  }),
                  itemCount: nutritionSnapshot!.docs.length)),
    );
  }
}
