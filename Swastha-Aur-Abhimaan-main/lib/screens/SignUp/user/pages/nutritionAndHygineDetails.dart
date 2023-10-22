import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Login/common/login.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/adminHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/userHome.dart';
import 'package:swastha_aur_swabhimaan/services/authServices.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class NutritionAndHygineDetails extends StatefulWidget {
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
      aspirin,
      isAdminRegistering;
  final String covidPve,
      wave,
      test,
      treatment,
      vaccinated,
      dose,
      vaccine,
      whyNotVaccinated,
      pharmacies,
      pharmacyBlock,
      closeInfected,
      closeDied,
      sleepProblem;
  final String familySize, modeOfEducation;
  final int children;
  final String f_hName,
      role,
      block,
      dob,
      aadharNo,
      religion,
      category,
      maritalStatus,
      education,
      employement,
      income,
      email;
  const NutritionAndHygineDetails(
      {Key? key,
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
      required this.covidPve,
      required this.wave,
      required this.test,
      required this.treatment,
      required this.vaccinated,
      required this.dose,
      required this.vaccine,
      required this.whyNotVaccinated,
      required this.pharmacies,
      required this.pharmacyBlock,
      required this.closeInfected,
      required this.closeDied,
      required this.sleepProblem,
      required this.familySize,
      required this.children,
      required this.modeOfEducation,
      required this.f_hName,
      required this.role,
      required this.dob,
      required this.aadharNo,
      required this.religion,
      required this.category,
      required this.maritalStatus,
      required this.education,
      required this.employement,
      required this.income,
      required this.email})
      : super(key: key);

  @override
  State<NutritionAndHygineDetails> createState() =>
      _NutritionAndHygineDetailsState();
}

