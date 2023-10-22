import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/doctorListModel.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/viewProfile/viewProfile.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/components/searchedDoctors.dart';

class AllDoctors extends StatefulWidget {
  final String adminName;
  const AllDoctors({Key? key, required this.adminName}) : super(key: key);

  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  bool all = true;
  bool vikasnagar = false;
  bool doiwala = false;
  bool sahaspur = false;
  bool isSearchInitiated = false;

  TextEditingController searchController = TextEditingController();
  List doctor = [];
  List vikasnagarUsers = [];
  List doiwalaUsers = [];
  List sahaspurUsers = [];
  @override
  void initState() {
    super.initState();
    getDoctors();
  }

  getDoctors() async {
    var doctors = await FirebaseFirestore.instance.collection('doctors').get();
    setState(() {
      doctor = doctors.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Doctors',
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
              nextScreen(context, SearchedDoctors(adminName: widget.adminName));
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
              doctor.isEmpty
                  ? Center(child: Image.asset('Assets/Logo/noDocR.png'))
                  : SizedBox(
                      height: size.height * 0.7,
                      child: ListView.builder(
                          itemCount: doctor.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                nextScreen(
                                    context,
                                    ViewProfile(
                                        adminName: widget.adminName,
                                        id: doctor[index]['doctorId'],
                                        collectionName: 'doctors',
                                        fieldName: 'doctorId'));
                              },
                              child: DoctorListModel(
                                adminName: widget.adminName,
                                name: doctor[index]['name'],
                                job: doctor[index]['doctor'],
                                id: doctor[index]['doctorId'],
                                collectionName: 'doctors',
                                fieldName: 'doctorId',
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
