import 'package:cloud_firestore/cloud_firestore.dart';

class MedicinesModel {
  MedicinesModel(
      { this.days,
         this.time1,
         this.time2,
         this.time3,
         this.debut,
         this.fin,
         this.name
      });
  String? days;
   String? time1;
   String? time2;
   String? time3;
    String? debut;
   String? fin;
   String? name;
   String? dose;
   String? type;


  void getDays(){
    for(int i=0;i<days!.length;i=i+3 ){
      medicinesDays.add(days!.substring(i,i+3));
    }
  }
 MedicinesModel.fromMap(DocumentSnapshot data){

    debut=data['debut'];
    days=data['days'];
     time1=data['time1'];
     time2=data['time2'];
     time3=data['time3'];
     fin=data['fin'];
     name=data['name'];
     dose=data['dose'];
     type=data['type'];
     getDays();
     medicinesTimes=[time1,time2,time3];

  }
  List<String> medicinesDays=[];
  List<String?> medicinesTimes=[];



}
