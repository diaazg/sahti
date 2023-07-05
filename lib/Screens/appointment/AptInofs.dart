import 'package:flutter/material.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Services/StoreController.dart';
import 'package:intl/intl.dart';
import 'package:sa7ti/Screens/appointment/appResponse.dart';

class aptInfos extends StatefulWidget {
  const aptInfos(
      {required this.docName,
      required this.id,
      required this.specialite,
      required this.wilaya,
      required this.commune,
      this.index});
  final String? docName;
  final String? specialite;
  final String? commune;
  final String? wilaya;
  final String? id;
  final int? index;

  @override
  State<aptInfos> createState() => _aptInfosState();
}

bool isToday = true;
bool isTomorrow = false;

class _aptInfosState extends State<aptInfos> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetX(
        init: Get.put<HomeController>(HomeController()),
        builder: (HomeController homeController) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: Color(0xFFEAEBEC),
            body: Column(
              children: [
                Container(
                  height: size.height * 0.58,
                  width: size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          color: Colors.white,
                          child: Center(child: Icon(Icons.navigate_before)),
                        ),
                      ),
                      Container(
                        height: size.height * 0.65 * 0.5,
                        width: size.width,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'appointment/make_apt/header'.tr,
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
                                "Dr ${widget.docName}",
                                style: Kconstants.fontMain.copyWith(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.specialite!,
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.black54, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Color(0xFF6694F6),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${widget.wilaya} - ${widget.commune} ",
                                  style: Kconstants.fontMain.copyWith(
                                      color: Colors.black54, fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.share_location_sharp,
                                  color: Color(0xFF6694F6),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "21.3891° N, 39.8579° E",
                                  style: Kconstants.fontMain.copyWith(
                                      color: Colors.black54, fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Color(0xFF6694F6),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  isToday
                                      ? "${'appointment/make_apt/countdown'.tr}  :  ${homeController.getterfixApt[widget.index!].today} "
                                      : "${'appointment/make_apt/countdown'.tr}  :  ${homeController.getterfixApt[widget.index!].tomorrow} ",
                                  style: Kconstants.fontMain.copyWith(
                                      color: Colors.black54, fontSize: 20),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: size.height * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isToday = true;
                                    isTomorrow = false;
                                  });
                                },
                                child: Container(
                                  height: isToday
                                      ? size.height * 0.20
                                      : size.height * 0.15,
                                  width: isToday
                                      ? size.width * 0.3076
                                      : size.width * 0.30,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEAEBEC),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'appointment/make_apt/today'.tr,
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${DateTime.now().day}",
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${DateFormat('MMMM').format(DateTime.now())}",
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isToday = false;
                                    isTomorrow = true;
                                  });
                                },
                                child: Container(
                                  height: isTomorrow
                                      ? size.height * 0.20
                                      : size.height * 0.15,
                                  width: isTomorrow
                                      ? size.width * 0.3076
                                      : size.width * 0.30,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEAEBEC),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'appointment/make_apt/tomorrow'.tr,
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${DateTime.now().add(Duration(days: 1)).day}",
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${DateFormat('MMMM').format(DateTime.now().add(Duration(days: 1)))}",
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: AppoButton(
                          size: size,
                          color: (((isToday) &&
                                      (homeController
                                              .getterfixApt[widget.index!]
                                              .today!) ==
                                          0) ||
                                  ((isTomorrow) &&
                                      (homeController
                                              .getterfixApt[widget.index!]
                                              .tomorrow!) ==
                                          0))
                              ? Colors.red
                              : Color(0xFF6694F6),
                          title: (((isToday) &&
                                      (homeController
                                              .getterfixApt[widget.index!]
                                              .today!) ==
                                          0) ||
                                  ((isTomorrow) &&
                                      (homeController
                                              .getterfixApt[widget.index!]
                                              .tomorrow!) ==
                                          0))
                              ? 'appointment/make_apt/sorry'.tr
                              : 'appointment/make_apt/confirm'.tr,
                          buttonFunc: () {
                            if (isToday) {
                              if ((homeController
                                      .getterfixApt[widget.index!].today!) >
                                  0) {
                                var date = DateTime(0, 0,0,homeController
                                    .getterfixApt[widget.index!].hour!,homeController
                                    .getterfixApt[widget.index!].minute!,0 );
                                int myHour=date.hour;
                                int myMin=date.minute;
                                String myDate="${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
                                date=date.add(const Duration(minutes: 20));


                                int x = homeController
                                        .getterfixApt[widget.index!].today! -
                                    1;
                                homeController.decrementCounter(
                                    widget.id!, 'today', x,date.hour,date.minute);
                                homeController.addPassiant(widget.id, myDate);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointResponse(day: DateTime.now().day, mounth: DateFormat('MMMM').format(DateTime.now()), hour: myHour, min: myMin)));
                              }
                            } else {
                              if ((homeController
                                      .getterfixApt[widget.index!].tomorrow!) >
                                  0) {
                                var date = DateTime(0, 0,0,homeController
                                    .getterfixApt[widget.index!].hour!,homeController
                                    .getterfixApt[widget.index!].minute!,0 );
                                int myHour=date.hour;
                                int myMin=date.minute;
                                String myDate="${DateTime.now().add(Duration(days: 1)).year}-${DateTime.now().add(Duration(days: 1)).month}-${DateTime.now().add(Duration(days: 1)).day}";
                                date=date.add(const Duration(minutes: 20));
                                int x = homeController
                                        .getterfixApt[widget.index!].tomorrow! -
                                    1;
                                homeController.decrementCounter(
                                    widget.id!, 'tomorrow', x,date.hour,date.minute);
                                homeController.addPassiant(widget.id, myDate);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointResponse(day: DateTime.now().add(Duration(days: 1)).day, mounth: DateFormat('MMMM').format(DateTime.now().add(Duration(days: 1))), hour: myHour, min: myMin)));
                              }
                            }
                          },
                          fontColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ));
        });
  }
}
