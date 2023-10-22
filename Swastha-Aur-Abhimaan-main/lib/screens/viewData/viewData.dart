import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/suggestions/components/optionBarModel.dart';
import 'package:swastha_aur_swabhimaan/screens/viewData/components/noDataWidget.dart';
import 'package:swastha_aur_swabhimaan/screens/viewData/components/viewDataTileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  QuerySnapshot? surveyData;
  QuerySnapshot? vikasnagarData;
  QuerySnapshot? sahaspurData;
  QuerySnapshot? doiwalaData;
  bool vikasnagar = false;
  bool sahaspur = false;
  bool doiwala = true;
  bool all = true;

  @override
  void initState() {
    super.initState();
    getSurveyData();
    getVikasNagarData();
    getDoiwalaData();
    getSahaspurData();
  }

  getSurveyData() async {
    await DatabaseService().gettingQuizData().then((value) {
      setState(() {
        surveyData = value;
      });
    });
  }

  getVikasNagarData() async {
    await FirebaseFirestore.instance
        .collection('quiz')
        .where('village', isEqualTo: 'Vikasnagar')
        .get()
        .then((value) {
      setState(() {
        vikasnagarData = value;
      });
    });
  }

  getDoiwalaData() async {
    await FirebaseFirestore.instance
        .collection('quiz')
        .where('village', isEqualTo: 'Doiwala')
        .get()
        .then((value) {
      setState(() {
        doiwalaData = value;
      });
    });
  }

  getSahaspurData() async {
    await FirebaseFirestore.instance
        .collection('quiz')
        .where('village', isEqualTo: 'Sahaspur')
        .get()
        .then((value) {
      setState(() {
        sahaspurData = value;
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
                barColor: Color.fromARGB(255, 157, 135, 149),
                tiColor: Colors.white,
                title: 'View Survey Data')),
        body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
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
                          all = !all;
                          doiwala = false;
                          sahaspur = false;
                          vikasnagar = false;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromARGB(255, 157, 135, 149),
                        fillColor: const Color.fromARGB(255, 157, 135, 149)
                            .withOpacity(0.7),
                        click: all,
                        label: 'All',
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          all = false;
                          doiwala = !doiwala;
                          sahaspur = false;
                          vikasnagar = false;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromARGB(255, 157, 135, 149),
                        fillColor: const Color.fromARGB(255, 157, 135, 149)
                            .withOpacity(0.7),
                        click: doiwala,
                        label: 'Doiwala',
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          all = false;
                          doiwala = false;
                          sahaspur = !sahaspur;
                          vikasnagar = false;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromARGB(255, 157, 135, 149),
                        fillColor: const Color.fromARGB(255, 157, 135, 149)
                            .withOpacity(0.7),
                        click: sahaspur,
                        label: 'Sahaspur',
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          all = false;
                          doiwala = false;
                          sahaspur = false;
                          vikasnagar = !vikasnagar;
                        });
                      },
                      child: OptionBarModel(
                        borderColor: const Color.fromARGB(255, 157, 135, 149),
                        fillColor: const Color.fromARGB(255, 157, 135, 149)
                            .withOpacity(0.7),
                        click: vikasnagar,
                        label: 'Vikasnagar',
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                  ],
                ),
              ),
              surveyData!.docs.isEmpty
                  ? const Center(
                      child: NoDataWidget(),
                    )
                  : vikasnagar
                      ? vikasnagarData!.docs.isEmpty
                          ? const Center(
                              child: NoDataWidget(),
                            )
                          : Container(
                              height: size.height * 0.8,
                              margin: EdgeInsets.only(top: size.height * 0.02),
                              child: ListView.builder(
                                  itemCount: vikasnagarData!.docs.length,
                                  itemBuilder: (context, index) {
                                    return ViewDataTileModel(
                                      name: vikasnagarData!.docs[index]
                                          ['fullName'],
                                      block: vikasnagarData!.docs[index]
                                          ['block'],
                                      id: vikasnagarData!.docs[index]['id'],
                                    );
                                  }),
                            )
                      : sahaspur
                          ? sahaspurData!.docs.isEmpty
                              ? const Center(
                                  child: NoDataWidget(),
                                )
                              : Container(
                                  height: size.height * 0.8,
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.02),
                                  child: ListView.builder(
                                      itemCount: sahaspurData!.docs.length,
                                      itemBuilder: (context, index) {
                                        return ViewDataTileModel(
                                          name: sahaspurData!.docs[index]
                                              ['fullName'],
                                          block: sahaspurData!.docs[index]
                                              ['block'],
                                          id: sahaspurData!.docs[index]['id'],
                                        );
                                      }),
                                )
                          : doiwala
                              ? doiwalaData!.docs.isEmpty
                                  ? const Center(
                                      child: NoDataWidget(),
                                    )
                                  : Container(
                                      height: size.height * 0.8,
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.02),
                                      child: ListView.builder(
                                          itemCount: doiwalaData!.docs.length,
                                          itemBuilder: (context, index) {
                                            return ViewDataTileModel(
                                              name: doiwalaData!.docs[index]
                                                  ['fullName'],
                                              block: doiwalaData!.docs[index]
                                                  ['block'],
                                              id: doiwalaData!.docs[index]
                                                  ['id'],
                                            );
                                          }),
                                    )
                              : all
                                  ? surveyData!.docs.isEmpty
                                      ? const Center(
                                          child: NoDataWidget(),
                                        )
                                      : Container(
                                          height: size.height * 0.8,
                                          margin: EdgeInsets.only(
                                              top: size.height * 0.02),
                                          child: ListView.builder(
                                              itemCount:
                                                  surveyData!.docs.length,
                                              itemBuilder: (context, index) {
                                                return ViewDataTileModel(
                                                  name: surveyData!.docs[index]
                                                      ['fullName'],
                                                  block: surveyData!.docs[index]
                                                      ['block'],
                                                  id: surveyData!.docs[index]
                                                      ['id'],
                                                );
                                              }),
                                        )
                                  : const Center(
                                      child: NoDataWidget(),
                                    ),
            ],
          ),
        ));
  }
}
