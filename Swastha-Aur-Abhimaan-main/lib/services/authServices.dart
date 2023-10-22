// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:swastha_aur_swabhimaan/helper/helperFunctions.dart';
import 'package:swastha_aur_swabhimaan/services/databaseServices.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // login
  Future login(String email, String password) async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future register(String email, String fullName, String doctorType,
      String gender, String password) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      await DatabaseService(uid: user.uid)
          .savingDoctorData(fullName, email, gender, doctorType);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future userRegister(String email, String fullName, String village,
      String password, String gender) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      await DatabaseService()
          .savingUserData(fullName, email, village, gender);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future adminRegister(
      String email, String fullName, String password, String gender) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      await DatabaseService().savingAdminData(fullName, email, gender);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future trainerRegister(
      String fullName, String email, String password, String gender) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      await DatabaseService().savingTrainerData(fullName, email, gender);
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future teacherRegister(String fullName, String email, String gender,
      String subject, String password) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      await DatabaseService()
          .savingTeacherData(fullName, email, gender, subject);

      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut(String who) async {
    try {
      who == 'User'
          ? HelperFunctions.savedUserLoggedInStatus(false)
          : who == 'Admin'
              ? HelperFunctions.savedAdminLoggedInStatus(false)
              : who == 'Doctor'
                  ? HelperFunctions.savedDoctorLoggedInStatus(false)
                  : who == 'Trainer'
                      ? HelperFunctions.savedTrainerLoggedInStatus(false)
                      : HelperFunctions.savedTeacherLoggedInStatus(false);

      await HelperFunctions.savedUserEmailSF("");
      await HelperFunctions.savedUserNameSF("");
      await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
