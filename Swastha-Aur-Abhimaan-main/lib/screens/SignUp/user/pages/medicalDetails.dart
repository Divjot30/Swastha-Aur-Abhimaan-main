import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/user/pages/covidDetails.dart';

class MedicalDetails extends StatefulWidget {
  final String familySize, modeOfEducation;
  final int children;
  final String f_hName,
      block,
      role,
      dob,
      aadharNo,
      religion,
      category,
      maritalStatus,
      education,
      employement,
      income,
      email;

  final bool isAdminRegistering;
  const MedicalDetails({
    Key? key,
    required this.isAdminRegistering,
    required this.children,
    required this.familySize,
    required this.modeOfEducation,
    required this.aadharNo,
    required this.category,
    required this.dob,
    required this.education,
    required this.employement,
    required this.f_hName,
    required this.income,
    required this.maritalStatus,
    required this.religion,
    required this.role,
    required this.block,
    required this.email,
  }) : super(key: key);

  @override
  State<MedicalDetails> createState() => _MedicalDetailsState();
}

class _MedicalDetailsState extends State<MedicalDetails> {
  TextEditingController dateController = TextEditingController();
  List medicalHistory = [];
  bool hbp = false;
  bool diabetes = false;
  bool heartCon = false;
  bool hcol = false;
  bool dep = false;
  bool sleepPill = false;
  bool anxiety = false;
  bool thyroid = false;
  bool memEnh = false;
  bool park = false;
  bool jpain = false;
  bool eye = false;
  bool aspirin = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.1,
                    // fontWeight: FontWeight.w600,
                    fontFamily: "Lexend"),
              ),
              SizedBox(
                height: size.height * 0.02,
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                  endIndent: size.width * 0.25,
                  indent: size.width * 0.25,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Q1.\t\tMedicines for Ailments',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lexend",
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: Text(
                            'High Blood Pressure',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: hbp,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              hbp = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Diabetes',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: diabetes,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              diabetes = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Heart Conditions',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: heartCon,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              heartCon = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'High Colestrol',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: hcol,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              hcol = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Depression',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: dep,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              dep = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Sleeping pills',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: sleepPill,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              sleepPill = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Anxiety',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: anxiety,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              anxiety = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Thyroid Disorders',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: thyroid,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              thyroid = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Memory Enhancement',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: memEnh,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              memEnh = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Parkinsonism',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: park,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              park = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Joint Pain',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: jpain,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              jpain = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Eye Disorders',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: eye,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              eye = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'Aspirin to prevent Heart Attack',
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Lexend",
                              color: Colors.black,
                            ),
                          ),
                          value: aspirin,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          onChanged: (value) {
                            setState(() {
                              aspirin = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            nextScreen(
                                context,
                                CovidDetails(
                                  isAdminRegistering: widget.isAdminRegistering,
                                  anxiety: anxiety,
                                  aspirin: aspirin,
                                  block: widget.block,
                                  dep: dep,
                                  diabetes: diabetes,
                                  eye: eye,
                                  hbp: hbp,
                                  hcol: hcol,
                                  heartCon: heartCon,
                                  jpain: jpain,
                                  memEnh: memEnh,
                                  park: park,
                                  sleepPill: sleepPill,
                                  thyroid: thyroid,
                                  familySize: widget.familySize,
                                  children: widget.children,
                                  modeOfEducation: widget.modeOfEducation,
                                  f_hName: widget.f_hName,
                                  religion: widget.religion,
                                  role: widget.role,
                                  dob: widget.dob,
                                  aadharNo: widget.aadharNo,
                                  category: widget.category,
                                  maritalStatus: widget.maritalStatus,
                                  education: widget.education,
                                  employement: widget.employement,
                                  income: widget.income,
                                  email: widget.email,
                                ));
                            // userRegister();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05,
                                fontFamily: "Lexend"),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
