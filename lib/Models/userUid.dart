import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Useruid {
  final String? uid;
  Useruid({required this.uid});
}

class UserIn {
   String? email,
      username,
      dateOfBirth,
      weight,
      height,
      country,
      wilaya,
      commune,
   fullName,
   img;

  UserIn(
      {this.email,
      this.username,
        this.fullName,
      this.dateOfBirth,
      this.weight,
      this.height,
      this.country,
      this.wilaya,
      this.commune,
        this.img
      });
  UserIn.fromMap(DocumentSnapshot data){

        email=data["email"];
        username=data["username"];
        fullName=data["fullname"];
        dateOfBirth=data["dateOfbirth"];
        weight=data["weight"];
        height=data["height"];
        country=data["country"];
        wilaya=data["wilaya"];
        commune=data["commune"];
        img=data["img"];

  }
}
