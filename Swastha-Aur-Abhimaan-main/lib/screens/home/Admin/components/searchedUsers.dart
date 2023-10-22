import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/models/userListModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class SearchedUsers extends StatefulWidget {
  final String adminName;
 const  SearchedUsers({Key? key, required this.adminName}) : super(key: key);

  @override
  State<SearchedUsers> createState() => _SearchedUsersState();
}

class _SearchedUsersState extends State<SearchedUsers> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  QuerySnapshot? userSnapshot;
  bool hasUserSearched = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: size.height * 0.05),
        padding: EdgeInsets.only(
            left: size.height * 0.02, right: size.height * 0.02),
        height: size.height,
        child: Column(
          children: [
            Row(
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                      height: size.height * 0.07,
                      padding: EdgeInsets.only(
                          left: size.width * 0.05, right: size.width * 0.05),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 157, 135, 149),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.65,
                            child: TextField(
                              controller: searchController,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: size.width * 0.05),
                              decoration: InputDecoration(
                                hintText: 'Enter Full Name',
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
                              searchUser();
                            },
                            icon: Icon(
                              Icons.search,
                              size: size.width * 0.06,
                              color: Colors.white,
                            ),
                            hoverColor: const Color.fromARGB(255, 157, 135, 149)
                                .withOpacity(0.5),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            isLoading == true
                ? const CircularProgressIndicator()
                : hasUserSearched == true
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: userSnapshot!.docs.length,
                            itemBuilder: (context, index) {
                              return UserListModel(
                                adminName: widget.adminName,
                                name: userSnapshot!.docs[index].get('name'),
                                village:
                                    userSnapshot!.docs[index].get('village'),
                                id: userSnapshot!.docs[index].get('userId'),
                              );
                            }),
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: Center(
                            child: Text(
                          'No User Found\nTry removing spaces \nor\n try again later',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 157, 135, 149),
                              fontFamily: 'Lexend',
                              fontSize: size.width * 0.06),
                        )),
                      ),
          ],
        ),
      ),
    );
  }

  searchUser() async {
    setState(() {
      isLoading = true;
    });
    await DatabaseService()
        .searchUserByName(removeSpaces(searchController.text))
        .then((snapshot) {
      setState(() {
        userSnapshot = snapshot;
        isLoading = false;
        hasUserSearched = true;
      });
    });
  }

  removeSpaces(String text) {
    return text.trim();
  }
}
