import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swastha_aur_swabhimaan/constants/constant.dart';
import 'package:swastha_aur_swabhimaan/screens/Login/common/login.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Admin/adminHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/Doctor/doctorHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/User/userHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/teacher/teacherHome.dart';
import 'package:swastha_aur_swabhimaan/screens/home/trainer/trainerHome.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/services/notificationServices.dart';

void main() async {
  // await NotificationController.initializeLocalNotifications();
  await NotificationService.initializeNotification();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool user = false;
  bool admin = false;
  bool doctor = false;
  bool trainer = false;
  bool teacher = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
    getAdminLoggedInStatus();
    getDoctorLoggedInStatus();
    getTrainerLoggedInStatus();
    getTeacherLoggedInStatus();
    NotificationService.initializeNotification();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          user = value;
        });
      }
    });
  }

  getAdminLoggedInStatus() async {
    await HelperFunctions.getAdminLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          admin = value;
        });
      }
    });
  }

  getDoctorLoggedInStatus() async {
    await HelperFunctions.getDoctorLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          doctor = value;
        });
      }
    });
  }

  getTrainerLoggedInStatus() async {
    await HelperFunctions.getTrainerLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          trainer = value;
        });
      }
    });
  }

  getTeacherLoggedInStatus() async {
    await HelperFunctions.getTeacherLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          teacher = value;
        });
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MyApp.navigatorKey,
      routes: {
        '/userHome': (context) => const UserHome(),
        '/adminHome': (context) => const AdminHome(),
      },
      title: 'Swastha Aur Swabhimaan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user
          ? const UserHome()
          : admin
              ? const AdminHome()
              : doctor
                  ? const DoctorHome()
                  : trainer
                      ? const TrainerHome()
                      : teacher
                          ? const TeacherHome()
                          : const Login(),
    );
  }
}
