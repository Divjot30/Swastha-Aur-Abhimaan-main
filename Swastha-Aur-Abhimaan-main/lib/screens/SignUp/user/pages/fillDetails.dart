import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/user/pages/familyDetails.dart';

class FillDetails extends StatefulWidget {
  final String email;
  final bool isAdminRegistering;
  const FillDetails(
      {Key? key, required this.email, required this.isAdminRegistering})
      : super(key: key);

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  TextEditingController dateController = TextEditingController();
  String block = '';
  String f_hName = "";
  String role = "";
  String? dob;
  String aadharNo = "";
  String religion = "";
  String category = "";
  String maritalStatus = "";
  String education = "";
  String employement = "";
  String income = "";

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
                        DropdownMenuItem(
                            value: "Charba", child: Text("Charba")),
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
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
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
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      errorBorder: const UnderlineInputBorder(
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
                          dob = dateController.text;
                        });
                      } else {
                        Fluttertoast.showToast(
                          msg: "Date is not selected",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
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
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
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
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
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
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            nextScreen(
                                context,
                                FamilyDetails(
                                  isAdminRegistering: widget.isAdminRegistering,
                                  aadharNo: aadharNo,
                                  block: block,
                                  category: category,
                                  dob: dob!,
                                  education: education,
                                  employement: employement,
                                  f_hName: f_hName,
                                  income: income,
                                  maritalStatus: maritalStatus,
                                  religion: religion,
                                  role: role,
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
