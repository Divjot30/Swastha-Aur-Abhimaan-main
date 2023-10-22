import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/components/otoChatPage.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/view/components/fullPagePrescriptionView.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/view/components/medicalDetailsPage.dart';

class PrescriptionOptionsPanel extends StatelessWidget {
  final String receiverId;
  final String name;
  final String myName;
  const PrescriptionOptionsPanel(
      {Key? key,
      required this.receiverId,
      required this.name,
      required this.myName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      height: size.height * 0.18,
      decoration: const BoxDecoration(
          color: Color(0xFF252525),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_back_ios, color: Color(0xFF252525)),
          SizedBox(
            width: size.width * 0.1,
            child: const Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
              GestureDetector(
                onTap: () {
                  nextScreen(
                      context,
                      MedicalDetailsPage(
                        name: name,
                        id: receiverId,
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'Assets/Logo/medDetails.png',
                      width: size.width * 0.1,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Medical Details',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontFamily: 'Lexend',
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.1,
                height: size.height * 0.05,
                child: VerticalDivider(
                  color: Colors.white.withOpacity(0.7),
                  thickness: 1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  nextScreen(
                      context,
                      FullPagePrescriptionView(
                        name: name,
                        id: receiverId,
                      ));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'Assets/Logo/viewPres.png',
                      width: size.width * 0.1,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'View Prescription',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontFamily: 'Lexend',
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
