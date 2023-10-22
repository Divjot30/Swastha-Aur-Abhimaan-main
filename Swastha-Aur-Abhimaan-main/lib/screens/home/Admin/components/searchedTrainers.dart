import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/models/doctorListModel.dart';

class SearchedTrainers extends StatefulWidget {
  final String adminName;
  const SearchedTrainers({Key? key, required this.adminName}) : super(key: key);

  @override
  State<SearchedTrainers> createState() => _SearchedTrainersState();
}

class _SearchedTrainersState extends State<SearchedTrainers> {
  String searchBy = 'name';
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  QuerySnapshot? trainerSnapshot;
  bool hasUserSearched = false;

  @override
  void initState() {
    super.initState();
    searchTrainerByName();
    searchTrainerByGender();
  }

  searchTrainerByName() async {
    await FirebaseFirestore.instance
        .collection('trainers')
        .where('name', isEqualTo: removeSpaces(searchController.text))
        .get()
        .then((value) {
      setState(() {
        trainerSnapshot = value;
        hasUserSearched = true;
      });
    });
  }

  searchTrainerByGender() async {
    await FirebaseFirestore.instance
        .collection('trainers')
        .where('gender', isEqualTo: removeSpaces(searchController.text))
        .get()
        .then((value) {
      setState(() {
        trainerSnapshot = value;
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
          'Search trainers',
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
                            ? searchTrainerByName()
                            : searchBy == 'gender'
                                ? searchTrainerByGender()
                                : null;
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
                            itemCount: trainerSnapshot!.docs.length,
                            itemBuilder: (context, index) {
                              return DoctorListModel(
                                adminName: widget.adminName,
                                name: trainerSnapshot!.docs[index].get('name'),
                                job: trainerSnapshot!.docs[index].get('email'),
                                id: trainerSnapshot!.docs[index]
                                    .get('trainerId'),
                                collectionName: 'trainers',
                                fieldName: 'trainerId',
                              );
                            }),
                      )
                    : Container(
                        padding: EdgeInsets.only(top: size.height * 0.2),
                        alignment: Alignment.center,
                        child: Center(
                            child: Text(
                          'No Trainer Found',
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
        ]);
  }

  removeSpaces(String text) {
    return text.trim();
  }
}
