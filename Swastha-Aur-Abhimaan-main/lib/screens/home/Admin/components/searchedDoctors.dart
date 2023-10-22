import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/models/doctorListModel.dart';

class SearchedDoctors extends StatefulWidget {
  final String adminName;
  const SearchedDoctors({Key? key, required this.adminName}) : super(key: key);

  @override
  State<SearchedDoctors> createState() => _SearchedDoctorsState();
}

class _SearchedDoctorsState extends State<SearchedDoctors> {
  String searchBy = 'name';
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  QuerySnapshot? doctorSnapshot;
  bool hasUserSearched = false;

  @override
  void initState() {
    super.initState();
    searchDoctorByName();
    searchDoctorByGender();
    searchDoctorByType();
  }

  searchDoctorByName() async {
    await FirebaseFirestore.instance
        .collection('doctors')
        .where('name', isEqualTo: removeSpaces(searchController.text))
        .get()
        .then((value) {
      setState(() {
        doctorSnapshot = value;
        hasUserSearched = true;
      });
    });
  }

  searchDoctorByGender() async {
    await FirebaseFirestore.instance
        .collection('doctors')
        .where('gender', isEqualTo: removeSpaces(searchController.text))
        .get()
        .then((value) {
      setState(() {
        doctorSnapshot = value;
        hasUserSearched = true;
      });
    });
  }

  searchDoctorByType() async {
    await FirebaseFirestore.instance
        .collection('doctors')
        .where('doctor', isEqualTo: removeSpaces(searchController.text))
        .get()
        .then((value) {
      setState(() {
        doctorSnapshot = value;
        hasUserSearched = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Doctors',
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
              showPopUpMenu();
            },
            icon: Icon(
              Icons.filter_list,
              size: size.width * 0.05,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.02,
            left: size.width * 0.05,
            right: size.width * 0.05),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: size.height * 0.06,
                padding: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 157, 135, 149),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Lexend",
                            fontSize: size.width * 0.05),
                        decoration: InputDecoration(
                          hintText: 'Enter $searchBy',
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: "Lexend",
                              fontSize: size.width * 0.05),
                          border: InputBorder.none,
                        ),
                        autocorrect: true,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        searchBy == 'name'
                            ? searchDoctorByName()
                            : searchBy == 'gender'
                                ? searchDoctorByGender()
                                : searchDoctorByType();
                      },
                      icon: Icon(
                        Icons.search,
                        size: size.width * 0.05,
                        color: Colors.white,
                      ),
                      hoverColor: const Color.fromARGB(255, 157, 135, 149)
                          .withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            isLoading == true
                ? const CircularProgressIndicator()
                : hasUserSearched == true
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: doctorSnapshot!.docs.length,
                            itemBuilder: (context, index) {
                              return DoctorListModel(
                                adminName: widget.adminName,
                                name: doctorSnapshot!.docs[index].get('name'),
                                job: doctorSnapshot!.docs[index].get('doctor'),
                                id: doctorSnapshot!.docs[index].get('doctorId'),
                                collectionName: 'doctors',
                                fieldName: 'doctorId',
                              );
                            }),
                      )
                    : Container(
                        padding: EdgeInsets.only(top: size.height * 0.2),
                        alignment: Alignment.center,
                        child: Center(
                            child: Text(
                          'No Doctor Found',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 157, 135, 149),
                              fontFamily: 'Lexend',
                              fontSize: size.width * 0.05),
                        )),
                      ),
          ],
        ),
      ),
    );
  }

  showPopUpMenu() async {
    await showMenu(
        elevation: 8,
        context: context,
        position: const RelativeRect.fromLTRB(100, 80, 10, 100),
        items: [
          PopupMenuItem(
            onTap: () {
              setState(() {
                searchBy = 'name';
              });
            },
            value: 'name',
            child: const Text('Name'),
          ),
          PopupMenuItem(
            onTap: () {
              setState(() {
                searchBy = 'gender';
              });
            },
            value: 'gender',
            child: const Text('Gender'),
          ),
          PopupMenuItem(
            onTap: () {
              setState(() {
                searchBy = 'type';
              });
            },
            value: 'type',
            child: const Text('Doctor Type'),
          ),
        ]);
  }

  removeSpaces(String text) {
    return text.trim();
  }
}
