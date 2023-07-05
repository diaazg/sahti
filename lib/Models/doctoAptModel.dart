import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorAptModel{

  int? today;
  int? tomorrow;
  String? id;
  int? hour;
  int? minute;

  DoctorAptModel({
    this.today,
    this.tomorrow,
    this.id,
    this.hour,
    this.minute
});

  DoctorAptModel.fromMap(DocumentSnapshot data){
    today=data['today'];
    tomorrow=data['tomorrow'];
    id=data['id'];
    hour=data['hour'];
    minute=data['minute'];

  }
}