import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/screens/viewData/components/detailsDropDownModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class SearchPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  const SearchPage({super.key, required this.groupId, required this.groupName});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  QuerySnapshot? searchedSnapshot;
  List trainerNotInGroup = [];
  List doctorNotInGroup = [];
  List teacherNotInGroup = [];
  List userNotInGroup = [];
  List adminNotInGroup = [];
  String category = 'Select Category';
  String subCategory = 'Select Sub-Category';

  @override
  void initState() {
    super.initState();
    getTrainerNotInGroup();
    getDoctorNotInGroup();
    getTeacherNotInGroup();
    getUsersNotInGroup();
    getAdminNotInGroup();
    searchFunction();
  }

  searchFunction() async {
    await FirebaseFirestore.instance
        .collection(category)
        .where(subCategory,
            isEqualTo: capitalizeString(searchController.text.trim()))
        .get()
        .then((value) {
      setState(() {
        searchedSnapshot = value;
      });
    });
  }

  getTrainerNotInGroup() async {
    await DatabaseService()
        .getTrainerWhoAreNotInGroup(widget.groupId, widget.groupName)
        .then(
      (val) {
        setState(() {
          trainerNotInGroup = val.docs;
        });
      },
    );
  }

  getDoctorNotInGroup() async {
    final query = await DatabaseService()
        .getDoctorsWhoAreNotInGroup(widget.groupId, widget.groupName);
    setState(() {
      doctorNotInGroup = query.docs;
    });
  }

  getTeacherNotInGroup() async {
    await DatabaseService()
        .getTeachersWhoAreNotInGroup(widget.groupId, widget.groupName)
        .then(
      (val) {
        setState(() {
          teacherNotInGroup = val.docs;
        });
      },
    );
  }

  getUsersNotInGroup() async {
    await DatabaseService()
        .getUsersWhoAreNotInGroup1(widget.groupId, widget.groupName)
        .then(
      (val) {
        setState(() {
          userNotInGroup = val.docs;
        });
      },
    );
  }

  getAdminNotInGroup() async {
    await DatabaseService()
        .getAdminWhoAreNotInGroup(widget.groupId, widget.groupName)
        .then((val) {
      setState(() {
        adminNotInGroup = val.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
          barColor: Color.fromARGB(255, 94, 96, 96),
          tiColor: Colors.white,
          title: "Search",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        context: context,
                        builder: (context) => categoryPanel());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lexend',
                              fontSize: 16),
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    category == 'Select Category'
                        ? Fluttertoast.showToast(
                            msg: 'Please select category first',
                            backgroundColor:
                                const Color.fromARGB(255, 93, 96, 96),
                            textColor: Colors.white,
                            fontSize: 14)
                        : showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            context: context,
                            builder: (context) {
                              return subCategoryPanel();
                            });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          subCategory,
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lexend',
                              fontSize: 16),
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            subCategory == 'Select Sub-Category'
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) {
                              searchController.text.isEmpty
                                  ? Fluttertoast.showToast(
                                      msg: 'Please enter something to search',
                                      backgroundColor:
                                          const Color.fromARGB(255, 93, 96, 96),
                                      textColor: Colors.white,
                                      fontSize: 14)
                                  : searchFunction();
                            },
                            controller: searchController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lexend',
                                    fontSize: 16)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            searchController.text.isEmpty
                                ? Fluttertoast.showToast(
                                    msg: 'Please enter something to search',
                                    backgroundColor:
                                        const Color.fromARGB(255, 93, 96, 96),
                                    textColor: Colors.white,
                                    fontSize: 14)
                                : searchFunction();
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            searchedSnapshot == null
                ? const SizedBox()
                : Expanded(
                    child: ListView.builder(
                        itemCount: searchedSnapshot!.docs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      searchedSnapshot!.docs[index]['name'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Lexend',
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      searchedSnapshot!.docs[index]
                                          [subCategory],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Lexend',
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    category == 'admin'
                                        ? await DatabaseService()
                                            .addingAdminToGroup(
                                                widget.groupId,
                                                widget.groupName,
                                                adminNotInGroup.elementAt(
                                                    index)['adminId'],
                                                adminNotInGroup
                                                    .elementAt(index)['name'])
                                            .then((value) {
                                            setState(() {
                                              adminNotInGroup.removeAt(index);
                                            });
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Member Added Successfully',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 99, 96, 96),
                                                textColor: Colors.white,
                                                fontSize: size.width * 0.05);
                                          })
                                        : category == 'trainers'
                                            ? await DatabaseService()
                                                .addingTrainerToGroup(
                                                widget.groupId,
                                                widget.groupName,
                                                trainerNotInGroup.elementAt(
                                                    index)['trainerId'],
                                                trainerNotInGroup
                                                    .elementAt(index)['name'],
                                              )
                                                .then((value) {
                                                setState(() {
                                                  trainerNotInGroup
                                                      .removeAt(index);
                                                });
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Member Added Successfully',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 99, 96, 96),
                                                    textColor: Colors.white,
                                                    fontSize:
                                                        size.width * 0.05);
                                              })
                                            : category == 'doctors'
                                                ? await DatabaseService()
                                                    .addingDoctorToGroup(
                                                        widget.groupId,
                                                        widget.groupName,
                                                        doctorNotInGroup.elementAt(
                                                            index)['doctorId'],
                                                        doctorNotInGroup.elementAt(
                                                            index)['name'])
                                                    .then((value) {
                                                    setState(() {
                                                      doctorNotInGroup
                                                          .removeAt(index);
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Member Added Successfully',
                                                        toastLength: Toast
                                                            .LENGTH_SHORT,
                                                        gravity: ToastGravity
                                                            .BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                99,
                                                                96,
                                                                96),
                                                        textColor: Colors.white,
                                                        fontSize:
                                                            size.width * 0.05);
                                                  })
                                                : category == 'teachers'
                                                    ? await DatabaseService()
                                                        .addingTeacherToGroup(
                                                            widget.groupId,
                                                            widget.groupName,
                                                            teacherNotInGroup
                                                                    .elementAt(index)[
                                                                'teacherId'],
                                                            teacherNotInGroup.elementAt(
                                                                index)['name'])
                                                        .then((value) {
                                                        setState(() {
                                                          doctorNotInGroup
                                                              .removeAt(index);
                                                        });
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                'Member Added Successfully',
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .BOTTOM,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    99,
                                                                    96,
                                                                    96),
                                                            textColor:
                                                                Colors.white,
                                                            fontSize:
                                                                size.width *
                                                                    0.05);
                                                      })
                                                    : category == 'users'
                                                        ? await DatabaseService()
                                                            .addingUserToGroup(
                                                                widget.groupId,
                                                                widget.groupName,
                                                                userNotInGroup.elementAt(index)['userId'],
                                                                userNotInGroup.elementAt(index)['name'])
                                                            .then((value) {
                                                            setState(() {
                                                              userNotInGroup
                                                                  .removeAt(
                                                                      index);
                                                            });
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    'Member Added Successfully',
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .BOTTOM,
                                                                timeInSecForIosWeb:
                                                                    1,
                                                                backgroundColor:
                                                                    const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        99,
                                                                        96,
                                                                        96),
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                fontSize:
                                                                    size.width *
                                                                        0.05);
                                                          })
                                                        : null;
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 99, 96, 96),
                                  ),
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      fontFamily: 'Lexend',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }

  categoryPanel() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 300,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Column(
        children: [
          const SizedBox(
            width: 40,
            child: Divider(
                color: Color.fromARGB(255, 184, 183, 183), thickness: 2),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Select Category',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Lexend', fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
              color: Color.fromARGB(255, 184, 183, 183), thickness: 1),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  tileColor: category == 'users'
                      ? Colors.grey[300]
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: category == 'users'
                              ? Colors.black
                              : Colors.transparent,
                          width: 1)),
                  onTap: () {
                    setState(() {
                      category = 'users';
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    'Users',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  tileColor: category == 'admin'
                      ? Colors.grey[300]
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: category == 'admin'
                              ? Colors.black
                              : Colors.transparent,
                          width: 1)),
                  onTap: () {
                    setState(() {
                      category = 'admin';
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    'Admin',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  tileColor: category == 'doctors'
                      ? Colors.grey[300]
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: category == 'doctors'
                              ? Colors.black
                              : Colors.transparent,
                          width: 1)),
                  onTap: () {
                    setState(() {
                      category = 'doctors';
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    'Doctors',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  tileColor: category == 'trainers'
                      ? Colors.grey[300]
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: category == 'trainers'
                              ? Colors.black
                              : Colors.transparent,
                          width: 1)),
                  onTap: () {
                    setState(() {
                      category = 'trainers';
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    'Trainers',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  tileColor: category == 'teachers'
                      ? Colors.grey[300]
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: category == 'teachers'
                              ? Colors.black
                              : Colors.transparent,
                          width: 1)),
                  onTap: () {
                    setState(() {
                      category = 'teachers';
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    'Teachers',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  subCategoryPanel() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 180,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Column(
        children: [
          const SizedBox(
            width: 40,
            child: Divider(
                color: Color.fromARGB(255, 184, 183, 183), thickness: 2),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Select Sub Category',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Lexend', fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
              color: Color.fromARGB(255, 184, 183, 183), thickness: 1),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  tileColor: subCategory == 'name'
                      ? Colors.grey[300]
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: subCategory == 'name'
                              ? Colors.black
                              : Colors.transparent,
                          width: 1)),
                  onTap: () {
                    setState(() {
                      subCategory = 'name';
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  tileColor: subCategory == 'gender'
                      ? Colors.grey[300]
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: subCategory == 'gender'
                              ? Colors.black
                              : Colors.transparent,
                          width: 1)),
                  onTap: () {
                    setState(() {
                      subCategory = 'gender';
                    });
                    Navigator.pop(context);
                  },
                  title: const Text(
                    'Gender',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend',
                        fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                  child: category == 'users'
                      ? ListTile(
                          tileColor: subCategory == 'village'
                              ? Colors.grey[300]
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: subCategory == 'village'
                                      ? Colors.black
                                      : Colors.transparent,
                                  width: 1)),
                          onTap: () {
                            setState(() {
                              subCategory = 'village';
                            });
                            Navigator.pop(context);
                          },
                          title: const Text(
                            'Village',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Lexend',
                                fontSize: 16),
                          ),
                        )
                      : category == 'doctors'
                          ? ListTile(
                              tileColor: subCategory == 'doctor'
                                  ? Colors.grey[300]
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: subCategory == 'doctor'
                                          ? Colors.black
                                          : Colors.transparent,
                                      width: 1)),
                              onTap: () {
                                setState(() {
                                  subCategory = 'doctor';
                                });
                                Navigator.pop(context);
                              },
                              title: const Text(
                                'Speciality',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lexend',
                                    fontSize: 16),
                              ),
                            )
                          : category == 'teachers'
                              ? ListTile(
                                  tileColor: subCategory == 'subject'
                                      ? Colors.grey[300]
                                      : Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: subCategory == 'subject'
                                              ? Colors.black
                                              : Colors.transparent,
                                          width: 1)),
                                  onTap: () {
                                    setState(() {
                                      subCategory = 'subject';
                                    });
                                    Navigator.pop(context);
                                  },
                                  title: const Text(
                                    'Subject',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Lexend',
                                        fontSize: 16),
                                  ),
                                )
                              : const SizedBox(
                                  width: 0,
                                )),
            ],
          ),
        ],
      ),
    );
  }
}
