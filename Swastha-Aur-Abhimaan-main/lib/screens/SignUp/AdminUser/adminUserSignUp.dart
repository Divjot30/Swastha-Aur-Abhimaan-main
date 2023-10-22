import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/adminHome.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';
import 'package:swastha_aur_swabhimaan/services/authServices.dart';

// ignore: must_be_immutable
class AdminUserSignUp extends StatefulWidget {
  bool? user;
  bool? admin;
  AdminUserSignUp({Key? key, required this.admin, required this.user})
      : super(key: key);

  @override
  State<AdminUserSignUp> createState() => _AdminUserSignUpState();
}

class _AdminUserSignUpState extends State<AdminUserSignUp> {
  final AuthServices _auth = AuthServices();
  final formKey = GlobalKey<FormState>();
  // ignore: unused_field
  bool _isLoading = false;
  String _email = '';
  String _password = '';
  String _name = '';
  String _gender = '';
  String block = '';
  List groupNames = [];

  @override
  void initState() {
    super.initState();
    getGroupNames();
  }

  getGroupNames() async {
    var groups = await FirebaseFirestore.instance.collection('groups').get();
    setState(() {
      groupNames = groups.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            children: [
              Image.asset('Assets/images/commonLogin.png'),
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
              Text(
                "Select the role",
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
                          widget.user = !widget.user!;
                          widget.admin = false;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                        click: widget.user!,
                        label: 'User',
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.admin = !widget.admin!;
                          widget.user = false;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                        click: widget.admin!,
                        label: 'Admin',
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
                      fullName(),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      email(),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      password(),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      gender(),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      widget.user! ? village() : const SizedBox(),
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
                          adminRegister();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          "Register",
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
            ],
          ),
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

  TextFormField fullName() {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: TextInputType.name,
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
        hintText: 'Full Name',
        hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Kollektif",
            fontSize: size.width * 0.05),
      ),
      onChanged: (val) {
        setState(() {
          _name = val;
        });
      },
      validator: (val) {
        return val!.isEmpty ? "Please enter your name" : null;
      },
    );
  }

  DropdownButtonFormField gender() {
    Size size = MediaQuery.of(context).size;
    return DropdownButtonFormField(
        borderRadius: BorderRadius.circular(15),
        itemHeight: size.height * 0.06,
        style: TextStyle(
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.w400,
          fontFamily: "Kollektif",
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: "Choose Gender",
          hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: "Kollektif",
              fontSize: size.width * 0.05),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        items: const [
          DropdownMenuItem(value: "Male", child: Text("Male")),
          DropdownMenuItem(value: "Female", child: Text("Female")),
          DropdownMenuItem(value: "Others", child: Text("Others")),
        ],
        onChanged: (value) {
          setState(() {
            _gender = value.toString();
          });
        });
  }

  DropdownButtonFormField village() {
    Size size = MediaQuery.of(context).size;
    return DropdownButtonFormField(
        borderRadius: BorderRadius.circular(15),
        itemHeight: size.height * 0.06,
        style: TextStyle(
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.w400,
          fontFamily: "Kollektif",
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: "Select Block",
          hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: "Kollektif",
              fontSize: size.width * 0.05),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        items: const [
          DropdownMenuItem(value: "Vikasnagar", child: Text("Vikasnagar")),
          DropdownMenuItem(value: "Sahaspur", child: Text("Sahaspur")),
          DropdownMenuItem(value: "Doiwala", child: Text("Doiwala")),
        ],
        onChanged: (value) {
          setState(() {
            block = value.toString();
          });
        });
  }

  // register functions

  adminRegister() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _auth.adminRegister(_email, _name, _password, _gender).then(
        (value) async {
          if (value == true) {
            await HelperFunctions.savedAdminLoggedInStatus(true);
            await HelperFunctions.savedUserNameSF(_name);
            await HelperFunctions.savedUserEmailSF(_email);
            // ignore: use_build_context_synchronously
            nextScreenReplace(context, const AdminHome());
          } else {
            setState(() {
              Fluttertoast.showToast(
                  msg: value,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);

              _isLoading = false;
            });
          }
        },
      );
    }
  }
}
