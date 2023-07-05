import 'package:flutter/material.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Services/StoreController.dart';
import 'package:sa7ti/Models/MedicinesModel.dart';
import 'package:intl/intl.dart';
import 'package:sa7ti/Screens/malad/AddMedicin.dart';

class medicineRminder extends StatefulWidget {
  const medicineRminder({Key? key}) : super(key: key);

  @override
  State<medicineRminder> createState() => _medicineRminderState();
}

class _medicineRminderState extends State<medicineRminder> {
  @override

  int chooseNbr = 2;
  List<String>days=["sat","sun","mon","thi","wed","tue","fri"];
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF6694F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            color: Color(0xFF6BA4D9),
                            child: Center(
                                child: Icon(
                              Icons.navigate_before,
                              color: Colors.white,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          child: GetX<HomeController>(
                            init: Get.put<HomeController>(HomeController()),
                            builder: (HomeController homeController){
                              return Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Center(
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE5E8F2),
                                          borderRadius: BorderRadius.circular(300)),
                                      child: Center(
                                        child: CircleAvatar(
                                          radius: 100,
                                          backgroundImage: homeController.userInfo.img=='null'?null:NetworkImage('${homeController.userInfo.img}'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello ",
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "${homeController.userInfo.username}",
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Create \n new schedule",
                              style: Kconstants.fontMain.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMedicin()));
                              },
                              child: Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "Start",
                                    style: Kconstants.fontMain.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      "images/appointement/8.png",
                      height: 150,
                      width: 150,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chooseNbr = 1;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.14,
                          child: Column(
                            children: [
                              Text(
                                "Sat",
                                style: Kconstants.fontMain
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: chooseNbr == 1
                                        ? Color(0xFF6694F6)
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chooseNbr = 2;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.14,
                          child: Column(
                            children: [
                              Text(
                                "Sun",
                                style: Kconstants.fontMain
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: chooseNbr == 2
                                        ? Color(0xFF6694F6)
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chooseNbr = 3;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.14,
                          child: Column(
                            children: [
                              Text(
                                "Mon",
                                style: Kconstants.fontMain
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: chooseNbr == 3
                                        ? Color(0xFF6694F6)
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chooseNbr = 4;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.14,
                          child: Column(
                            children: [
                              Text(
                                "Thi",
                                style: Kconstants.fontMain
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: chooseNbr == 4
                                        ? Color(0xFF6694F6)
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chooseNbr = 5;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.14,
                          child: Column(
                            children: [
                              Text(
                                "Wed",
                                style: Kconstants.fontMain
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: chooseNbr == 5
                                        ? Color(0xFF6694F6)
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chooseNbr = 6;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.14,
                          child: Column(
                            children: [
                              Text(
                                "Tue",
                                style: Kconstants.fontMain
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: chooseNbr == 6
                                        ? Color(0xFF6694F6)
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            chooseNbr = 7;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.14,
                          child: Column(
                            children: [
                              Text(
                                "Fri",
                                style: Kconstants.fontMain
                                    .copyWith(color: Colors.black),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: chooseNbr == 7
                                        ? Color(0xFF6694F6)
                                        : Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  GetX(init: Get.put<HomeController>(HomeController()),builder: (HomeController homeController){
                    return Container(
                      height: size.height*0.3,
                      width: size.width,
                      child: ListView.builder( scrollDirection: Axis.vertical,itemCount: homeController.userMed.length,itemBuilder: (BuildContext context, int index){
                        String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
                        DateTime dt1 = DateTime.parse("$currentDate 00:00:00");
                        DateTime dt2 = DateTime.parse("${homeController.userMed[index].fin} 00:00:00");

                        return ((dt1.isBefore(dt2) || dt1.isAtSameMomentAs(dt2)) && (homeController.userMed[index].medicinesDays.contains(days[chooseNbr-1])) )?medicineCard(size: size, name:homeController.userMed[index].name , time: homeController.userMed[index].medicinesTimes, dose: homeController.userMed[index].dose,type:homeController.userMed[index].type ,):null;

                      }),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class medicineCard extends StatelessWidget {
  const medicineCard({
    super.key,
    required this.size,
    required this.name,
    required this.time,
    required this.dose,
    required this.type
  });
  final String? name;
  final String? type;
  final List<String?> time;
  final String? dose;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "images/medicines/$type.png",
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name!,
                        style: Kconstants.fontMain.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 20,),
                      Text("$dose")
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                time[0].toString()!='null'? Text(time[0].toString(),style: Kconstants.fontMain.copyWith(color: Colors.black),):Text(""),
                time[1].toString()!='null'? Text(time[1].toString(),style: Kconstants.fontMain.copyWith(color: Colors.black),):Text(""),
                time[2].toString()!='null'? Text(time[2].toString(),style: Kconstants.fontMain.copyWith(color: Colors.black),):Text(""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
