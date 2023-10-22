import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/components/prescriptionViewTileModel.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class PrescriptionView extends StatefulWidget {
  final String myName;
  const PrescriptionView({Key? key, required this.myName}) : super(key: key);

  @override
  State<PrescriptionView> createState() => _PrescriptionViewState();
}

class _PrescriptionViewState extends State<PrescriptionView> {
  List prescriptionList = [];
  @override
  void initState() {
    super.initState();
    getPrescriptions();
  }

  getPrescriptions() async {
    DatabaseService().gettingPrescription().then((value) {
      setState(() {
        prescriptionList = value.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: size.width * 0.05,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
        title: Text(
          'Prescriptions',
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.05,
            fontFamily: 'Lexend',
          ),
        ),
      ),
      body: prescriptionList.isEmpty
          ? Center(child: Image.asset('Assets/Logo/noPres.png'))
          : Container(
              padding: EdgeInsets.only(
                  top: size.width * 0.05,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              child: ListView.builder(
                  itemCount: prescriptionList.length,
                  itemBuilder: (context, index) {
                    return PrescriptionViewTileModel(
                        myName: widget.myName,
                        receiverId: prescriptionList[index]['userId'],
                        description: prescriptionList[index]['description'],
                        name: prescriptionList[index]['name']);
                  }),
            ),
    );
  }

  convertTimeStampToString(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }
}
