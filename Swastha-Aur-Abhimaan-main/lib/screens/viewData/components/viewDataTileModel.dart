import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/viewData/components/individualViewPage.dart';
import 'package:swastha_aur_swabhimaan/screens/viewData/components/noDataWidget.dart';

class ViewDataTileModel extends StatelessWidget {
  final String name;
  final String block;
  final String id;
  const ViewDataTileModel(
      {Key? key, required this.name, required this.block, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return name == ""
        ? const NoDataWidget()
        : Container(
            alignment: Alignment.centerLeft,
            height: size.height * 0.07,
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.01),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size.width * 0.02),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: size.width * 0.01,
                      offset: Offset(0, size.height * 0.005))
                ]),
            padding: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              top: size.height * 0.005,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: size.width * 0.05,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        nextScreen(
                            context,
                            IndividualViewPage(
                              name: name,
                              block: block,
                              id: id,
                            ));
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        size: size.width * 0.06,
                        color: const Color.fromARGB(255, 157, 135, 149),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        confirmationPopUp(context);
                      },
                      icon: Icon(
                        Icons.delete,
                        size: size.width * 0.06,
                        color: const Color.fromARGB(255, 157, 135, 149),
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }

  deleteSurveyData() async {
    await FirebaseFirestore.instance
        .collection('quiz')
        .where('id', isEqualTo: id)
        .get()
        .then((value) => value.docs.forEach((element) {
              element.reference.delete();
            }));
    Fluttertoast.showToast(
        msg: 'Deleted Successfully',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16.0,
        gravity: ToastGravity.BOTTOM);
  }

  confirmationPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are you sure you want to delete this survey?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    deleteSurveyData();
                    Navigator.pop(context);
                  },
                  child: const Text('Yes')),
            ],
          );
        });
  }
}
