import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/models/userListModel.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/components/searchedUsers.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';

class AllUsers extends StatefulWidget {
  final String name;
  const AllUsers({Key? key, required this.name}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  bool all = true;
  bool vikasnagar = false;
  bool doiwala = false;
  bool sahaspur = false;
  bool isSearchInitiated = false;

  TextEditingController searchController = TextEditingController();
  List users = [];
  List vikasnagarUsers = [];
  List doiwalaUsers = [];
  List sahaspurUsers = [];
  @override
  void initState() {
    super.initState();
    getUsers();
    getVikasnagarUsers();
    getDoiwalaUsers();
    getSahaspurrUsers();
  }

  getUsers() async {
    var userss = await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      users = userss.docs;
    });
  }

  getVikasnagarUsers() async {
    var users = await FirebaseFirestore.instance
        .collection('users')
        .where('village', isEqualTo: 'Vikasnagar')
        .get();
    setState(() {
      vikasnagarUsers = users.docs;
    });
  }

  getDoiwalaUsers() async {
    var users = await FirebaseFirestore.instance
        .collection('users')
        .where('village', isEqualTo: 'Doiwala')
        .get();
    setState(() {
      doiwalaUsers = users.docs;
    });
  }

  getSahaspurrUsers() async {
    var users = await FirebaseFirestore.instance
        .collection('users')
        .where('village', isEqualTo: 'Sahaspur')
        .get();
    setState(() {
      sahaspurUsers = users.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Users',
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
                  context,
                  SearchedUsers(
                    adminName: widget.name,
                  ));
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            all = !all;
                            vikasnagar = false;
                            doiwala = false;
                            sahaspur = false;
                          });
                        },
                        child: OptionBarModel(
                          click: all,
                          label: 'All',
                          borderColor: const Color.fromARGB(255, 157, 135, 149),
                          fillColor: const Color.fromARGB(255, 157, 135, 149)
                              .withOpacity(0.7),
                        )),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            all = false;
                            vikasnagar = !vikasnagar;
                            doiwala = false;
                            sahaspur = false;
                          });
                        },
                        child: OptionBarModel(
                          click: vikasnagar,
                          label: 'Vikasnagar',
                          borderColor: const Color.fromARGB(255, 157, 135, 149),
                          fillColor: const Color.fromARGB(255, 157, 135, 149)
                              .withOpacity(0.7),
                        )),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            all = false;
                            vikasnagar = false;
                            doiwala = !doiwala;
                            sahaspur = false;
                          });
                        },
                        child: OptionBarModel(
                          click: doiwala,
                          label: 'Doiwala',
                          borderColor: const Color.fromARGB(255, 157, 135, 149),
                          fillColor: const Color.fromARGB(255, 157, 135, 149)
                              .withOpacity(0.7),
                        )),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            all = false;
                            vikasnagar = false;
                            doiwala = false;
                            sahaspur = !sahaspur;
                          });
                        },
                        child: OptionBarModel(
                          click: sahaspur,
                          label: 'Sahaspur',
                          borderColor: const Color.fromARGB(255, 157, 135, 149),
                          fillColor: const Color.fromARGB(255, 157, 135, 149)
                              .withOpacity(0.7),
                        )),
                  ],
                ),
              ),
              all == true
                  ? users.isEmpty
                      ? Image.asset('Assets/images/noRegU.png')
                      : Expanded(
                          child: ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                return UserListModel(
                                  adminName: widget.name,
                                  name: users[index]['name'],
                                  village: users[index]['village'],
                                  id: users[index]['userId'],
                                );
                              }),
                        )
                  : vikasnagar == true
                      ? vikasnagarUsers.isEmpty
                          ? Image.asset('Assets/images/noRegU.png')
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: vikasnagarUsers.length,
                                  itemBuilder: (context, index) {
                                    return UserListModel(
                                      adminName: widget.name,
                                      name: vikasnagarUsers[index]['name'],
                                      village: vikasnagarUsers[index]
                                          ['village'],
                                      id: vikasnagarUsers[index]['userId'],
                                    );
                                  }),
                            )
                      : doiwala == true
                          ? doiwalaUsers.isEmpty
                              ? Image.asset('Assets/images/noRegU.png')
                              : Expanded(
                                  child: ListView.builder(
                                      itemCount: doiwalaUsers.length,
                                      itemBuilder: (context, index) {
                                        return UserListModel(
                                          adminName: widget.name,
                                          name: doiwalaUsers[index]['name'],
                                          village: doiwalaUsers[index]
                                              ['village'],
                                          id: doiwalaUsers[index]['userId'],
                                        );
                                      }),
                                )
                          : sahaspur == true
                              ? sahaspurUsers.isEmpty
                                  ? Image.asset('Assets/images/noRegU.png')
                                  : Expanded(
                                      child: ListView.builder(
                                          itemCount: sahaspurUsers.length,
                                          itemBuilder: (context, index) {
                                            return UserListModel(
                                              adminName: widget.name,
                                              name: sahaspurUsers[index]
                                                  ['name'],
                                              village: sahaspurUsers[index]
                                                  ['village'],
                                              id: sahaspurUsers[index]
                                                  ['userId'],
                                            );
                                          }),
                                    )
                              : Container()
            ],
          ),
        ),
      ),
    );
  }
}
