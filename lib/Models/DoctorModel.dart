import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel{
  String? name;
  String? specialite;
  String? wilaya;
  String? commune;
  String? id;
  DoctorModel({this.name,this.specialite,this.wilaya,this.commune,this.id});
  DoctorModel.fromMap(DocumentSnapshot data){
    name=data['name'];
    specialite=data['specialite'];
    wilaya=data['wilaya'];
    commune=data['commune'];
    id=data['id'];
  }
}