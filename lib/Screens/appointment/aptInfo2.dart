import 'package:flutter/material.dart';
import 'package:sa7ti/Kconstants.dart';

class aptInfoTwo extends StatefulWidget {
  const aptInfoTwo({Key? key}) : super(key: key);

  @override
  State<aptInfoTwo> createState() => _aptInfoTwoState();
}

class _aptInfoTwoState extends State<aptInfoTwo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  onTap: () {},
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
                          "Appointement",
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
                          "Dr Ghchichat Zakaria",
                          style: Kconstants.fontMain.copyWith(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Cardiologist",
                          style: Kconstants.fontMain
                              .copyWith(color: Colors.black54, fontSize: 15),
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
                            "Tiaret-TakhmaretAl akid si el haoues ",
                            style: Kconstants.fontMain
                                .copyWith(color: Colors.black54, fontSize: 20),
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
                            style: Kconstants.fontMain
                                .copyWith(color: Colors.black54, fontSize: 20),
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
                            "Countdown  :  12 ",
                            style: Kconstants.fontMain
                                .copyWith(color: Colors.black54, fontSize: 20),
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
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )),
            child: Column(

              children: [
                Text("Available places ",style: Kconstants.fontMain.copyWith(color: Colors.black),),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: size.height * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DateCard(
                          size: size,
                          info3: "Today",
                          info1: "27",
                          info2: "May",
                        ),
                        DateCard(
                          size: size,
                          info3: "Tomorrow",
                          info1: "8:00",
                          info2: "AM",
                        ),
                      ],
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppoButton(
                        size: size,
                        color: Color(0xFF6694F6),
                        title: "confirme apoitment",
                        buttonFunc: () {},
                        fontColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}

class DateCard extends StatelessWidget {
  const DateCard(
      {super.key,
      required this.size,
      required this.info3,
      required this.info1,
      required this.info2});

  final Size size;
  final String info3;
  final String info1;
  final String info2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.3076,
      decoration: BoxDecoration(
          color: Color(0xFFEAEBEC), borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            info3,
            style: Kconstants.fontMain
                .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            info1,
            style: Kconstants.fontMain
                .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            info2,
            style: Kconstants.fontMain
                .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
