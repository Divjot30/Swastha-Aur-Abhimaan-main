import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/pages/group.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/pages/chat.dart';

class MessageHome extends StatefulWidget {
  final bool isUser;
  final bool isDoctor;
  final bool isTeacher;
  final bool isTrainer;
  final String email;

  const MessageHome(
      {super.key,
      required this.isUser,
      required this.email,
      required this.isDoctor,
      required this.isTeacher,
      required this.isTrainer});

  @override
  _MessageHomeState createState() => _MessageHomeState();
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Group'),
];

const List<Tab> userTabs = <Tab>[
  Tab(text: 'Group'),
];

List<Widget> userPages = <Widget>[
  const Group(
    isAdmin: false,
    isDoctor: false,
    isTeacher: false,
    isTrainer: false,
    isUser: true,
  ),
];

const List<Tab> doctorTabs = <Tab>[
  Tab(text: 'Group'),
];

List<Widget> doctorPages = <Widget>[
  const Group(
    isAdmin: false,
    isDoctor: true,
    isTeacher: false,
    isTrainer: false,
    isUser: false,
  ),
];

const List<Tab> teacherTabs = <Tab>[

  Tab(text: 'Group'),
];

List<Widget> teacherPages = <Widget>[
  const Group(
    isAdmin: false,
    isDoctor: false,
    isTeacher: true,
    isTrainer: false,
    isUser: false,
  ),
];

const List<Tab> trainerTabs = <Tab>[
  Tab(text: 'Group'),
];

List<Widget> trainerPages = <Widget>[

  const Group(
    isAdmin: false,
    isDoctor: false,
    isTeacher: false,
    isTrainer: true,
    isUser: false,
  ),
];

class _MessageHomeState extends State<MessageHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
     
      Group(
        isAdmin: true,
        isDoctor: false,
        isTeacher: false,
        isTrainer: false,
        isUser: false,
        email: widget.email,
      ),
    ];

    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: widget.isUser
          ? userTabs.length
          : widget.isDoctor
              ? doctorTabs.length
              : widget.isTeacher
                  ? teacherTabs.length
                  : widget.isTrainer
                      ? trainerTabs.length
                      : tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Colors.white, size: size.width * 0.05),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 99, 96, 96),
          title: Text(
            'Messages',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Lexend",
                fontSize: size.width * 0.05),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            splashBorderRadius: BorderRadius.circular(20),
            tabs: widget.isUser
                ? userTabs
                : widget.isDoctor
                    ? doctorTabs
                    : widget.isTeacher
                        ? teacherTabs
                        : widget.isTrainer
                            ? trainerTabs
                            : tabs,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: size.width * 0.044,
              fontFamily: "Lexend",
            ),
          ),
        ),
        body: TabBarView(
          children: widget.isUser
              ? userTabs.map((Tab tab) {
                  return Center(
                    child:
                        userPages.map((e) => e).toList()[userTabs.indexOf(tab)],
                  );
                }).toList()
              : widget.isDoctor
                  ? doctorTabs.map((Tab tab) {
                      return Center(
                        child: doctorPages
                            .map((e) => e)
                            .toList()[doctorTabs.indexOf(tab)],
                      );
                    }).toList()
                  : widget.isTeacher
                      ? teacherTabs.map((Tab tab) {
                          return Center(
                            child: teacherPages
                                .map((e) => e)
                                .toList()[teacherTabs.indexOf(tab)],
                          );
                        }).toList()
                      : widget.isTrainer
                          ? trainerTabs.map((Tab tab) {
                              return Center(
                                child: trainerPages
                                    .map((e) => e)
                                    .toList()[trainerTabs.indexOf(tab)],
                              );
                            }).toList()
                          : tabs.map((Tab tab) {
                              return Center(
                                child: pages
                                    .map((e) => e)
                                    .toList()[tabs.indexOf(tab)],
                              );
                            }).toList(),
        ),
      ),
    );
  }
}
