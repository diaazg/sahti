import 'package:flutter/material.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:sa7ti/Screens/Profiles/maladProfile.dart';
import 'package:sa7ti/Screens/malad/MedicalHis.dart';
import 'package:sa7ti/Screens/Profiles/myQr.dart';
import 'package:sa7ti/Services/AuthController.dart';
import 'package:sa7ti/Services/StoreController.dart';
import 'package:get/get.dart';


class listOfProfile extends StatefulWidget {
  const listOfProfile({Key? key}) : super(key: key);

  @override
  State<listOfProfile> createState() => _listOfProfileState();
}

class _listOfProfileState extends State<listOfProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
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
                  SizedBox(width: size.width*0.2,),
                  Text(
                    'profile/my_profile'.tr,
                    style: Kconstants.fontMain.copyWith(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: size.width*0.2,)

                ],
              ),
              SizedBox(height: size.height*0.02,),
              Center(
                child: GetX<HomeController>(init: Get.put<HomeController>(HomeController()),builder:(HomeController homeController){
                  return Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Color(0xFF6694F6),
                            borderRadius: BorderRadius.circular(300)
                        ),
                        child: Center(child: CircleAvatar(
                          radius: 100,
                          backgroundImage: homeController.userInfo.img=='null'?null:NetworkImage('${homeController.userInfo.img}'),
                        ),),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Text("${homeController.userInfo.username}",style: Kconstants.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.w900),)
                    ],
                  );
                } ),
              ),
              SizedBox(height: size.height*0.04,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>maladProfile()));
                },
                child: Container(
                  width: size.width*0.9,
                  height: size.height*0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Image.asset("images/profile/icons/1.png"),
                        SizedBox(width: size.width*0.1,),
                        Text('profile/my_profile'.tr,style: Kconstants.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicalHis()));
                },
                child: Container(
                  width: size.width*0.9,
                  height: size.height*0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Image.asset("images/profile/icons/2.png"),
                        SizedBox(width: size.width*0.1,),
                        Text('profile/medical_history'.tr,style: Kconstants.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02,),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: size.width*0.9,
                  height: size.height*0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Image.asset("images/profile/icons/3.png"),
                        SizedBox(width: size.width*0.1,),
                        Text('profile/setting'.tr,style: Kconstants.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02,),
              GestureDetector(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MyQr(Id: AuthController.instance.uid,)));
                },
                child: Container(
                  width: size.width*0.9,
                  height: size.height*0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                       Icon(Icons.qr_code_2,color: Kconstants.blueBackground,),
                        SizedBox(width: size.width*0.1,),
                        Text("Qr code",style: Kconstants.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02,),
              GestureDetector(
                onTap: (){
                  AuthController.instance.logOut();
                },
                child: Container(
                  width: size.width*0.9,
                  height: size.height*0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Icon(Icons.login_outlined,color:Color(0xFF6694F6) ,),
                        SizedBox(width: size.width*0.1,),
                        Text('profile/log_out'.tr,style: Kconstants.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              ),

              




            ],
          ),
        ),
      ),
    ));
  }
}
