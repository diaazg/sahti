import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:sa7ti/Screens/LoginPages/RegisterPage.dart';
import 'package:sa7ti/Screens/navBar.dart';
import 'package:sa7ti/Services/AuthController.dart';
import 'package:sa7ti/translations/translationDocument.dart';


class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final _formkey=GlobalKey<FormState>();
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Kconstants.blueBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height*0.2,
              width: size.width,
               child:  Center(
                 child: Text('login/welcome'.tr,style: GoogleFonts.pacifico(color: Colors.white,fontSize: 40),),
               ),
            ),
            Container(
              height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Image.asset("images/logIn/1blue.png"),
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height:size.height*0.8*0.1 ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            width: size.width*0.9,
                            decoration: BoxDecoration(color: Color(0xFFD9D9D9),borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                onChanged: (val){
                                  setState(() {
                                    email=val;
                                  });
                                },
                                validator: (val)=>val!.isEmpty?'Enter an email':null,
                                style: Kconstants.fontMain.copyWith(color: Colors.black),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  suffixIconColor: Colors.black54,
                                  focusColor: Colors.black54,
                                  fillColor: Colors.black54,
                                  border: InputBorder.none,
                                  hintText: 'email,phone',
                                 suffixIcon: Icon(Icons.person_2_outlined)

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:size.height*0.8*0.1 ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            width: size.width*0.9,
                            decoration: BoxDecoration(color: Color(0xFFD9D9D9),borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                onChanged: (val){
                                  setState(() {
                                    password=val;
                                  });
                                },
                                validator: (val)=>val!.isEmpty?'Enter your password':null,
                                style: Kconstants.fontMain.copyWith(color: Colors.black),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    suffixIconColor: Colors.black54,
                                    focusColor: Colors.black54,
                                    fillColor: Colors.black54,
                                    border: InputBorder.none,
                                    hintText: 'login/hint_password'.tr,
                                    suffixIcon: Icon(Icons.remove_red_eye)

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:size.height*0.8*0.01 ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Remember me ",style: Kconstants.fontMain.copyWith(color: Colors.black,fontSize: 15),),
                                Text("Forget password? ",style: Kconstants.fontMain.copyWith(color: Colors.redAccent,fontSize: 15),),
                              ],
                            ),
                          ),
                          SizedBox(height:size.height*0.8*0.08 ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  width: size.width*0.35,
                                  decoration: BoxDecoration(color: Color(0xFF6694F6),borderRadius: BorderRadius.circular(25)),
                                  child: TextButton(onPressed: ()async{
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));

                                  }, child: Text('login/sign_up'.tr,style: Kconstants.fontMain.copyWith(color: Colors.white,fontWeight: FontWeight.w900))),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  width: size.width*0.3,
                                  decoration: BoxDecoration(color: Color(0xFF6694F6),borderRadius: BorderRadius.circular(25)),
                                  child: TextButton(onPressed: ()async{
                                    if(_formkey.currentState!.validate()){
                                      AuthController.instance.Login(email.toString().trim(), password.toString().trim());
                                    }

                                  }, child: Text('login/Log_in'.tr,style: Kconstants.fontMain.copyWith(color: Colors.white,fontWeight: FontWeight.w900))),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
