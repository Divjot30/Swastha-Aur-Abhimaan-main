import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Profile/viewProfile/viewProfile.dart';
import 'package:swastha_aur_swabhimaan/widgets/actionPanel.dart';

// ignore: must_be_immutable
class DoctorListModel extends StatelessWidget {
  String name;
  String job;
  String id;
  String adminName;
  String collectionName;
  String fieldName;
  DoctorListModel(
      {Key? key,
      required this.adminName,
      required this.name,
      required this.job,
      required this.id,
      required this.collectionName,
      required this.fieldName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromARGB(255, 157, 135, 149),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          title: Text(
            capitaliseString(name),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Lexend",
                fontSize: size.width * 0.05),
          ),
          subtitle: Text(
            capitaliseString(job),
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w500,
                fontFamily: "Lexend",
                fontSize: size.width * 0.04),
          ),
          trailing: IconButton(
            onPressed: () {
              // showModalBottomSheet(
              //   context: context,
              //   builder: (context) => ActionsPanel(
              //       adminName: adminName,
              //       name: name,
              //       id: id,
              //       collectionName: collectionName,
              //       fieldName: fieldName),
              //   shape: const RoundedRectangleBorder(
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(40),
              //     ),
              //   ),
              //   enableDrag: true,
              // );
              nextScreen(
                  context,
                  ViewProfile(
                    adminName: adminName,
                    id: id,
                    collectionName: collectionName,
                    fieldName: fieldName,
                  ));
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: const Color.fromARGB(255, 157, 135, 149),
            ),
          ),
        ),
      ),
    );
  }
}
