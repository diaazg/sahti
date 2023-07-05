import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sa7ti/Screens/LoginPages/infoPage.dart';
import 'package:sa7ti/translations/translationDocument.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey=GlobalKey<FormState>();
  String email='';
  String password='';
  String password1='';
  String username='';
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
                child: Text("Be part of sa7ti ",style: GoogleFonts.pacifico(color: Colors.white,fontSize: 40),),
              ),
            ),
            Container(
              height: size.height*0.85,
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
                                    hintText: 'email',
                                    suffixIcon: Icon(Icons.mail_outline)

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:size.height*0.8*0.01 ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            width: size.width*0.9,
                            decoration: BoxDecoration(color: Color(0xFFD9D9D9),borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                onChanged: (val){
                                  setState(() {
                                    username=val;
                                  });
                                },
                                validator: (val)=>val!.isEmpty?'Enter username':null,
                                style: Kconstants.fontMain.copyWith(color: Colors.black),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    suffixIconColor: Colors.black54,
                                    focusColor: Colors.black54,
                                    fillColor: Colors.black54,
                                    border: InputBorder.none,
                                    hintText: 'register/username'.tr,
                                    suffixIcon: Icon(Icons.person_2_outlined)

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:size.height*0.8*0.01 ),
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
                                validator: (val)=>(val!.isEmpty || password!=password1)?'Enter your password':null,
                                style: Kconstants.fontMain.copyWith(color: Colors.black),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    suffixIconColor: Colors.black54,
                                    focusColor: Colors.black54,
                                    fillColor: Colors.black54,
                                    border: InputBorder.none,
                                    hintText: 'login/hint_password'.tr,
                                    suffixIcon: Icon(Icons.password)

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:size.height*0.8*0.01 ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            width: size.width*0.9,
                            decoration: BoxDecoration(color: Color(0xFFD9D9D9),borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: TextFormField(
                                onChanged: (val){
                                  setState(() {
                                    password1=val;
                                  });
                                },
                                validator: (val)=>(val!.isEmpty || password!=password1)?'check the password':null,
                                style: Kconstants.fontMain.copyWith(color: Colors.black),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    suffixIconColor: Colors.black54,
                                    focusColor: Colors.black54,
                                    fillColor: Colors.black54,
                                    border: InputBorder.none,
                                    hintText: 'register/validate'.tr,
                                    suffixIcon: Icon(Icons.password)

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:size.height*0.8*0.08 ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              width: size.width*0.35,
                              decoration: BoxDecoration(color: Color(0xFF6694F6),borderRadius: BorderRadius.circular(25)),
                              child: TextButton(onPressed: ()async{
                                if(_formkey.currentState!.validate()){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoPage(password: password,email: email,username: username,)));
                                }

                              }, child: Text('login/Log_in'.tr,style: Kconstants.fontMain.copyWith(color: Colors.white,fontWeight: FontWeight.w900))),
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
