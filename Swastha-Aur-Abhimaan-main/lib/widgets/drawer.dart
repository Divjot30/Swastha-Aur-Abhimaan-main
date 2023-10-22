import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Login/common/login.dart';
import 'package:swastha_aur_swabhimaan/screens/event/view/pages/eventView.dart';
import 'package:swastha_aur_swabhimaan/screens/messaging/messageHome.dart';
import 'package:swastha_aur_swabhimaan/screens/prescription/view/prescriptionView.dart';
import 'package:swastha_aur_swabhimaan/services/authServices.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDrawer extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  final Widget child;
  final String name;
  final String email;
  final String gender;
  final String who;
  final bool isUser;
  final bool isDoctor;
  final bool isTeacher;
  final bool isTrainer;
  MenuDrawer({
    super.key,
    required this.who,
    required this.name,
    required this.email,
    required this.child,
    required this.isUser,
    required this.gender,
    required this.isDoctor,
    required this.isTeacher,
    required this.isTrainer,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      //backgroundColor: Color.fromARGB(255, 0, 174, 255),
      width: size.width * 0.5,

      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: gender == 'Male' || gender == 'male'
                    ? const Color(0xFF32afdd)
                    : const Color(0xFFF149D6)),
            accountName: generalText(
              (capitaliseString(name)),
            ),
            accountEmail: generalText(email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: gender == 'Male' || gender == 'male'
                  ? const AssetImage('Assets/Logo/maleIcon.png')
                  : const AssetImage('Assets/Logo/femaleIcon.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: gender == 'Male' || gender == 'male'
                  ? const Color(0xFF32afdd).withOpacity(0.5)
                  : const Color(0xFFF149D6).withOpacity(0.5),
              leading: const Icon(Icons.home_outlined),
              title: generalText('Home'),
              onTap: () {
                // Navigator.pushNamed(context, '/home');
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message_rounded),
            title: generalText('Messages'),
            onTap: () {
              nextScreen(
                  context,
                  MessageHome(
                    isDoctor: isDoctor,
                    isTeacher: isTeacher,
                    isTrainer: isTrainer,
                    isUser: isUser,
                    email: email,
                  ));
            },
          ),
          Visibility(
            visible: isUser == true,
            child: ListTile(
              leading: const Icon(Icons.event_note_sharp),
              title: generalText('Events'),
              onTap: () {
                nextScreen(context, const EventView());
              },
            ),
          ),
          Visibility(
            visible: who == 'Admin' || who == 'admin',
            child: ListTile(
              leading: const Icon(Icons.healing),
              title: generalText('Prescriptions'),
              onTap: () {
                nextScreen(
                    context,
                    PrescriptionView(
                      myName: name,
                    ));
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_sharp),
            title: generalText('Profile'),
            onTap: () {
              nextScreen(context, child);
            },
          ),
          Visibility(
            visible: isTeacher || !isUser,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.green.withOpacity(0.5),
                leading: Image.asset(
                  'Assets/Logo/gmeet.png',
                  width: 30,
                ),
                title: generalText('Google Meet'),
                onTap: () {
                  openGoogleMeetApp();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: Colors.red.withOpacity(0.5),
              leading: const Icon(Icons.logout_rounded),
              title: generalText('Logout'),
              onTap: () {
                logout(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  logout(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            backgroundColor: const Color.fromARGB(255, 157, 135, 149),
            title: const Text("Logout"),
            content: const Text("Are you sure you want to logout?"),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'Assets/Logo/noD.png',
                    width: 30,
                  )),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () async {
                    await _auth.signOut(who);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const Login()),
                        (route) => false);
                  },
                  child: Image.asset(
                    'Assets/Logo/yes.png',
                    width: 30,
                  )),
            ],
          );
        });
  }

  void openGoogleMeetApp() async {
    const meetAppURL = 'https://meet.google.com/';
    if (await canLaunchUrl(Uri.parse(meetAppURL))) {
      await launchUrl(Uri.parse(meetAppURL),
          mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $meetAppURL';
    }
  }

  generalText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontFamily: 'Lexend', fontSize: 14),
    );
  }
}
