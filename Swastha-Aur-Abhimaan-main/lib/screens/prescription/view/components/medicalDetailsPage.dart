import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/viewData/components/detailsDropDownModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/widgets/widgets.dart';

class MedicalDetailsPage extends StatefulWidget {
  final String name;
  final String id;

  const MedicalDetailsPage({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  State<MedicalDetailsPage> createState() => _MedicalDetailsPageState();
}

class _MedicalDetailsPageState extends State<MedicalDetailsPage> {
  String? aadhar;
  QuerySnapshot? surveyData;

  @override
  void initState() {
    super.initState();
    getQizDetails();
  }

  addSpaceToStringAfterFourletters(String s) {
    String str = s;
    String newStr = "";
    for (int i = 0; i < str.length; i++) {
      if (i % 4 == 0 && i != 0) {
        newStr = "$newStr ${str[i]}";
      } else {
        newStr = newStr + str[i];
      }
    }
    return newStr;
  }

  getQizDetails() async {
    await DatabaseService().gettingQuizDataUsingUID(widget.id).then((value) {
      setState(() {
        surveyData = value;
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
            barColor: Colors.white,
            title: 'Medical Details',
            tiColor: Colors.black,
          )),
      body: SingleChildScrollView(
        child: surveyData!.docs.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: size.height * 0.2),
                child: Column(children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: size.width * 0.07,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset('Assets/Logo/noU.png'),
                  Text(
                    'has not filled the form yet!!!',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: size.width * 0.07,
                      color: Colors.black,
                    ),
                  ),
                ]),
              )
            : Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    top: size.height * 0.05,
                    bottom: size.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: size.width * 0.07,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: size.width * 0.05,
                              color: Colors.black,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                      endIndent: size.width * 0.3,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    basicText('Gender: ',
                        surveyData!.docs[0]['Gender'].toString(), context),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    basicText(
                        'Village: ', surveyData!.docs[0]['village'], context),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    basicText(
                        'Date of Birth: ', surveyData!.docs[0]['dob'], context),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: basicText('Medical Details', "", context),
                      iconColor: Colors.black,
                      children: [
                        Table(
                          border: TableBorder.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          children: [
                            TableRow(
                              children: [
                                const LeftText(title: 'Anxiety Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['anxiety']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Depression Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['depression']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Diabetes Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['diabetes']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Eye Disorder Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['eyeDisorder']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Heart Disease Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['heartDisease']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'High Blood Pressure Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['highBP']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'High Cholestrol Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['highCholestrol']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Joint Pain Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['jointPain']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Memory Enhancement Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['memoryEnhancer']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Parkinsonism Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['parkinson']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Heart Attack Prevention Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['preventHeartAttack']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Sleeping Pills'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['sleeppills']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Thyroid Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['thyroid']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: basicText('Other Details', "", context),
                      iconColor: Colors.black,
                      children: [
                        Table(
                          border: TableBorder.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          children: [
                            TableRow(
                              children: [
                                const LeftText(title: 'Veg/Non-Veg'),
                                RightText(
                                    title:
                                        surveyData!.docs[0]['veg'].toString())
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Covid Positive..?'),
                                RightText(
                                    title:
                                        surveyData!.docs[0]['covid'].toString())
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Vaccinated..?'),
                                RightText(
                                    title: surveyData!.docs[0]['vaccinated'])
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'Water Intake'),
                                RightText(
                                    title: surveyData!.docs[0]['waterTreat'])
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'High Blood Pressure Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['highBP']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                            TableRow(
                              children: [
                                const LeftText(title: 'High Cholestrol Meds'),
                                RightText(
                                    title: surveyData!.docs[0]['meds'][0]
                                                    ['highCholestrol']
                                                .toString() ==
                                            'true'
                                        ? 'Yes'
                                        : 'No')
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
