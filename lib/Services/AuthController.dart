import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sa7ti/Screens/LoginPages/LogIn.dart';
import 'package:sa7ti/Screens/navBar.dart';
import 'package:sa7ti/Screens/LoginPages/infoPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sa7ti/Models/userUid.dart';
import 'package:sa7ti/Screens/FirstPages/splashScreen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore storeInstance = FirebaseFirestore.instance;
  late CollectionReference maladiesCollection;
  late String uid;

  @override
  void onReady() {
    super.onReady();
    maladiesCollection = storeInstance.collection("Maladies");
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => SplashScreen());
    } else {
      uid = user.uid;
      Get.offAll(() => NavBar());
    }
  }

  void AddInfos(String email, password, username, dateOfBirth, weight, height,
      country, wilaya, commune,fullName,img, String? userid) async {
    try {
      await maladiesCollection.doc(uid).set({
        'img':img,
        'email': email,
        'password': password,
        'username': username,
        'fullname':fullName,
        'dateOfbirth': dateOfBirth,
        'weight': weight,
        'height': height,
        'country': country,
        'wilaya': wilaya,
        'commune': commune,
        'id': userid
      });
    } catch (e) {
      Get.snackbar("About user", "User message",
          titleText: Text("Registration failed"),
          messageText: Text(e.toString()));
    }
  }

  void Register(String email, password, username, dateOfBirth, weight, height,
      country, wilaya, commune,fullName) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      AddInfos(email, password, username, dateOfBirth, weight, height, country,
          wilaya, commune,fullName,"null", uid);
      Get.offAll(() => NavBar());
    } catch (e) {
      Get.snackbar("About user", "User message",
          titleText: Text("Registration failed"),
          messageText: Text(e.toString()));
    }
  }

  void Login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About user", "User message",
          titleText: Text("Registration failed"),
          messageText: Text(e.toString()));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
