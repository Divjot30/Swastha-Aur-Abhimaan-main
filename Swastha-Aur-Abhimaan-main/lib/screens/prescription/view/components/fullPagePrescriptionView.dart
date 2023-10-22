import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/uploads/visiting/images/components/fullScreenImageView.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class FullPagePrescriptionView extends StatefulWidget {
  final String name;
  final String id;
  const FullPagePrescriptionView(
      {Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<FullPagePrescriptionView> createState() =>
      _FullPagePrescriptionViewState();
}

class _FullPagePrescriptionViewState extends State<FullPagePrescriptionView> {
  List prescriptionList = [];
  @override
  void initState() {
    super.initState();
    getPrescriptions();
  }

  getPrescriptions() async {
    DatabaseService().gettingPrescription().then((value) {
      setState(() {
        prescriptionList = value.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CustomAppBar(
            barColor: const Color.fromARGB(255, 157, 135, 149),
            title: widget.name,
            tiColor: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Container(
          width: size.width,
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('Assets/Logo/upes.png', width: size.width * 0.35),
                  Image.asset('Assets/Logo/applogo.png',
                      width: size.width * 0.15),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                capitaliseString(widget.name),
                style: TextStyle(
                  fontSize: size.width * 0.065,
                  fontFamily: 'LexendLight',
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prescriptionList[0]['village'],
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontFamily: 'LexendLight',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    prescriptionList[0]['age'] + ' years old',
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontFamily: 'LexendLight',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    prescriptionList[0]['description'],
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontFamily: 'LexendLight',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  GestureDetector(
                    onTap: () {
                      nextScreen(
                          context,
                          FullScreenImageView(
                            imageLink: prescriptionList[0]['prescriptionUrl'],
                          ));
                    },
                    child: Container(
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.image,
                            size: size.width * 0.08,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            'Old Prescription',
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontFamily: 'LexendLight',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    prescriptionList[0]['date'],
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontFamily: 'LexendLight',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.2),
              const Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Community Covid Resilience Resource Center\nUPES, Dehradun\nDepartment of Science and Technology',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      fontFamily: 'LexendLight',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  timeStamptoStringDate(String date) {
    var md = date.indexOf(" ");
    return date.substring(0, md);
  }
}
