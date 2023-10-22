import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl/intl.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class TakeQuiz extends StatefulWidget {
  final String? village;
  final String id;
  const TakeQuiz({Key? key, this.village, required this.id}) : super(key: key);

  @override
  State<TakeQuiz> createState() => _TakeQuizState();
}

class _TakeQuizState extends State<TakeQuiz> {
  TextEditingController dateController = TextEditingController();
  // Personal Details variables
  String block = "";
  String name = "";
  String f_hName = "";
  String gender = "";
  String? phoneNo;
  String role = "";
  String? _dob;
  String aadharNo = "";
  String religion = "";
  String category = "";
  String maritalStatus = "";
  String education = "";
  String employement = "";
  String income = "";
  // Family Details variables
  String familySize = "";
  int children = 10;
  int nToU = 0;
  String modeOfEducation = "";
  // Medical History variables
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
  // covid variables
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
  // Nutritional assessment variables
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 180, 144, 45),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: size.width * 0.05,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Details',
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
                endIndent: size.width * 0.5,
                // indent: size.width * 0.2,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q1.\t\tName of Block',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lexend",
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              DropdownButtonFormField(
                  itemHeight: size.height * 0.06,
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lexend",
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Select Block",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: "Nawabgarh", child: Text("Nawabgarh")),
                    DropdownMenuItem(
                        value: "Dhakrani", child: Text("Dhakrani")),
                    DropdownMenuItem(
                        value: "Jamnipur", child: Text("Jamnipur")),
                    DropdownMenuItem(value: "Charba", child: Text("Charba")),
                    DropdownMenuItem(
                        value: "Chandrabani", child: Text("Chandrabani")),
                    DropdownMenuItem(
                        value: "Marzi Grant", child: Text("Marzi Grant")),
                    DropdownMenuItem(
                        value: "Shyampur", child: Text("Shyampur")),
                    DropdownMenuItem(
                        value: "Athhoorwala", child: Text("Athhoorwala")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      block = value.toString();
                    });
                  }),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q2.\t\tFull Name',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lexend",
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Full Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  }),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q3.\t\tName of Village',
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
                readOnly: true,
                decoration: InputDecoration(
                  hintText: widget.village,
                  hintStyle: TextStyle(
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lexend",
                    color: const Color.fromARGB(255, 180, 144, 45),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q4.\t\tFathers/Husbands Name',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lexend",
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Fathers/Husbands Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      f_hName = value;
                    });
                  }),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q5.\t\tGender',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lexend",
                  color: Colors.black.withOpacity(0.7),
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
                      title: const Text("Male"),
                      value: "male",
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      toggleable: true,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
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
                      title: const Text("Female"),
                      value: "female",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
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
                'Q6.\t\tPhone Number',
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
              IntlPhoneField(
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  hintStyle: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lexend",
                    color: Colors.black.withOpacity(0.7),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  setState(() {
                    phoneNo = phone.completeNumber;
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q7.\t\tRole',
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
                      title: const Text("Gram Pradhan"),
                      value: "Gram Pradhan",
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      toggleable: true,
                      groupValue: role,
                      onChanged: (value) {
                        setState(() {
                          role = value.toString();
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
                      title: const Text("Asha Workers"),
                      value: "Asha Workers",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: role,
                      onChanged: (value) {
                        setState(() {
                          role = value.toString();
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
                      title: const Text("SPOC"),
                      value: "SPOC",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: role,
                      onChanged: (value) {
                        setState(() {
                          role = value.toString();
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
                      title: const Text("Villagers"),
                      value: "Villagers",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: role,
                      onChanged: (value) {
                        setState(() {
                          role = value.toString();
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
                'Q8.\t\tDate of Birth',
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
              TextField(
                controller:
                    dateController, //editing controller of this TextField
                decoration: InputDecoration(
                  hintText: "Enter Date of Birth",
                  hintStyle: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lexend",
                    color: Colors.black.withOpacity(0.7),
                  ),
                  prefixIcon: const Icon(Icons.calendar_today),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                  ),
                ),
                readOnly: true, // when true user cannot edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);

                    setState(() {
                      dateController.text = formattedDate;
                      _dob = dateController.text;
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: "Date not selected",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: size.width * 0.045);
                  }
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q9.\t\tAadhar Number',
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
                keyboardType: TextInputType.number,
                maxLength: 12,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  hintText: "Enter Aadhar Number",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    aadharNo = value;
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q10.\t\tReligion',
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
                  hintText: "Religion",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    religion = value;
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Q11.\t\tCategory',
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
                      title: const Text("General"),
                      value: "General",
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      toggleable: true,
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
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
                      title: const Text("SC"),
                      value: "SC",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
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
                      title: const Text("ST"),
                      value: "ST",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
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
                      title: const Text("OBC"),
                      value: "OBC",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
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
                'Q12.\t\tMarital Status',
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
                      title: const Text("Married"),
                      value: "Married",
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      toggleable: true,
                      groupValue: maritalStatus,
                      onChanged: (value) {
                        setState(() {
                          maritalStatus = value.toString();
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
                      title: const Text("Unmarried"),
                      value: "Unmarried",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: maritalStatus,
                      onChanged: (value) {
                        setState(() {
                          maritalStatus = value.toString();
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
                      title: const Text("Widower"),
                      value: "Widower",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: maritalStatus,
                      onChanged: (value) {
                        setState(() {
                          maritalStatus = value.toString();
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
                      title: const Text("Divorced"),
                      value: "Divorced",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: maritalStatus,
                      onChanged: (value) {
                        setState(() {
                          maritalStatus = value.toString();
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
                'Q13.\t\tEducation',
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
                      title: const Text("High School"),
                      value: "High School",
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      toggleable: true,
                      groupValue: education,
                      onChanged: (value) {
                        setState(() {
                          education = value.toString();
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
                      title: const Text("Graduate"),
                      value: "Graduate",
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      toggleable: true,
                      groupValue: education,
                      onChanged: (value) {
                        setState(() {
                          education = value.toString();
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
                      title: const Text("Masters"),
                      value: "Masters",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: education,
                      onChanged: (value) {
                        setState(() {
                          education = value.toString();
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
                      title: const Text("Doctorate (PhD)"),
                      value: "Doctorate",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: education,
                      onChanged: (value) {
                        setState(() {
                          education = value.toString();
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
                      title: const Text("Illiterate"),
                      value: "Illiterate",
                      toggleable: true,
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      groupValue: education,
                      onChanged: (value) {
                        setState(() {
                          education = value.toString();
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
                'Q14.\t\tStatus of Employement',
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
                      title: const Text("Employed"),
                      value: "Employed",
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      toggleable: true,
                      groupValue: employement,
                      onChanged: (value) {
                        setState(() {
                          employement = value.toString();
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
                      title: const Text("Unemployed"),
                      value: "Unemployed",
                      activeColor: const Color.fromARGB(255, 180, 144, 45),
                      toggleable: true,
                      groupValue: employement,
                      onChanged: (value) {
                        setState(() {
                          employement = value.toString();
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
                'Q15.\t\tPer capita Income',
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
                    hintText: "Per capita Income",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      income = value;
                    });
                  }),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                'Family Details',
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
                endIndent: size.width * 0.5,
                // indent: size.width * 0.2,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
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
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
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
              // Text(
              //   'Q3.\t\tEducation of Children',
              //   style: TextStyle(
              //     fontSize: size.width * 0.05,
              //     fontWeight: FontWeight.w400,
              //     fontFamily: "Lexend",
              //     color: Colors.black,
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.01,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.black,
              //       width: 1,
              //     ),
              //     borderRadius: BorderRadius.circular(7),
              //   ),
              //   child: Column(
              //     children: [
              //       Text(
              //         'Nursery to UKG',
              //         style: TextStyle(
              //           fontSize: size.width * 0.04,
              //           fontWeight: FontWeight.w400,
              //           fontFamily: "Lexend",
              //           color: Colors.black,
              //         ),
              //       ),
              //       SizedBox(
              //         height: size.height * 0.01,
              //       ),
              //     ],
              //   ),
              // ),
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
              Text(
                'Medical History',
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
                endIndent: size.width * 0.5,
                // indent: size.width * 0.2,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
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
                height: size.height * 0.05,
              ),
              Text(
                'COVID-19 Details',
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
                endIndent: size.width * 0.5,
                // indent: size.width * 0.2,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
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
                      title:
                          const Text("difficulty sleeping through the night"),
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
                      title: const Text("Anxiety and worries about my health"),
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
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                'Nutritional Assessment',
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
                endIndent: size.width * 0.3,
                // indent: size.width * 0.2,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
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
              Text(
                'Q7.\t\tName of the person filled the form',
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
                  hintText: "Enter name of form filler",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    formFiller = value;
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  saveData();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 180, 144, 45),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lexend",
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  saveData() {
    DatabaseService()
        .savingQuizData(
      block,
      name,
      widget.id,
      widget.village!,
      f_hName,
      gender,
      role,
      _dob!,
      aadharNo,
      religion,
      category,
      maritalStatus,
      education,
      employement,
      income,
      familySize,
      children,
      modeOfEducation,
      covidPve,
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
      sleepProblem,
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
      hbp,
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
      Navigator.pop(context);
    });
  }
}
