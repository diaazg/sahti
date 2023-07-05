import 'package:flutter/material.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Services/StoreController.dart';

class MyQr extends StatelessWidget {
  const MyQr({Key? key,required this.Id}) : super(key: key);
  final String Id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF6694F6),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/appointement/back.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
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
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Center(
                                child: Container(
                                  height: 100,
                                  width: 100,
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
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GetX<HomeController>(
                                    init: Get.put<HomeController>(HomeController()),
                                    builder:(HomeController homeController){
                                      return Text(
                                        "${homeController.userInfo.username}",
                                        style: Kconstants.fontMain.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                      );
                                    }
                                  ),
                                  Text(
                                    "This is your own Qr \n"
                                        "keep it safe !",
                                    style: Kconstants.fontMain.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.65,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFFF2F7FC),
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
                  child: Center(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Scan Qr code",
                            style: Kconstants.fontMain.copyWith(
                                color: Color(0xFF6694F6),
                                fontWeight: FontWeight.w900),
                          ),
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            height: size.height * 0.65 * 0.6,
                            width: size.width * 0.7,
                            decoration: BoxDecoration(
                                color: Color(0xFF6BA4D9),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: QrImage(
                                data: Id,
                                size: 280,
                                // You can include embeddedImageStyle Property if you
                                //wanna embed an image from your Asset folder
                                embeddedImageStyle: QrEmbeddedImageStyle(
                                  size: const Size(
                                    100,
                                    100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Use  the computer cam to scan the patients ‘ s Qr \n code and get  the access to his medical history",
                              style: Kconstants.fontMain.copyWith(color: Colors.black54,fontSize: 12),),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

