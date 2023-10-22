import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/models/doctorListModel.dart';

class SearchedTeachers extends StatefulWidget {
  final String adminName;
  const SearchedTeachers({Key? key, required this.adminName}) : super(key: key);

  @override
  State<SearchedTeachers> createState() => _SearchedTeachersState();
}

class _SearchedTeachersState extends State<SearchedTeachers> {
  String searchBy = 'name';
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  List teacherList = [];
  bool hasUserSearched = false;

  @override
  void initState() {
    super.initState();
    searchTeacherByName();
    searchTeacherBySubject();
    searchTeacherByGender();
  }

  searchTeacherByName() async {
    var teachers = await FirebaseFirestore.instance
        .collection('teachers')
        .where('name', isEqualTo: removeSpaces(searchController.text))
        .get();
    setState(() {
      teacherList = teachers.docs;
      hasUserSearched = true;
    });
  }

  searchTeacherBySubject() async {
    var teachers = await FirebaseFirestore.instance
        .collection('teachers')
        .where('subject', isEqualTo: removeSpaces(searchController.text))
        .get();
    setState(() {
      teacherList = teachers.docs;
      hasUserSearched = true;
    });
  }

  searchTeacherByGender() async {
    var teachers = await FirebaseFirestore.instance
        .collection('teachers')
        .where('gender', isEqualTo: removeSpaces(searchController.text))
        .get();
    setState(() {
      teacherList = teachers.docs;
      hasUserSearched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Teachers',
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
                            ? searchTeacherByName()
                            : searchBy == 'subject'
                                ? searchTeacherBySubject()
                                : searchTeacherByGender();
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
                            itemCount: teacherList.length,
                            itemBuilder: (context, index) {
                              return DoctorListModel(
                                adminName: widget.adminName,
                                name: teacherList[index].get('name'),
                                job: teacherList[index].get('subject'),
                                id: teacherList[index].get('teacherId'),
                                collectionName: 'teachers',
                                fieldName: 'teacherId',
                              );
                            }),
                      )
                    : Container(
                        padding: EdgeInsets.only(top: size.height * 0.2),
                        alignment: Alignment.center,
                        child: Center(
                            child: Text(
                          'No Teacher Found',
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
                searchBy = 'subject';
              });
            },
            value: 'subject',
            child: const Text('Subject'),
          ),
        ]);
  }

  removeSpaces(String text) {
    return text.trim();
  }
}
