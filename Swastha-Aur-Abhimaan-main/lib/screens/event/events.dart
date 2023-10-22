import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/event/view/components/addGalleryPage.dart';
import 'package:swastha_aur_swabhimaan/screens/event/view/pages/eventView.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';
import 'package:swastha_aur_swabhimaan/widgets/widgets.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescController = TextEditingController();

  String eventName = "";
  String eventDesc = "";
  String village = "";
  String eventStartDate = "";
  String day = "";
  String tag = "";
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22.0),
        backgroundColor: const Color.fromARGB(255, 157, 135, 149),
        visible: true,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.remove_red_eye, color: Colors.white),
            backgroundColor: const Color.fromARGB(255, 157, 135, 149),
            label: 'View Events',
            labelStyle: const TextStyle(fontSize: 18.0, fontFamily: 'Lexend'),
            onTap: () {
              nextScreen(context, const EventView());
            },
          ),
        ],
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CustomAppBar(
            barColor: Color.fromARGB(255, 157, 135, 149),
            title: 'Events',
            tiColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: eventNameController,
                decoration: CustumInputDecoration.getDecoration(
                    'Event Name',
                    'Enter Event Name',
                    Icons.event,
                    const Color.fromARGB(255, 157, 135, 149),
                    size.width * 0.045),
                onChanged: (value) {
                  setState(() {
                    eventName = value;
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                controller: eventDescController,
                minLines: 1,
                maxLines: 5,
                decoration: CustumInputDecoration.getDecoration(
                    'Event Description',
                    'Enter Event Description',
                    Icons.description,
                    const Color.fromARGB(255, 157, 135, 149),
                    size.width * 0.045),
                onChanged: (value) {
                  eventDesc = value;
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: TextFormField(
                  controller: startDateController,
                  decoration: CustumInputDecoration.getDecoration(
                      'Event Date',
                      'Select Event Date',
                      Icons.date_range,
                      const Color.fromARGB(255, 157, 135, 149),
                      size.width * 0.045),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);

                      setState(() {
                        day = DateFormat('EEEE').format(pickedDate);
                        startDateController.text = formattedDate;
                        eventStartDate = startDateController.text;
                      });
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please Select Date",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                controller: villageController,
                decoration: CustumInputDecoration.getDecoration(
                    'Village',
                    'Enter Village Name',
                    Icons.location_on,
                    const Color.fromARGB(255, 157, 135, 149),
                    size.width * 0.045),
                onChanged: (value) {
                  setState(() {
                    village = value;
                  });
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              DropdownButtonFormField(
                  icon: const Icon(Icons.arrow_drop_down_outlined,
                      color: Color.fromARGB(255, 157, 135, 149)),
                  borderRadius: BorderRadius.circular(17),
                  itemHeight: 50,
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Lexend",
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Mark Event Tag",
                    hintStyle: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Lexend",
                        color: const Color.fromARGB(255, 157, 135, 149)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 157, 135, 149), width: 1),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 157, 135, 149), width: 1),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: "Education", child: Text("Education")),
                    DropdownMenuItem(value: "Health", child: Text("Health")),
                    DropdownMenuItem(value: "Skill", child: Text("Skill")),
                    DropdownMenuItem(value: "Others", child: Text("Others")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      tag = value.toString();
                    });
                  }),
              SizedBox(
                height: size.height * 0.3,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      add();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 157, 135, 149),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: size.width * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  add() {
    DatabaseService()
        .addEvent(
      eventName,
      eventDesc,
      eventStartDate,
      village,
      tag,
      day,
    )
        .then((value) {
      Fluttertoast.showToast(
          msg: "Event Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      startDateController.clear();
      villageController.clear();
      eventNameController.clear();
      eventDescController.clear();
      nextScreen(
          context,
          AddGalleryPage(
            eventName: eventName,
            eventDate: eventStartDate,
          ));
    });
  }
}
