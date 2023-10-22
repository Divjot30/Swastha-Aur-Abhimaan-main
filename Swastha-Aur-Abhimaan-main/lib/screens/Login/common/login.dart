// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/AdminUser/adminUserSignUp.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/addMembers/addMembers.dart';
import 'package:swastha_aur_swabhimaan/screens/SignUp/user/userSignUp.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/adminHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Doctor/doctorHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/userHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/teacher/teacherHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/trainer/trainerHome.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';
import 'package:swastha_aur_swabhimaan/services/authServices.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthServices _auth = AuthServices();
  final formKey = GlobalKey<FormState>();
  bool user = true;
  bool admin = false;
  bool doctor = false;
  bool trainer = false;
  bool teacher = false;
  bool isLoading = false;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('Assets/images/c.png'),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.13,
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
            Text(
              "Select your role",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.05,
                  // fontWeight: FontWeight.w600,
                  fontFamily: "Lexend"),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        user = !user;
                        admin = false;
                        doctor = false;
                        trainer = false;
                        teacher = false;
                      });
                    },
                    child: OptionBarModel(
                      borderColor: const Color.fromRGBO(33, 150, 243, 1),
                      fillColor: const Color.fromARGB(255, 191, 230, 240),
                      click: user,
                      label: 'User',
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        user = false;
                        admin = !admin;
                        doctor = false;
                        trainer = false;
                        teacher = false;
                      });
                    },
                    child: OptionBarModel(
                      borderColor: const Color.fromRGBO(33, 150, 243, 1),
                      fillColor: const Color.fromARGB(255, 191, 230, 240),
                      click: admin,
                      label: 'Admin',
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        user = false;
                        admin = false;
                        doctor = !doctor;
                        trainer = false;
                        teacher = false;
                      });
                    },
                    child: OptionBarModel(
                      borderColor: const Color.fromRGBO(33, 150, 243, 1),
                      fillColor: const Color.fromARGB(255, 191, 230, 240),
                      click: doctor,
                      label: 'Doctor',
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        user = false;
                        admin = false;
                        doctor = false;
                        trainer = !trainer;
                        teacher = false;
                      });
                    },
                    child: OptionBarModel(
                      borderColor: const Color.fromRGBO(33, 150, 243, 1),
                      fillColor: const Color.fromARGB(255, 191, 230, 240),
                      click: trainer,
                      label: 'Trainer',
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        user = false;
                        admin = false;
                        doctor = false;
                        trainer = false;
                        teacher = !teacher;
                      });
                    },
                    child: OptionBarModel(
                      borderColor: const Color.fromRGBO(33, 150, 243, 1),
                      fillColor: const Color.fromARGB(255, 191, 230, 240),
                      click: teacher,
                      label: 'Teacher',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.1, right: size.width * 0.1),
                child: Column(
                  children: [
                    email(),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    password(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.1, right: size.width * 0.1),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        user
                            ? userLogin()
                            : admin
                                ? adminLogin()
                                : doctor
                                    ? doctorLogin()
                                    : trainer
                                        ? trainerLogin()
                                        : teacher
                                            ? teacherLogin()
                                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.05,
                            fontFamily: "Lexend"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            user ? noAccount() : Container(),
          ],
        ),
      ),
    );
  }

  TextFormField email() {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: "Kollektif",
      ),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintText: 'Email',
        hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Kollektif",
            fontSize: size.width * 0.05),
      ),
      onChanged: (val) {
        setState(() {
          _email = val;
        });
      },
      validator: (val) {
        return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!)
            ? null
            : "Please provide a valid email";
      },
    );
  }

  TextFormField password() {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      obscureText: true,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: "Kollektif",
      ),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintText: 'Password',
        hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Kollektif",
            fontSize: size.width * 0.05),
      ),
      onChanged: (val) {
        setState(() {
          _password = val;
        });
      },
      validator: (val) {
        return val!.length > 6
            ? null
            : "Please provide a password with 6+ characters";
      },
    );
  }

  noAccount() {
    return Text.rich(
      TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          children: <TextSpan>[
            TextSpan(
                text: "Register Here",
                style: const TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    user
                        ? nextScreen(context, const UserSignUp())
                        : nextScreen(
                            context,
                            AddMembers(
                              admin: false,
                              user: user,
                              doctor: doctor,
                              trainer: trainer,
                              teacher: teacher,
                            ));
                  }),
          ]),
    );
  }

  userLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _auth.login(_email, _password).then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(_email);
          await HelperFunctions.savedUserLoggedInStatus(true);
          await HelperFunctions.savedUserEmailSF(_email);
          await HelperFunctions.savedUserNameSF(snapshot.docs[0]['name']);
          nextScreenReplace(context, const UserHome());
        } else {
          setState(() {
            isLoading = false;
            showSnackBar(context, Colors.red, value);
          });
        }
      });
    }
  }

  adminLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _auth.login(_email, _password).then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingAdminData(_email);
          await HelperFunctions.savedAdminLoggedInStatus(true);
          await HelperFunctions.savedUserEmailSF(_email);
          await HelperFunctions.savedUserNameSF(snapshot.docs[0]['name']);
          nextScreenReplace(context, const AdminHome());
        } else {
          setState(() {
            isLoading = false;
            showSnackBar(context, Colors.red, value);
          });
        }
      });
    }
  }

  doctorLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _auth.login(_email, _password).then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingDoctorDataByEmail(_email);
          await HelperFunctions.savedDoctorLoggedInStatus(true);
          await HelperFunctions.savedUserEmailSF(_email);
          await HelperFunctions.savedUserNameSF(snapshot.docs[0]['name']);
          nextScreenReplace(context, const DoctorHome());
        } else {
          setState(() {
            isLoading = false;
            showSnackBar(context, Colors.red, value);
          });
        }
      });
    }
  }

  trainerLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _auth.login(_email, _password).then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingTrainerDetails(_email);
          await HelperFunctions.savedTrainerLoggedInStatus(true);
          await HelperFunctions.savedUserEmailSF(_email);
          await HelperFunctions.savedUserNameSF(snapshot.docs[0]['name']);
          nextScreenReplace(context, const TrainerHome());
        } else {
          setState(() {
            showSnackBar(context, Colors.red, value);
            isLoading = false;
          });
        }
      });
    }
  }

  teacherLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _auth.login(_email, _password).then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingTeacherDetails(_email);
          await HelperFunctions.savedTeacherLoggedInStatus(true);
          await HelperFunctions.savedUserEmailSF(_email);
          await HelperFunctions.savedUserNameSF(snapshot.docs[0]['name']);
          nextScreenReplace(context, const TeacherHome());
        } else {
          setState(() {
            showSnackBar(context, Colors.red, value);
            isLoading = false;
          });
        }
      });
    }
  }
}
