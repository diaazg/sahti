import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:sa7ti/Services/StoreController.dart';
import 'package:sa7ti/Services/AuthController.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class maladProfile extends StatefulWidget {
  const maladProfile({Key? key}) : super(key: key);

  @override
  State<maladProfile> createState() => _maladProfileState();
}

class _maladProfileState extends State<maladProfile> {
  String? img;
  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 400,
        maxWidth: 400,
        imageQuality: 75);
    Reference ref =
    FirebaseStorage.instance.ref('profile/').child(AuthController.instance.uid);
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        if (value.isNotEmpty) {
          img = value;
          HomeController.instance.updateImg(value);
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetX<HomeController>(
        init: Get.put<HomeController>(HomeController()),
        builder: (HomeController homeController) {
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
                          "My profile",
                          style: Kconstants.fontMain.copyWith(
                              color: Colors.black,
                              fontSize: 30,
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
                      child: GestureDetector(
                        onTap: ()async{
                          final image = await ImagePicker().pickImage(
                              source: ImageSource.gallery,
                              maxHeight: 400,
                              maxWidth: 400,
                              imageQuality: 75);
                          Reference ref =
                          FirebaseStorage.instance.ref('profile/').child(AuthController.instance.uid);
                          await ref.putFile(File(image!.path));
                          ref.getDownloadURL().then((value) {
                            print("$value gggggggggggggggggggggggggggggggg");
                            setState(() {
                              if (value.isNotEmpty) {
                                img = value;
                                homeController.updateImg(value.toString());
                              }
                            });
                          });

                        },
                        child: Container(
                          height: 125,
                          width: 125,
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
                    ),
                    Text(
                      "${homeController.userInfo.username}",
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
                          "Full name",
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
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Center(
                              child: Container(
                                height: size.height * 0.07,
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2),
                                  child: Center(
                                    child: Text(
                                      "${homeController.userInfo.fullName}",
                                      style: Kconstants.fontMain.copyWith(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Date of birth",
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
                              child: Text(
                                "${homeController.userInfo.dateOfBirth}",
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.black, fontSize: 20),
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
                                  "Weight",
                                  style: Kconstants.fontMain.copyWith(
                                      color: Colors.black, fontSize: 15),
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
                                    child: Text("${homeController.userInfo.weight}",style: Kconstants.fontMain.copyWith(color: Colors.black,fontSize: 20,)),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Height",
                                  style: Kconstants.fontMain.copyWith(
                                      color: Colors.black, fontSize: 15),
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
                                    child: Text("${homeController.userInfo.height}",style: Kconstants.fontMain.copyWith(color: Colors.black,fontSize: 20,)),
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
                                  "Country",
                                  style: Kconstants.fontMain.copyWith(
                                      color: Colors.black, fontSize: 15),
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
                                    child: Text("${homeController.userInfo.country}",style:Kconstants.fontMain.copyWith(
                                        color: Colors.black, fontSize: 20)),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "wilaya",
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
                                    child: Text("${homeController.userInfo.wilaya}",style:Kconstants.fontMain.copyWith(
                                        color: Colors.black, fontSize: 20)),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "commun",
                                  style: Kconstants.fontMain.copyWith(
                                      color: Colors.black, fontSize: 15),
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
                                    child: Text("${homeController.userInfo.commune}",style:Kconstants.fontMain.copyWith(
                                        color: Colors.black, fontSize: 20)),
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
                        title: "Save",
                        color: Color(0xFF496CCE),
                        fontColor: Colors.white,
                        buttonFunc: () {})
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
