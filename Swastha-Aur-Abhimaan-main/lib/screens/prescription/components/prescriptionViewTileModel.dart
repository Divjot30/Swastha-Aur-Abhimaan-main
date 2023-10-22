import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/components/prescriptionOptionsPanel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class PrescriptionViewTileModel extends StatelessWidget {
  final String name;
  final String description;
  final String receiverId;
  final String myName;
  const PrescriptionViewTileModel(
      {Key? key,
      required this.description,
      required this.myName,
      required this.receiverId,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(
            msg: 'Long press to delete',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black.withOpacity(0.7),
            textColor: Colors.white,
            fontSize: size.width * 0.04);
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return deletePopUp(context);
            });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color.fromARGB(255, 157, 135, 149),
              child: Image.asset('Assets/images/maleU.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  capitaliseString(name),
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontFamily: 'Lexend',
                    color: Colors.black,
                  ),
                ),
                Text(
                  decorateDescription(description),
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontFamily: 'Lexend',
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    enableDrag: true,
                    context: context,
                    builder: ((context) {
                      return PrescriptionOptionsPanel(
                        receiverId: receiverId,
                        myName: myName,
                        name: name,
                      );
                    }),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: size.width * 0.05,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }

  decorateDescription(String s) {
    if (s.length > 20) {
      return "${s.substring(0, 20)}...";
    } else {
      return s;
    }
  }

  deletePopUp(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        'Delete Prescription',
        style: TextStyle(
          fontSize: size.width * 0.05,
          fontFamily: 'Lexend',
          color: Colors.black.withOpacity(0.7),
        ),
      ),
      content: Text('Are you sure you want to delete this prescription?',
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontFamily: 'Lexend',
            color: Colors.black.withOpacity(0.7),
          )),
      actions: [
        TextButton(
            onPressed: () {
              DatabaseService()
                  .deletePrescription(receiverId, name)
                  .whenComplete(() {
                Navigator.pop(context);
              });
            },
            child: Text('Yes',
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  fontFamily: 'Lexend',
                  color: Colors.green,
                ))),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No',
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  fontFamily: 'Lexend',
                  color: Colors.red[400],
                ))),
      ],
    );
  }
}
