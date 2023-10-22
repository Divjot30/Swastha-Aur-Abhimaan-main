import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/user/pages/medicalDetails.dart';

class FamilyDetails extends StatefulWidget {
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
  const FamilyDetails(
      {Key? key,
      required this.isAdminRegistering,
      required this.aadharNo,
      required this.block,
      required this.category,
      required this.dob,
      required this.education,
      required this.employement,
      required this.f_hName,
      required this.income,
      required this.maritalStatus,
      required this.religion,
      required this.role,
      required this.email})
      : super(key: key);

  @override
  State<FamilyDetails> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  TextEditingController dateController = TextEditingController();
  String familySize = "";
  int children = 10;
  String modeOfEducation = "";

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
                    'Q1.\t\tFamily Size',
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
                  TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Family Size",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          familySize = value;
                        });
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Q2.\t\tNumber of Children',
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
                  TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Number of Children",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          children = int.parse(value);
                        });
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Q3\t\tMode of Education in COVID-19',
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
                        RadioListTile(
                          title: const Text("Online"),
                          value: "Online",
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          toggleable: true,
                          groupValue: modeOfEducation,
                          onChanged: (value) {
                            setState(() {
                              modeOfEducation = value.toString();
                            });
                          },
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 0.7,
                          height: 0,
                          endIndent: size.width * 0.05,
                          indent: size.width * 0.05,
                        ),
                        RadioListTile(
                          title: const Text("Offline"),
                          value: "Offline",
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          toggleable: true,
                          groupValue: modeOfEducation,
                          onChanged: (value) {
                            setState(() {
                              modeOfEducation = value.toString();
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
                                MedicalDetails(
                                  isAdminRegistering: widget.isAdminRegistering,
                                  block: widget.block,
                                  familySize: familySize,
                                  children: children,
                                  modeOfEducation: modeOfEducation,
                                  aadharNo: widget.aadharNo,
                                  category: widget.category,
                                  dob: widget.dob,
                                  education: widget.education,
                                  employement: widget.employement,
                                  f_hName: widget.f_hName,
                                  income: widget.income,
                                  maritalStatus: widget.maritalStatus,
                                  religion: widget.religion,
                                  role: widget.role,
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
                      ),
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
