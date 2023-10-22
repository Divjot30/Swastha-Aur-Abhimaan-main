// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/viewProfile/viewProfUser.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({Key? key}) : super(key: key);

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  List doctors = [];
  @override
  void initState() {
    //
    super.initState();
    getDoctorDetails();
  }

  getDoctorDetails() async {
    var doc = await FirebaseFirestore.instance.collection('doctors').get();
    setState(() {
      doctors = doc.docs;
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
            )),
        backgroundColor: const Color.fromARGB(255, 141, 155, 184),
        title: Text(
          'Our Doctors',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lexend',
            fontSize: size.width * 0.05,
          ),
        ),
      ),
      body: doctors.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    indent: size.width * 0.35,
                    endIndent: size.width * 0.35,
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
          : Container(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: size.height * 0.01,
                      left: size.width * 0.03,
                      right: size.width * 0.03,
                    ),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      shadowColor: Colors.black,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: size.width * 0.06,
                          child: doctors[index]['gender'] == 'Male'
                              ? Image.asset('Assets/images/maleDoc.png')
                              : Image.asset('Assets/images/femaleDoc.png'),
                        ),
                        title: Text(
                          'Dr. ${capitalize(doctors[index]['name'])}',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lexend',
                            fontSize: size.width * 0.05,
                          ),
                        ),
                        subtitle: Text(
                          capitalize(doctors[index]['doctor']),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'LexendLight',
                            fontSize: size.width * 0.04,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            nextScreen(
                                context,
                                ViewProfileForUser(
                                    id: doctors[index]['doctorId'],
                                    collectionName: 'doctors',
                                    fieldName: 'doctorId'));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: size.width * 0.05,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  capitalize(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }
}
