import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/doctorTileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/screens/medical/bmi/bmiPage.dart';
import 'package:swastha_aur_swabhimaan/screens/medical/sugarLevel/sugarLevel.dart';
import 'package:swastha_aur_swabhimaan/screens/medical/components/doctorListPage.dart';
import 'package:swastha_aur_swabhimaan/screens/medical/bloodPressure/bloodPressure.dart';

// ignore: must_be_immutable
class MedicalPage extends StatefulWidget {
  String? village;
  MedicalPage({Key? key, this.village}) : super(key: key);

  @override
  State<MedicalPage> createState() => _MedicalPageState();
}

class _MedicalPageState extends State<MedicalPage> {
  QuerySnapshot? doctors;

  @override
  void initState() {
    super.initState();
    getDoctorDetails();
    // print(doctors!.docs.length);
  }

  getDoctorDetails() async {
    await DatabaseService().getDocData().then((value) {
      setState(() {
        doctors = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: size.width * 0.05,
          ),
        ),
        title: Text(
          'Medical Page',
          style: TextStyle(
            fontSize: size.width * 0.06,
            color: Colors.black,
            fontFamily: 'Lexend',
          ),
        ),
        // centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 141, 155, 184),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: size.width * 0.1,
              left: size.width * 0.03,
              right: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      nextScreen(context, const SugarLevel());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              0.0,
                              4.0,
                            ),
                            blurRadius: 8.0,
                            // spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.asset(
                          'Assets/images/sugar.png',
                          width: size.width * 0.45,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreen(context, const BmiPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              0.0,
                              4.0,
                            ),
                            blurRadius: 8.0,
                            // spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.asset(
                          'Assets/images/bmi.png',
                          width: size.width * 0.45,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  nextScreen(context, const BloodPressure());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          0.0,
                          4.0,
                        ),
                        blurRadius: 8.0,
                        // spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Image.asset(
                      'Assets/images/bp.png',
                      // width: size.width * 0.45,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 141, 155, 184)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fill the form',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Lexend',
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 141, 155, 184),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Form',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Lexend'),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Our Doctors',
                    style: TextStyle(
                      fontSize: size.width * 0.055,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      doctors!.docs.isEmpty
                          ? Fluttertoast.showToast(
                              msg: 'No Doctors Available',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor:
                                  const Color.fromARGB(255, 141, 155, 184),
                              textColor: Colors.white,
                              fontSize: size.width * 0.04,
                            )
                          : nextScreen(context, const DoctorListPage());
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontFamily: 'Lexend',
                        color: const Color.fromARGB(255, 141, 155, 184),
                      ),
                    ),
                  ),
                ],
              ),
              doctors!.docs.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Divider(
                            indent: size.width * 0.4,
                            endIndent: size.width * 0.4,
                            color: Colors.black,
                            thickness: 1.5,
                          ),
                          Image.asset('Assets/Logo/soonDocs.png'),
                          Divider(
                            indent: size.width * 0.35,
                            endIndent: size.width * 0.35,
                            color: Colors.black,
                            thickness: 1.5,
                          ),
                        ],
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ignore: sized_box_for_whitespace
                        Container(
                            width: size.width * 0.9,
                            height: size.height * 0.3,
                            child: GridView.builder(
                                itemCount: doctors!.docs.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: ((context, index) {
                                  return DoctorTileModel(
                                      id: doctors!.docs[index]['doctorId'],
                                      name: doctors!.docs[index]['name'],
                                      role: doctors!.docs[index]['doctor'],
                                      gender: doctors!.docs[index]['gender']);
                                }))),
                      ],
                    ),
              SizedBox(
                height: size.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
