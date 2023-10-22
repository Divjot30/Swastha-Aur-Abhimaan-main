import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Login/common/login.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/adminHome.dart';
import 'package:swastha_aur_swabhimaan/screens/joinGroup/joinGroup.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';
import 'package:swastha_aur_swabhimaan/services/authServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class AddMembers extends StatefulWidget {
  bool admin;
  bool? user;
  bool? doctor;
  bool? trainer;
  bool? teacher;
  AddMembers(
      {Key? key,
      required this.admin,
      required this.doctor,
      required this.teacher,
      required this.trainer,
      required this.user})
      : super(key: key);

  @override
  State<AddMembers> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  final AuthServices _auth = AuthServices();
  final formKey = GlobalKey<FormState>();
  // ignore: unused_field
  bool _isLoading = false;
  String _email = '';
  String _password = '';
  String _name = '';
  String _gender = '';
  String _docType = '';
  String _subject = '';
  String _block = '';
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
        child: SizedBox(
          child: Column(
            children: [
              Image.asset('Assets/images/commonLogin.png'),
              SizedBox(
                height: size.height * 1.6,
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
                          widget.admin = !widget.admin;
                          widget.user = false;
                          widget.doctor = false;
                          widget.trainer = false;
                          widget.teacher = false;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                        click: widget.admin,
                        label: 'Admin',
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.admin = false;
                          widget.user = !widget.user!;
                          widget.doctor = false;
                          widget.trainer = false;
                          widget.teacher = false;
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
                          widget.admin = false;
                          widget.user = false;
                          widget.doctor = !widget.doctor!;
                          widget.trainer = false;
                          widget.teacher = false;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                        click: widget.doctor!,
                        label: 'Doctor',
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.admin = false;
                          widget.user = false;
                          widget.doctor = false;
                          widget.trainer = !widget.trainer!;
                          widget.teacher = false;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                        click: widget.trainer!,
                        label: 'Trainer',
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.admin = false;
                          widget.user = false;
                          widget.doctor = false;
                          widget.trainer = false;
                          widget.teacher = !widget.teacher!;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromRGBO(33, 150, 243, 1),
                        fillColor: const Color.fromARGB(255, 191, 230, 240),
                        click: widget.teacher!,
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
                      widget.user!
                          ? village()
                          : widget.doctor!
                              ? type()
                              : widget.teacher!
                                  ? subject()
                                  : const SizedBox(),
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
                          widget.user!
                              ? userRegister()
                              : widget.doctor!
                                  ? registerDoctor()
                                  : widget.trainer!
                                      ? trainerRegister()
                                      : widget.teacher!
                                          ? teacherRegister()
                                          : widget.admin
                                              ? adminRegister()
                                              : null;
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
        itemHeight: 50,
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

  TextFormField type() {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: TextInputType.text,
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
        hintText: 'Doctor Type',
        hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Kollektif",
            fontSize: size.width * 0.05),
      ),
      onChanged: (val) {
        setState(() {
          _docType = val;
        });
      },
      validator: (val) {
        return val!.isEmpty ? "Please enter your type" : null;
      },
    );
  }

  DropdownButtonFormField village() {
    Size size = MediaQuery.of(context).size;
    return DropdownButtonFormField(
        borderRadius: BorderRadius.circular(15),
        itemHeight: 50,
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
            _block = value.toString();
          });
        });
  }

  TextFormField subject() {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: TextInputType.text,
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
        hintText: 'Subject',
        hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Kollektif",
            fontSize: size.width * 0.05),
      ),
      onChanged: (val) {
        setState(() {
          _subject = val;
        });
      },
      validator: (val) {
        return val!.isEmpty ? "Please enter your subject" : null;
      },
    );
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
            // ignore: use_build_context_synchronously
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

  userRegister() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _auth
          .userRegister(
        _email,
        _name,
        _block,
        _password,
        _gender,
      )
          .then(
        (value) async {
          if (value == true) {
            Fluttertoast.showToast(
                msg: "Registered Successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: const Color.fromARGB(255, 5, 172, 238),
                textColor: Colors.white,
                fontSize: 16.0);
            nextScreenReplace(
              context,
              JoinGroup(
                groupName: _block,
                userName: _name,
                gender: _gender,
                email: _email,
                isAdminRegistering: true,
              ),
            );
          } else {
            setState(() {
              Fluttertoast.showToast(
                  msg: "This email is already registered",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: const Color.fromARGB(255, 5, 172, 238),
                  textColor: Colors.white,
                  fontSize: 16.0);
              _isLoading = false;
            });
          }
        },
      );
    }
  }

  registerDoctor() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _auth.register(_email, _name, _docType, _gender, _password).then(
        (value) async {
          if (value == true) {
            Fluttertoast.showToast(
                msg: "Registered Successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: const Color.fromARGB(255, 5, 172, 238),
                textColor: Colors.white,
                fontSize: 16.0);
            // _auth.signOut('Admin');
            nextScreenReplace(context, const AdminHome());
          } else {
            setState(() {
              Fluttertoast.showToast(
                  msg: "This email is already registered",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: const Color.fromARGB(255, 5, 172, 238),
                  textColor: Colors.white,
                  fontSize: 16.0);
              _isLoading = false;
            });
          }
        },
      );
    }
  }

  trainerRegister() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _auth
          .trainerRegister(
        _name,
        _email,
        _password,
        _gender,
      )
          .then(
        (value) async {
          if (value == true) {
            Fluttertoast.showToast(
                msg: "Registered Successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: const Color.fromARGB(255, 5, 172, 238),
                textColor: Colors.white,
                fontSize: 16.0);
            // _auth.signOut('Admin');
            nextScreenReplace(context, const AdminHome());
          } else {
            setState(() {
              Fluttertoast.showToast(
                  msg: "This email is already registered",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: const Color.fromARGB(255, 238, 13, 5),
                  textColor: Colors.white,
                  fontSize: 16.0);
              _isLoading = false;
            });
          }
        },
      );
    }
  }

  teacherRegister() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _auth
          .teacherRegister(
        _name,
        _email,
        _gender,
        _subject,
        _password,
      )
          .then(
        (value) async {
          if (value == true) {
            Fluttertoast.showToast(
                msg: "Registered Successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: const Color.fromARGB(255, 5, 172, 238),
                textColor: Colors.white,
                fontSize: 16.0);
            nextScreenReplace(context, AdminHome());
          } else {
            setState(() {
              Fluttertoast.showToast(
                  msg: "This email is already registered",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: const Color.fromARGB(255, 238, 13, 5),
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
