import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/event/view/pages/individualEventView.dart';
import 'package:swastha_aur_swabhimaan/widgets/customAppBar.dart';

class EventView extends StatefulWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  List<QueryDocumentSnapshot> events = [];

  @override
  void initState() {
    super.initState();
    getEventList();
  }

  getEventList() async {
    var ev = await FirebaseFirestore.instance.collection('events').get();
    setState(() {
      events = ev.docs;
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
          title: 'All Events',
        ),
      ),
      body: events.isEmpty
          ? Center(child: Image.asset('Assets/images/noEvent.png'))
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: Text(
                        events[index]['eventName'],
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lexend',
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      // some text and then ....
                      subtitle: Text(
                        events[index]['eventDesc'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'LexendLight',
                          fontSize: size.width * 0.04,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: size.width * 0.05,
                      ),
                      onTap: () {
                        nextScreen(
                          context,
                          IndividualEventView(
                            eventName: events[index]['eventName'],
                            eventDate: events[index]['eventStartDate'],
                            eventDescription: events[index]['eventDesc'],
                            village: events[index]['village'],
                            day: events[index]['day'],
                            tag: events[index]['tag'],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
