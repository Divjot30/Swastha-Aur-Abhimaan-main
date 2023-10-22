import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/models/chatListTile.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';

class Chat extends StatefulWidget {
  final bool isUser;
  final bool isDoctor;
  final bool isTrainer;
  final bool isTeacher;
  final bool isAdmin;
  const Chat(
      {Key? key,
      required this.isUser,
      required this.isAdmin,
      required this.isDoctor,
      required this.isTeacher,
      required this.isTrainer})
      : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool user = false;
  bool admin = false;
  bool doctor = false;
  bool trainer = false;
  bool teacher = false;

  List users = [];
  List doctors = [];
  List trainers = [];
  List teachers = [];
  List admins = [];

  @override
  void initState() {
    super.initState();
    getUsers();
    getDoctors();
    getTrainers();
    getTeachers();
    getAdmins();
  }

  getAdmins() async {
    var adminList = await FirebaseFirestore.instance.collection('admin').get();
    setState(() {
      admins = adminList.docs;
    });
  }

  getUsers() async {
    var userList = await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      users = userList.docs;
    });
  }

  getDoctors() async {
    var docList = await FirebaseFirestore.instance.collection('doctors').get();
    setState(() {
      doctors = docList.docs;
    });
  }

  getTrainers() async {
    var trainerList =
        await FirebaseFirestore.instance.collection('trainers').get();
    setState(() {
      trainers = trainerList.docs;
    });
  }

  getTeachers() async {
    var teacherList =
        await FirebaseFirestore.instance.collection('teachers').get();
    setState(() {
      teachers = teacherList.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.015),
        width: size.width,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: widget.isAdmin == false,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          user = false;
                          admin = !admin;
                          doctor = false;
                          trainer = false;
                          teacher = false;
                        });
                      },
                      child: OptionBarModel(
                        fillColor: const Color.fromARGB(255, 158, 156, 156),
                        borderColor: const Color.fromARGB(255, 99, 96, 96),
                        click: admin,
                        label: 'Admin',
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Visibility(
                    visible: widget.isUser == false,
                    child: GestureDetector(
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
                  ),
                  SizedBox(width: size.width * 0.02),
                  Visibility(
                    visible: widget.isDoctor == false,
                    child: GestureDetector(
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
                  ),
                  SizedBox(width: size.width * 0.02),
                  Visibility(
                    visible: widget.isTrainer == false,
                    child: GestureDetector(
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
                  ),
                  SizedBox(width: size.width * 0.02),
                  Visibility(
                    visible: widget.isTeacher == false,
                    child: GestureDetector(
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
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: SizedBox(
                width: size.width,
                child: admin
                    ? adminChatList()
                    : user
                        ? userChatList()
                        : doctor
                            ? doctorChatList()
                            : trainer
                                ? trainerChatList()
                                : teacher
                                    ? teacherChatList()
                                    : Center(
                                        child: Image.asset(
                                            'Assets/images/noChat.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userChatList() {
    return users.isEmpty
        ? Center(child: Image.asset('Assets/images/noChat.png'))
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChatListTile(
                  name: users[index]['name'],
                  role: users[index]['email'],
                  id: users[index]['userId'],
                ),
              );
            });
  }

  Widget teacherChatList() {
    return teachers.isEmpty
        ? Center(child: Image.asset('Assets/images/noChat.png'))
        : ListView.builder(
            itemCount: teachers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChatListTile(
                  name: teachers[index]['name'],
                  role: teachers[index]['email'],
                  id: teachers[index]['teacherId'],
                ),
              );
            });
  }

  Widget trainerChatList() {
    return trainers.isEmpty
        ? Center(child: Image.asset('Assets/images/noChat.png'))
        : ListView.builder(
            itemCount: trainers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChatListTile(
                    name: trainers[index]['name'],
                    role: trainers[index]['email'],
                    id: trainers[index]['trainerId']),
              );
            });
  }

  doctorChatList() {
    return doctors.isEmpty
        ? Center(child: Image.asset('Assets/images/noChat.png'))
        : ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChatListTile(
                    name: doctors[index]['name'],
                    role: doctors[index]['doctor'],
                    id: doctors[index]['doctorId']),
              );
            });
  }

  adminChatList() {
    return admins.isEmpty
        ? Center(child: Image.asset('Assets/images/noChat.png'))
        : ListView.builder(
            itemCount: admins.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChatListTile(
                    name: admins[index]['name'],
                    role: admins[index]['email'],
                    id: admins[index]['adminId']),
              );
            });
  }
}
