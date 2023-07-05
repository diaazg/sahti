import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sa7ti/Screens/appointment/AptInofs.dart';
import 'package:sa7ti/Screens/appointment/myApts.dart';
import 'package:sa7ti/Services/StoreController.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile(
      {required this.docName,
      required this.id,
      required this.specialite,
      required this.wilaya,
      required this.commune,
      required this.phoneNbr,
      required this.ind});
  final String? docName;
  final String? specialite;
  final String? commune;
  final String? wilaya;
  final String? id;
  final String? phoneNbr;
  final int? ind;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.65 * 0.5,
              width: size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Doctor profile",
                      style: Kconstants.fontMain.copyWith(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Color(0xFF6694F6),
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        child: Center(
                          child: Image.asset(
                            "images/appointement/3.png",
                            height: size.height * 0.2,
                            width: size.width * 0.4,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Dr $docName",
                      style: Kconstants.fontMain.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: size.height * 0.65,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Color(0xFF496CCE),
                      ),
                      Text(
                        "$wilaya - $commune",
                        style:
                            Kconstants.fontMain.copyWith(color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Specialite :   ",
                            style: Kconstants.fontMain.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            specialite!,
                            style: Kconstants.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        'doctorProfile/About'.tr,
                        style: Kconstants.fontMain.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                          "   He is a realy great doctor becouse he is so kind and he has a nice haire and he is FCB  and messi fan not only that but also he is from takhmaret ")
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'docotrProfile/workingTime'.tr,
                        style: Kconstants.fontMain.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        "Saturday ,Sunday 8:00 AM - 5:00 PM",
                        style: Kconstants.fontMain.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          String number = phoneNbr!; //set the number here
                          await FlutterPhoneDirectCaller.callNumber(
                              number.toString());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: size.height * 0.08,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Color(0xFF496CCE),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              Text(
                                phoneNbr!,
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => aptInfos(
                                        docName: docName,
                                        id: id,
                                        wilaya: wilaya,
                                        commune: commune,
                                        specialite: specialite,
                                        index: ind!,
                                      )));
                        },
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Color(0xFF496CCE),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'doctorProfile/bookApt'.tr,
                              style: Kconstants.fontMain.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
