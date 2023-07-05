import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Models/userUid.dart';
import 'AuthController.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sa7ti/Models/MedicinesModel.dart';
import 'package:sa7ti/Models/DoctorModel.dart';
import 'package:sa7ti/Models/doctoAptModel.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  FirebaseFirestore store = FirebaseFirestore.instance;
  late CollectionReference collection;
  late CollectionReference medicines;
  late CollectionReference doctors;
  late CollectionReference doctorsApts;
  late CollectionReference doctorsPassiante;
  late CollectionReference maladiesPassiant;


  Rx<UserIn> userInformation = Rx<UserIn>(UserIn(
    email: "",
    username: "",
    fullName: "",
    dateOfBirth: "",
    weight: "",
    height: "",
    country: "",
    wilaya: "",
    commune: "",
    img: "",
  ));
  Rx<List<MedicinesModel>> userMedicines = Rx<List<MedicinesModel>>([]);
  Rx<List<DoctorModel>> appDoctors=Rx<List<DoctorModel>>([]);
  Rx<List<DoctorAptModel>> fixApt=Rx<List<DoctorAptModel>>(
    []
  );

  //getters
  UserIn get userInfo => userInformation.value;
  List<MedicinesModel> get userMed => userMedicines.value;
  List<DoctorModel> get getterDoctors=>appDoctors.value;
  List<DoctorAptModel> get getterfixApt=>fixApt.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String uid = Get.find<AuthController>().uid;
    collection = store.collection("Maladies");
    medicines = store.collection("maladMedic");
    doctors=store.collection("doctors");
    doctorsApts=store.collection("doctorsAptm");
    doctorsPassiante=store.collection('doctorsPassant');
    maladiesPassiant=store.collection('maladiesPassant');


    //bind steams
    userInformation.bindStream(getUserInformations(uid));
    userMedicines.bindStream(getUserMedic());
    appDoctors.bindStream(getDoctors());
    fixApt.bindStream(getApt());
  }

  Stream<UserIn> getUserInformations(String uid) {
    return collection
        .doc(uid)
        .snapshots()
        .map((event) => UserIn.fromMap(event));
  }

  Stream<List<MedicinesModel>>  getUserMedic() {
    String uid = Get.find<AuthController>().uid;
    return medicines.doc(uid).collection('Medic').snapshots().map(
        (event) => event.docs.map((e) => MedicinesModel.fromMap(e)).toList());
  }

  Stream<List<DoctorModel>> getDoctors(){
    return doctors.snapshots().map((event) => event.docs.map((e) => DoctorModel.fromMap(e)).toList());
  }
  Stream<List<DoctorAptModel>> getApt(){
    return doctorsApts.snapshots().map((event) => event.docs.map((e) => DoctorAptModel.fromMap(e)).toList());
  }

  void updateImg(String img) async {
    try {
      String uid = Get.find<AuthController>().uid;
      await collection.doc(uid).update({'img': img});
    } catch (e) {
      print(e.toString());
      Get.snackbar("About user", "User message",
          titleText: Text("Update failed"), messageText: Text(e.toString()));
    }
  }

  void decrementCounter(String docId,day,int newCounter,newHour,newMinute) async {
    try {
      await doctorsApts.doc(docId).update({'$day': newCounter,
      'hour':newHour,
        'minute':newMinute
      });
    } catch (e) {
      print(e.toString());
      Get.snackbar("About user", "User message",
          titleText: Text("Update failed"), messageText: Text(e.toString()));
    }
  }


  void addMedicine(String? name,debut,fin,dose,time1,time2,time3,type,days)async{
    try {
      String uid = Get.find<AuthController>().uid;
      await medicines.doc(uid).collection('Medic').add({
        'name': name,
        'debut': debut,
        'fin': fin,
        'dose':dose,
        'time1': time1,
        'time2': time2,
        'time3': time3,
        'type': type,
        'days': days,
      });
      Get.snackbar("About user", "User message",
          titleText: const Text("Schedule done"),
          messageText: const Text("Done"));
    } catch (e) {
      print(e);
      Get.snackbar("About user", "User message",
          titleText: const Text("Schedule failed"),
          messageText: Text(e.toString()));
    }
  }

  void addPassiant(String? docId,date)async{
    try {
      String uid = Get.find<AuthController>().uid;
      await doctorsPassiante.doc(docId).collection('passiante').add({
        'maladId': uid,
        'date': date,
      });
      await maladiesPassiant.doc(uid).collection('myPass').add({
        'doctorId':docId,
        'date':date
      });
      
    } catch (e) {
      print(e);
      Get.snackbar("About user", "User message",
          titleText: const Text("Appointment done"),
          messageText: Text(e.toString()));
    }
  }
}
