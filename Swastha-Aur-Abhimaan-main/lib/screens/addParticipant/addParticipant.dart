import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';
import 'package:swastha_aur_swabhimaan/screens/addParticipant/components/searchPage.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

// ignore: must_be_immutable
class AddParticipant extends StatefulWidget {
  String groupName;
  String groupId;
  AddParticipant({Key? key, required this.groupName, required this.groupId})
      : super(key: key);

  @override
  State<AddParticipant> createState() => _AddParticipantState();
}

class _AddParticipantState extends State<AddParticipant> {
  bool user = true;
  bool admin = false;
  bool doctor = false;
  bool trainer = false;
  bool teacher = false;
  List trainerNotInGroup = [];
  List doctorNotInGroup = [];
  List teacherNotInGroup = [];
  List userNotInGroup = [];

  @override
  initState() {
    super.initState();
    getTrainerNotInGroup();
    getDoctorNotInGroup();
    getTeacherNotInGroup();
    getUsersNotInGroup();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 99, 96, 96),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: const Text(
          'Add New Members',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'Lexend'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(
                    context,
                    SearchPage(
                        groupId: widget.groupId, groupName: widget.groupName));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.02),
        child: Column(
          children: [
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
                      fillColor: const Color.fromARGB(255, 158, 156, 156),
                      borderColor: const Color.fromARGB(255, 99, 96, 96),
                      click: user,
                      label: 'User',
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
                      fillColor: const Color.fromARGB(255, 158, 156, 156),
                      borderColor: const Color.fromARGB(255, 99, 96, 96),
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
                      fillColor: const Color.fromARGB(255, 158, 156, 156),
                      borderColor: const Color.fromARGB(255, 99, 96, 96),
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
                      fillColor: const Color.fromARGB(255, 158, 156, 156),
                      borderColor: const Color.fromARGB(255, 99, 96, 96),
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
            Text(
              'Add New Members to ${widget.groupName}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontFamily: 'Lexend',
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
              child: Divider(
                color: Colors.black,
                thickness: 1,
                endIndent: size.width * 0.05,
                indent: size.width * 0.05,
              ),
            ),
            // userNotInGroup.isEmpty ||
            //         doctorNotInGroup.isEmpty ||
            //         trainerNotInGroup.isEmpty ||
            //         teacherNotInGroup.isEmpty
            //     ? Text(
            //         'No New Members to Add',
            //         style: TextStyle(
            //           fontSize: size.width * 0.05,
            //           fontFamily: 'Lexend',
            //           color: Colors.black,
            //         ),
            //       )
            //     :
            Expanded(
              child: ListView.builder(
                itemCount: user
                    ? userNotInGroup.length
                    : doctor
                        ? doctorNotInGroup.length
                        : trainer
                            ? trainerNotInGroup.length
                            : teacher
                                ? teacherNotInGroup.length
                                : 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        bottom: size.height * 0.02,
                        left: size.width * 0.02,
                        right: size.width * 0.02),
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          trainer
                              ? trainerNotInGroup[index]['name']
                              : user
                                  ? userNotInGroup[index]['name']
                                  : doctor
                                      ? doctorNotInGroup[index]['name']
                                      : teacher
                                          ? teacherNotInGroup[index]['name']
                                          : '',
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontFamily: 'Lexend',
                            color: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            trainer
                                ? await DatabaseService()
                                    .addingTrainerToGroup(
                                    widget.groupId,
                                    widget.groupName,
                                    trainerNotInGroup
                                        .elementAt(index)['trainerId'],
                                    trainerNotInGroup.elementAt(index)['name'],
                                  )
                                    .then((value) {
                                    setState(() {
                                      trainerNotInGroup.removeAt(index);
                                    });
                                    Fluttertoast.showToast(
                                        msg: 'Member Added Successfully',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: const Color.fromARGB(
                                            255, 99, 96, 96),
                                        textColor: Colors.white,
                                        fontSize: size.width * 0.05);
                                  })
                                : doctor
                                    ? await DatabaseService()
                                        .addingDoctorToGroup(
                                            widget.groupId,
                                            widget.groupName,
                                            doctorNotInGroup
                                                .elementAt(index)['doctorId'],
                                            doctorNotInGroup
                                                .elementAt(index)['name'])
                                        .then((value) {
                                        setState(() {
                                          doctorNotInGroup.removeAt(index);
                                        });
                                        Fluttertoast.showToast(
                                            msg: 'Member Added Successfully',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 99, 96, 96),
                                            textColor: Colors.white,
                                            fontSize: size.width * 0.05);
                                      })
                                    : teacher
                                        ? await DatabaseService()
                                            .addingTeacherToGroup(
                                                widget.groupId,
                                                widget.groupName,
                                                teacherNotInGroup.elementAt(
                                                    index)['teacherId'],
                                                teacherNotInGroup
                                                    .elementAt(index)['name'])
                                            .then((value) {
                                            setState(() {
                                              doctorNotInGroup.removeAt(index);
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
                                        : await DatabaseService()
                                            .addingUserToGroup(
                                                widget.groupId,
                                                widget.groupName,
                                                userNotInGroup
                                                    .elementAt(index)['userId'],
                                                userNotInGroup
                                                    .elementAt(index)['name'])
                                            .then((value) {
                                            setState(() {
                                              doctorNotInGroup.removeAt(index);
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
                                          });
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
