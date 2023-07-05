import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kconstants{
 static final fontMain= GoogleFonts.poppins(
  color: Colors.white54, fontSize: 20,fontWeight: FontWeight.w300);
 static final Color blueBackground=Color(0xFF6694F6);
 static final Color tealBackground=Color(0xff088f8f);
}


class AppoButton extends StatelessWidget {
 const AppoButton({
  super.key,
  required this.size,
  required this.title,
  required this.color,
  required this.fontColor,
  required this.buttonFunc
 });

 final Size size;
 final Function()? buttonFunc;
 final String title;
 final Color color;
 final Color fontColor;

 @override
 Widget build(BuildContext context) {
  return GestureDetector(
   onTap: buttonFunc,
   child:  Container(
    height: size.height*0.08,
    width: size.width*0.9,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Center(
     child: Text(title,style: Kconstants.fontMain.copyWith(color: fontColor),),
    ),


   ),
  );
 }
}

class DateCard extends StatelessWidget {
 const DateCard({
  super.key,
  required this.size,
  required this.icon,
  required this.info1,
  required this.info2
 });

 final Size size;
 final IconData icon;
 final String info1;
 final String info2;

 @override
 Widget build(BuildContext context) {
  return Container(
   height: size.height*0.2,
   width: size.width*0.3076,
   decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(20)
   ),
   child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
     Icon(icon,color: Color(0xFF6694F6),),
     Text(info1,style: Kconstants.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.w600 ),),
     Text(info2,style: Kconstants.fontMain.copyWith(color: Colors.black,fontWeight: FontWeight.w300 ),)
    ],
   ),
  );
 }
}

