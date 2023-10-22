import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/doctorListModel.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/viewProfile/viewProfile.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/components/searchedTeachers.dart';

class AllTeachers extends StatefulWidget {
  final String adminName;
  const AllTeachers({Key? key, required this.adminName}) : super(key: key);

  @override
  State<AllTeachers> createState() => _AllTeachersState();
}

class _AllTeachersState extends State<AllTeachers> {
  bool all = true;
  bool vikasnagar = false;
  bool doiwala = false;
  bool sahaspur = false;
  bool isSearchInitiated = false;

  TextEditingController searchController = TextEditingController();
  List teacher = [];
  List vikasnagarUsers = [];
  List doiwalaUsers = [];
  List sahaspurUsers = [];
  @override
  void initState() {
    super.initState();
    getTeachers();
  }

  getTeachers() async {
    var doctors = await FirebaseFirestore.instance.collection('teachers').get();
    setState(() {
      teacher = doctors.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Teachers',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "Lexend",
              fontSize: size.width * 0.05),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: size.width * 0.05,
            )),
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(
                  context, SearchedTeachers(adminName: widget.adminName));
            },
            icon: Icon(
              Icons.search,
              size: size.width * 0.05,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              teacher.isEmpty
                  ? Center(child: Image.asset('Assets/Logo/noT.png'))
                  : SizedBox(
                      height: size.height * 0.7,
                      child: ListView.builder(
                          itemCount: teacher.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                nextScreen(
                                    context,
                                    ViewProfile(
                                        adminName: widget.adminName,
                                        id: teacher[index]['teacherId'],
                                        collectionName: 'teachers',
                                        fieldName: 'teacherId'));
                              },
                              child: DoctorListModel(
                                adminName: widget.adminName,
                                name: teacher[index]['name'],
                                job: teacher[index]['subject'],
                                id: teacher[index]['teacherId'],
                                collectionName: 'teachers',
                                fieldName: 'teacherId',
                              ),
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
