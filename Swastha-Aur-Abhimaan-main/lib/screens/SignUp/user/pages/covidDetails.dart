import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/user/pages/nutritionAndHygineDetails.dart';

class CovidDetails extends StatefulWidget {
  final bool hbp,
      diabetes,
      heartCon,
      hcol,
      dep,
      sleepPill,
      anxiety,
      thyroid,
      memEnh,
      park,
      jpain,
      eye,
      aspirin;
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
  const CovidDetails({
    Key? key,
    required this.isAdminRegistering,
    required this.anxiety,
    required this.aspirin,
    required this.block,
    required this.dep,
    required this.diabetes,
    required this.eye,
    required this.hbp,
    required this.hcol,
    required this.heartCon,
    required this.jpain,
    required this.memEnh,
    required this.park,
    required this.sleepPill,
    required this.thyroid,
    required this.familySize,
    required this.children,
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
    required this.email,
  }) : super(key: key);

  @override
  State<CovidDetails> createState() => _CovidDetailsState();
}

class _CovidDetailsState extends State<CovidDetails> {
  String covidPve = "";
  String wave = "";
  String test = "";
  String treatment = "";
  String vaccinated = "";
  String dose = "";
  String vaccine = "";
  String whyNotVaccinated = "";
  String pharmacies = "";
  String pharmacyBlock = "";
  String closeInfected = "";
  String closeDied = "";
  String sleepProblem = "";

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
                    'Q1.\t\tEver Tested Positive for COVID-19?',
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
                          title: const Text("Yes"),
                          value: "Yes",
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          toggleable: true,
                          groupValue: covidPve,
                          onChanged: (value) {
                            setState(() {
                              covidPve = value.toString();
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
                          title: const Text("No"),
                          value: "No",
                          toggleable: true,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          groupValue: covidPve,
                          onChanged: (value) {
                            setState(() {
                              covidPve = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Visibility(
                    visible: covidPve == "Yes",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'A.\t\tWhich wave of COVID-19?',
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
                                title: const Text("1st Wave"),
                                value: "1st Wave",
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                toggleable: true,
                                groupValue: wave,
                                onChanged: (value) {
                                  setState(() {
                                    wave = value.toString();
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
                                title: const Text("2nd Wave"),
                                value: "2nd Wave",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: wave,
                                onChanged: (value) {
                                  setState(() {
                                    wave = value.toString();
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
                                title: const Text("3rd Wave"),
                                value: "3rd Wave",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: wave,
                                onChanged: (value) {
                                  setState(() {
                                    wave = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'B.\t\tWhich test for COVID-19?',
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
                                title: const Text("RTPCR"),
                                value: "RTPCR",
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                toggleable: true,
                                groupValue: test,
                                onChanged: (value) {
                                  setState(() {
                                    test = value.toString();
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
                                title: const Text("RAT"),
                                value: "RAT",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: test,
                                onChanged: (value) {
                                  setState(() {
                                    test = value.toString();
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
                                title: const Text("Not Sure"),
                                value: "Not Sure",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: test,
                                onChanged: (value) {
                                  setState(() {
                                    test = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'C.\t\tTreatment Method for COVID-19?',
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
                                title: const Text("Ayurvedic"),
                                value: "Ayurvedic",
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                toggleable: true,
                                groupValue: treatment,
                                onChanged: (value) {
                                  setState(() {
                                    treatment = value.toString();
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
                                title: const Text("Allopathic"),
                                value: "Allopathic",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: treatment,
                                onChanged: (value) {
                                  setState(() {
                                    treatment = value.toString();
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
                                title: const Text("Homeopathic"),
                                value: "Homeopathic",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: treatment,
                                onChanged: (value) {
                                  setState(() {
                                    treatment = value.toString();
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
                                title: const Text("Home Remedies"),
                                value: "Home Remedies",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: treatment,
                                onChanged: (value) {
                                  setState(() {
                                    treatment = value.toString();
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
                                title: const Text("Hospital/COVID center"),
                                value: "Hospital/COVID center",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: treatment,
                                onChanged: (value) {
                                  setState(() {
                                    treatment = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Q2.\t\tVaccinated for COVID-19?',
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
                          title: const Text("Yes"),
                          value: "Yes",
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          toggleable: true,
                          groupValue: vaccinated,
                          onChanged: (value) {
                            setState(() {
                              vaccinated = value.toString();
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
                          title: const Text("No"),
                          value: "No",
                          toggleable: true,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          groupValue: vaccinated,
                          onChanged: (value) {
                            setState(() {
                              vaccinated = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Visibility(
                    visible: vaccinated == "Yes",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'A.\t\tNumber of Doses recieved',
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
                                title: const Text("One (1) dose"),
                                value: "one",
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                toggleable: true,
                                groupValue: dose,
                                onChanged: (value) {
                                  setState(() {
                                    dose = value.toString();
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
                                title: const Text("Two (2) doses"),
                                value: "two",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: dose,
                                onChanged: (value) {
                                  setState(() {
                                    dose = value.toString();
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
                                title: const Text("Booster Dose"),
                                value: "booster",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: dose,
                                onChanged: (value) {
                                  setState(() {
                                    dose = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'B.\t\tName of Vaccine for COVID-19?',
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
                                title: const Text("CoviShield"),
                                value: "CoviShield",
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                toggleable: true,
                                groupValue: vaccine,
                                onChanged: (value) {
                                  setState(() {
                                    vaccine = value.toString();
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
                                title: const Text("Covaxin"),
                                value: "Covaxin",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: vaccine,
                                onChanged: (value) {
                                  setState(() {
                                    vaccine = value.toString();
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
                                title: const Text("Sputnik V"),
                                value: "sputnikv",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: vaccine,
                                onChanged: (value) {
                                  setState(() {
                                    vaccine = value.toString();
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
                                title: const Text("Moderna"),
                                value: "Moderna",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: vaccine,
                                onChanged: (value) {
                                  setState(() {
                                    vaccine = value.toString();
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
                                title: const Text("Johnson & Johnson"),
                                value: "johnson",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: vaccine,
                                onChanged: (value) {
                                  setState(() {
                                    vaccine = value.toString();
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
                                title: const Text("Not Sure"),
                                value: "notsure",
                                toggleable: true,
                                activeColor:
                                    const Color.fromARGB(255, 180, 144, 45),
                                groupValue: vaccine,
                                onChanged: (value) {
                                  setState(() {
                                    vaccine = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: vaccinated == "No",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'A.\t\tWhy not vaccinated?',
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
                            hintText: "Enter Reason",
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              whyNotVaccinated = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Q3.\t\tPharmacies Available in your area?',
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
                          title: const Text("Yes"),
                          value: "Yes",
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          toggleable: true,
                          groupValue: pharmacies,
                          onChanged: (value) {
                            setState(() {
                              pharmacies = value.toString();
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
                          title: const Text("No"),
                          value: "No",
                          toggleable: true,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          groupValue: pharmacies,
                          onChanged: (value) {
                            setState(() {
                              pharmacies = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Visibility(
                    visible: pharmacies == "Yes",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'A.\t\tBlock Number/Name',
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
                            hintText: "Enter Block Number/Name",
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              pharmacyBlock = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Q4.\t\tHas someone close to you been infected with COVID-19?',
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
                          title: const Text("Yes"),
                          value: "Yes",
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          toggleable: true,
                          groupValue: closeInfected,
                          onChanged: (value) {
                            setState(() {
                              closeInfected = value.toString();
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
                          title: const Text("No"),
                          value: "No",
                          toggleable: true,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          groupValue: closeInfected,
                          onChanged: (value) {
                            setState(() {
                              closeInfected = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Q5.\t\tHas a person close to you died in the course of a COVID-19 ?',
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
                          title: const Text("Yes"),
                          value: "Yes",
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          toggleable: true,
                          groupValue: closeDied,
                          onChanged: (value) {
                            setState(() {
                              closeDied = value.toString();
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
                          title: const Text("No"),
                          value: "No",
                          toggleable: true,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          groupValue: closeDied,
                          onChanged: (value) {
                            setState(() {
                              closeDied = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Q6.\t\tDuring COVID-19 you have suffered from sleep problems?',
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
                          title: const Text(
                              "Difficulty falling asleep (< 30 minutes)"),
                          value: "less than 30 minutes",
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          toggleable: true,
                          groupValue: sleepProblem,
                          onChanged: (value) {
                            setState(() {
                              sleepProblem = value.toString();
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
                          title: const Text(
                              "difficulty sleeping through the night"),
                          value: "through the night",
                          toggleable: true,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          groupValue: sleepProblem,
                          onChanged: (value) {
                            setState(() {
                              sleepProblem = value.toString();
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
                          title:
                              const Text("Anxiety and worries about my health"),
                          value: "anxiety",
                          toggleable: true,
                          activeColor: const Color.fromARGB(255, 180, 144, 45),
                          groupValue: sleepProblem,
                          onChanged: (value) {
                            setState(() {
                              sleepProblem = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
                            NutritionAndHygineDetails(
                              isAdminRegistering: widget.isAdminRegistering,
                              anxiety: widget.anxiety,
                              aspirin: widget.aspirin,
                              block: widget.block,
                              dep: widget.dep,
                              diabetes: widget.diabetes,
                              eye: widget.eye,
                              hbp: widget.hbp,
                              hcol: widget.hcol,
                              heartCon: widget.heartCon,
                              jpain: widget.jpain,
                              memEnh: widget.memEnh,
                              park: widget.park,
                              sleepPill: widget.sleepPill,
                              thyroid: widget.thyroid,
                              covidPve: covidPve,
                              wave: wave,
                              test: test,
                              treatment: treatment,
                              vaccinated: vaccinated,
                              dose: dose,
                              vaccine: vaccine,
                              whyNotVaccinated: whyNotVaccinated,
                              pharmacies: pharmacies,
                              pharmacyBlock: pharmacyBlock,
                              closeInfected: closeInfected,
                              closeDied: closeDied,
                              sleepProblem: sleepProblem,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
