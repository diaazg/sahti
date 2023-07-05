import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:sa7ti/Screens/navBar.dart';
import 'package:sa7ti/Services/AuthController.dart';

class InfoPage extends StatefulWidget {
  const InfoPage(
      {super.key,
      required this.email,
      required this.username,
      required this.password});
  final String? password;
  final String? email;
  final String? username;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late String? password = widget.password;
  late String? email = widget.email;
  late String? username = widget.username;
  String? weight;
  String? height;
  String? commune;
  String? wilaya;
  String? country;
  String? fullname;
  String? dateOfBirth;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child: Center(child: Icon(Icons.navigate_before)),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  ),
                  Text(
                    'register/page_info/choose_pic'.tr,
                    style: Kconstants.fontMain.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                      color: Color(0xFFE5E8F2),
                      borderRadius: BorderRadius.circular(300)),
                  child: Center(
                    child: Image.asset(
                      "images/profile/1.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              Text(
                email!,
                style: Kconstants.fontMain
                    .copyWith(color: Colors.black54, fontSize: 20),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Center(
                  child: Form(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'register/page_info/full_name'.tr,
                    style: Kconstants.fontMain
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: TextFormField(
                          style: Kconstants.fontMain
                              .copyWith(color: Colors.black, fontSize: 20),
                          onChanged: (val) {
                            fullname=val;
                          },
                          validator: (val) =>
                              val!.isEmpty ? 'register/page_info/warning/name'.tr : null,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintStyle: Kconstants.fontMain
                                  .copyWith(color: Colors.black, fontSize: 20),
                              hintText: 'register/page_info/warning/name'.tr,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'register/page_info/date_of_birth'.tr,
                    style: Kconstants.fontMain
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: TextFormField(
                          style: Kconstants.fontMain
                              .copyWith(color: Colors.black, fontSize: 20),
                          onChanged: (val) {
                            dateOfBirth=val;
                          },
                          validator: (val) =>
                              val!.isEmpty ? 'register/page_info/warning/date_of_birth'.tr : null,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintStyle: Kconstants.fontMain
                                  .copyWith(color: Colors.black, fontSize: 20),
                              hintText: 'register/page_info/warning/date_of_birth'.tr,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'register/page_info/weight'.tr,
                            style: Kconstants.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            height: size.height * 0.07,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.black, fontSize: 20),
                                onChanged: (val) {
                                  weight=val;
                                },
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter weight' : null,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintStyle: Kconstants.fontMain.copyWith(
                                        color: Colors.black, fontSize: 20),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'register/page_info/height'.tr,
                            style: Kconstants.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            height: size.height * 0.07,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.black, fontSize: 20),
                                onChanged: (val) {
                                  height=val;
                                },
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter an email' : null,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintStyle: Kconstants.fontMain.copyWith(
                                        color: Colors.black, fontSize: 20),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'register/page_info/Country'.tr,
                            style: Kconstants.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: size.height * 0.07,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.black, fontSize: 20),
                                onChanged: (val) {
                                  country=val;
                                },
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter an email' : null,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintStyle: Kconstants.fontMain.copyWith(
                                        color: Colors.black, fontSize: 20),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "City",
                            style: Kconstants.fontMain.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: size.height * 0.07,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.black, fontSize: 20),
                                onChanged: (val) {
                                  wilaya=val;
                                },
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter an email' : null,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintStyle: Kconstants.fontMain.copyWith(
                                        color: Colors.black, fontSize: 20),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Town",
                            style: Kconstants.fontMain
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: size.height * 0.07,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.black, fontSize: 20),
                                onChanged: (val) {
                                  commune=val;
                                },
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter an email' : null,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintStyle: Kconstants.fontMain.copyWith(
                                        color: Colors.black, fontSize: 20),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ))),
              SizedBox(
                height: size.height * 0.02,
              ),
              AppoButton(
                  size: size,
                  title: 'register/page_info/save'.tr,
                  color: Color(0xFF496CCE),
                  fontColor: Colors.white,
                  buttonFunc: () {
                    AuthController.instance.Register(email!.toString().trim(), password, username,
                        dateOfBirth, weight, height, country, wilaya, commune,fullname);
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
