import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String adminLoggedInKey = "ADMINLOGGEDINKEY";
  static String doctorLoggedInKey = "DOCTORLOGGEDINKEY";
  static String trainerLoggedInKey = "TRAINERLOGGEDINKEY";
  static String teacherLoggedInKey = "TEACHERLOGGEDINKEY";
  static String usernameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  // saving the data in shared preferences
  static Future<bool> savedUserLoggedInStatus(bool isUserloggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserloggedIn);
  }

  static Future<bool> savedAdminLoggedInStatus(bool isAdminloggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(adminLoggedInKey, isAdminloggedIn);
  }

  static Future<bool> savedDoctorLoggedInStatus(bool isDoctorloggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(doctorLoggedInKey, isDoctorloggedIn);
  }

  static Future<bool> savedTrainerLoggedInStatus(bool isTrainerloggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(trainerLoggedInKey, isTrainerloggedIn);
  }

  static Future<bool> savedTeacherLoggedInStatus(bool isTeacherloggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(teacherLoggedInKey, isTeacherloggedIn);
  }

  static Future<bool> savedUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(usernameKey, userName);
  }

  static Future<bool> savedUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }
  // getting the data from shared preferences

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<bool?> getAdminLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(adminLoggedInKey);
  }

  static Future<bool?> getDoctorLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(doctorLoggedInKey);
  }

  static Future<bool?> getTrainerLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(trainerLoggedInKey);
  }

  static Future<bool?> getTeacherLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(teacherLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNamefromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(usernameKey);
  }
}
