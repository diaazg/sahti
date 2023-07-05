import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Kconstants.dart';

class AppointResponse extends StatefulWidget {
  const AppointResponse({super.key, required this.day,required this.mounth,required this.hour,required this.min}) ;
  final int min;
  final int hour;
  final int day;
  final String mounth;

  @override
  State<AppointResponse> createState() => _AppointResponseState();
}

class _AppointResponseState extends State<AppointResponse> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEAEBEC),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.38,
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
                  Center(
                      child: Column(
                    children: [
                      Image.asset(
                        "images/appointement/done.png",
                        height: 200,
                        width: size.width,
                      ),
                      Text(
                        'appointment/apt_response/congratulations'.tr,
                        style:
                            Kconstants.fontMain.copyWith(color: Colors.black),
                      ),
                      Text(
                        'appointment/apt_response/sub_congratulations'.tr,
                        style: Kconstants.fontMain
                            .copyWith(color: Colors.black54, fontSize: 14),
                      ),
                    ],
                  )),
                ],
              ),
            ),
        Container(
          height:size.height*0.15,
          width: size.width,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            color: Color(0xFFD9D9D9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(

                children: [
                  Container(
                    height:size.height*0.18*0.6,
                    width: size.width*0.26,
                    decoration: BoxDecoration(
                        color: Color(0xFF6694F6),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      child: Center(
                        child: Image.asset(
                          "images/appointement/2.png",
                          height:size.height*0.18*0.7,
                          width: size.width*0.3*0.9,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width*0.04,),
                  Container(
                    height:size.height*0.18*0.4,
                    width: size.width*0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dr Ghchichat Zakaria",style: Kconstants.fontMain.copyWith(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("Cardiologist",style: Kconstants.fontMain.copyWith(color: Colors.black38,fontSize: 15),)
                      ],
                    ),
                  )
                ],
              ),
            )
            ),
          ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              height: size.height*0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DateCard(size: size,icon: Icons.calendar_month,info1: widget.day.toString(),info2: widget.mounth,),
                  DateCard(size: size,icon: Icons.watch_later_outlined,info1: "${widget.hour}:${widget.min}",info2: "AM",),

                ],
              ),
            ),
           AppoButton(size: size,color: Color(0xFF496CCE),title: 'appointment/apt_response/viewButton'.tr,buttonFunc: (){},fontColor: Colors.white,),
            SizedBox(height: size.height*0.02,),
            AppoButton(size: size,color: Color(0xFFD9D9D9),title: 'appointment/apt_response/cancel'.tr,buttonFunc: (){},fontColor: Colors.black,)

        ],
        ),
      ),
    ));
  }
}