class _NutritionAndHygineDetailsState extends State<NutritionAndHygineDetails> {
  String diet = "";
  String milletsUsed = "";
  String millets = "";
  String milkConsumption = "";
  String dietType = "";
  //Hygine variables
  String waterSource = "";
  String waterTreatment = "";
  String waterQuality = "";
  String waterCause = "";
  String handSanitizer = "";
  String handSanitizerFreq = "";
  String handWashAlt = "";
  String localClean = "";
  String formFiller = "";
  String name = '';
  String gender = '';
  String village = '';
  final AuthServices _auth = AuthServices();
  List data = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: widget.email)
        .get()
        .then((value) {
      data = value.docs;
    });
  }

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
                  'Q1.\t\tDiet and Nutritional supplements taken.(if any)',
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
                    hintText: "Enter Suppliments",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      diet = value;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Q2.\t\tIntake of Traditional millets (like ragi, bajra, bangjeera, jowar) in your diet?',
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
                        groupValue: milletsUsed,
                        onChanged: (value) {
                          setState(() {
                            milletsUsed = value.toString();
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
                        groupValue: milletsUsed,
                        onChanged: (value) {
                          setState(() {
                            milletsUsed = value.toString();
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
                  visible: milletsUsed == "Yes",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'A.\t\tMillets Used',
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
                          hintText: "Enter Millets",
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            millets = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Q3.\t\tMilk consumption per day (in Litres)',
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
                    hintText: "Enter Milk Consumption",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      milkConsumption = value;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Q4.\t\tAre you vegetarian or non-vegetarian?',
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
                        title: const Text("Vegetarian"),
                        value: "Vegetarian",
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        toggleable: true,
                        groupValue: dietType,
                        onChanged: (value) {
                          setState(() {
                            dietType = value.toString();
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
                        title: const Text("Non-Vegetarian"),
                        value: "Non-Vegetarian",
                        toggleable: true,
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        groupValue: dietType,
                        onChanged: (value) {
                          setState(() {
                            dietType = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'Hygine',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w500,
                    fontFamily: "LexendLight",
                    color: Colors.black,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.8,
                  endIndent: size.width * 0.7,
                  // indent: size.width * 0.2,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Q1.\t\tPrimary Source of Water in your household',
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
                    hintText: "Enter Primary Source of Water",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      waterSource = value;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Q2.\t\tWater Treatment before drinking',
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
                        title: const Text("Use of Filter"),
                        value: "filter",
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        toggleable: true,
                        groupValue: waterTreatment,
                        onChanged: (value) {
                          setState(() {
                            waterTreatment = value.toString();
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
                        title: const Text("Use of RO/Aquaguard"),
                        value: "aquaguard",
                        toggleable: true,
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        groupValue: waterTreatment,
                        onChanged: (value) {
                          setState(() {
                            waterTreatment = value.toString();
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
                        title: const Text("Boiled and Filtered"),
                        value: "boiledFiltered",
                        toggleable: true,
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        groupValue: waterTreatment,
                        onChanged: (value) {
                          setState(() {
                            waterTreatment = value.toString();
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
                        title: const Text("Boiled only"),
                        value: "boiled",
                        toggleable: true,
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        groupValue: waterTreatment,
                        onChanged: (value) {
                          setState(() {
                            waterTreatment = value.toString();
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
                        title: const Text("Direct Tap Water"),
                        value: "tap",
                        toggleable: true,
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        groupValue: waterTreatment,
                        onChanged: (value) {
                          setState(() {
                            waterTreatment = value.toString();
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
                  'Q3.\t\tAre you satisfied with the quality of drinking water?',
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
                        value: "yes",
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        toggleable: true,
                        groupValue: waterQuality,
                        onChanged: (value) {
                          setState(() {
                            waterQuality = value.toString();
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
                        value: "no",
                        toggleable: true,
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        groupValue: waterQuality,
                        onChanged: (value) {
                          setState(() {
                            waterQuality = value.toString();
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
                  'Q4.\t\tDo you think drinking water is a cause for poor health? ',
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
                        value: "yes",
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        toggleable: true,
                        groupValue: waterCause,
                        onChanged: (value) {
                          setState(() {
                            waterCause = value.toString();
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
                        value: "no",
                        toggleable: true,
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        groupValue: waterCause,
                        onChanged: (value) {
                          setState(() {
                            waterCause = value.toString();
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
                  'Q5.\t\tDo you use hand Sanitizer?',
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
                        groupValue: handSanitizer,
                        onChanged: (value) {
                          setState(() {
                            handSanitizer = value.toString();
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
                        groupValue: handSanitizer,
                        onChanged: (value) {
                          setState(() {
                            handSanitizer = value.toString();
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
                  visible: handSanitizer == "Yes",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'A.\t\tNumber of time per day',
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
                          hintText: "Enter times used",
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            handSanitizerFreq = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: handSanitizer == "No",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'A.\t\tAlternative to wash hands',
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
                          hintText: "Enter alternative to wash hands",
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            handWashAlt = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Q6.\t\tHow do you feel that the cleanliness in your local environment ?  ',
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
                        title: const Text("Very Good"),
                        value: "Very Good",
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        toggleable: true,
                        groupValue: localClean,
                        onChanged: (value) {
                          setState(() {
                            localClean = value.toString();
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
                        title: const Text("Good"),
                        value: "Good",
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        toggleable: true,
                        groupValue: localClean,
                        onChanged: (value) {
                          setState(() {
                            localClean = value.toString();
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
                        title: const Text("Average"),
                        value: "Average",
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        toggleable: true,
                        groupValue: localClean,
                        onChanged: (value) {
                          setState(() {
                            localClean = value.toString();
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
                        title: const Text("Bad"),
                        value: "Bad",
                        toggleable: true,
                        activeColor: const Color.fromARGB(255, 180, 144, 45),
                        groupValue: localClean,
                        onChanged: (value) {
                          setState(() {
                            localClean = value.toString();
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
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      saveData();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      "Finish",
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
      ),
    ));
  }

  saveData() {
    DatabaseService()
        .savingQuizData(
      widget.block,
      data[0]['name'],
      data[0]['userId'],
      data[0]['village'],
      widget.f_hName,
      data[0]['gender'],
      widget.role,
      widget.dob,
      widget.aadharNo,
      widget.religion,
      widget.category,
      widget.maritalStatus,
      widget.education,
      widget.employement,
      widget.income,
      widget.familySize,
      widget.children,
      widget.modeOfEducation,
      widget.covidPve,
      widget.wave,
      widget.test,
      widget.treatment,
      widget.vaccinated,
      widget.dose,
      widget.vaccine,
      widget.whyNotVaccinated,
      widget.pharmacies,
      widget.pharmacyBlock,
      widget.closeInfected,
      widget.closeDied,
      widget.sleepProblem,
      diet,
      millets,
      milletsUsed,
      milkConsumption,
      dietType,
      waterSource,
      waterTreatment,
      waterQuality,
      waterCause,
      handSanitizer,
      handSanitizerFreq,
      handWashAlt,
      localClean,
      formFiller,
      widget.hbp,
      widget.diabetes,
      widget.heartCon,
      widget.hcol,
      widget.dep,
      widget.sleepPill,
      widget.anxiety,
      widget.thyroid,
      widget.memEnh,
      widget.park,
      widget.jpain,
      widget.eye,
      widget.aspirin,
    )
        .then((value) {
      Fluttertoast.showToast(
          msg: "Details stored Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      widget.isAdminRegistering
          ? nextScreenReplace(context, const AdminHome())
          : nextScreenReplace(context, const UserHome());
    });
  }
}
