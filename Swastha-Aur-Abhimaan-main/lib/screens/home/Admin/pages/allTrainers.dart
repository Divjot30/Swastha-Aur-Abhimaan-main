import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/doctorListModel.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/viewProfile/viewProfile.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/components/searchedTrainers.dart';

class AllTrainers extends StatefulWidget {
  final String adminName;
  const AllTrainers({Key? key, required this.adminName}) : super(key: key);

  @override
  State<AllTrainers> createState() => _AllTrainersState();
}

class _AllTrainersState extends State<AllTrainers> {
  bool all = true;
  bool vikasnagar = false;
  bool doiwala = false;
  bool sahaspur = false;
  bool isSearchInitiated = false;

  TextEditingController searchController = TextEditingController();
  List trainer = [];
  @override
  void initState() {
    //
    super.initState();
    getTrainers();
  }

  getTrainers() async {
    var trainers =
        await FirebaseFirestore.instance.collection('trainers').get();
    setState(() {
      trainer = trainers.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All trainers',
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
                  context, SearchedTrainers(adminName: widget.adminName));
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
              trainer.isEmpty
                  ? Center(child: Image.asset('Assets/Logo/noTr.png'))
                  : SizedBox(
                      height: size.height * 0.7,
                      child: ListView.builder(
                          itemCount: trainer.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                nextScreen(
                                    context,
                                    ViewProfile(
                                        adminName: widget.adminName,
                                        id: trainer[index]['trainerId'],
                                        collectionName: 'trainers',
                                        fieldName: 'trainerId'));
                              },
                              child: DoctorListModel(
                                adminName: widget.adminName,
                                name: trainer[index]['name'],
                                job: trainer[index]['email'],
                                id: trainer[index]['trainerId'],
                                collectionName: 'trainers',
                                fieldName: 'trainerId',
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
