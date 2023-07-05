import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:sa7ti/Services/StoreController.dart';
import 'package:sa7ti/Services/AuthController.dart';
import 'package:searchfield/searchfield.dart';


class AddMedicin extends StatefulWidget {
  const AddMedicin({Key? key}) : super(key: key);

  @override
  State<AddMedicin> createState() => _AddMedicinState();
}
final _formkey=GlobalKey<FormState>();
String? medicineName;
String? debut;
String? fin;
String? time1;
String? time2;
String? time3;
String? type;
String? dose;
List<String> days=[];
String jours="";
List<String> types=["capsuls","botle","syringe"];
bool satSelected=false;
bool sunSelected=false;
bool monSelected=false;
bool thiSelected=false;
bool wedSelected=false;
bool tueSelected=false;
bool friSelected=false;
String sat="";
String sun="";
String mon="";
String thi="";
String wed="";
String tue="";
String fri="";

class _AddMedicinState extends State<AddMedicin> {
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
                        "Enter the schedule",
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
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Center(
                      child: Form(
                        key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Medicine name",
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
                                        medicineName=val;
                                      },
                                      validator: (val) =>
                                      val!.isEmpty ? 'Enter a name' : null,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          hintStyle: Kconstants.fontMain
                                              .copyWith(color: Colors.black, fontSize: 20),
                                          hintText: 'medicine name',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                "Start date",
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
                                      keyboardType: TextInputType.datetime,
                                      style: Kconstants.fontMain
                                          .copyWith(color: Colors.black, fontSize: 20),
                                      onChanged: (val) {
                                        debut=val;
                                      },
                                      validator: (val) =>
                                      val!.isEmpty ? 'Enter your start date' : null,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          hintStyle: Kconstants.fontMain
                                              .copyWith(color: Colors.black, fontSize: 20),
                                          hintText: 'start date',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Text(
                                "fin date",
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
                                      keyboardType: TextInputType.datetime,
                                      style: Kconstants.fontMain
                                          .copyWith(color: Colors.black, fontSize: 20),
                                      onChanged: (val) {
                                        fin=val;
                                      },
                                      validator: (val) =>
                                      val!.isEmpty ? 'Enter your fin date' : null,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          hintStyle: Kconstants.fontMain
                                              .copyWith(color: Colors.black, fontSize: 20),
                                          hintText: 'fin date',
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
                                        "dose",
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
                                              dose=val;
                                            },
                                            validator: (val) =>
                                            val!.isEmpty ? 'Enter dose' : null,
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
                                        "type",
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
                                          child: SearchField(
                                            suggestions: types
                                                .map((e) => SearchFieldListItem(e,
                                                child: Container(
                                                  margin: EdgeInsets.all(10),
                                                  child: Text(e),
                                                )))
                                                .toList(),
                                            suggestionState: Suggestion.expand,
                                            hint: 'type',
                                            searchStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black.withOpacity(0.8),
                                            ),
                                            validator: (x) =>
                                            x!.isEmpty ? 'Please enter the medicine type' : null,
                                            searchInputDecoration: InputDecoration(

                                                prefixIcon: Icon(Icons.search,color: Kconstants.blueBackground,),
                                                border: InputBorder.none,
                                                focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)),
                                                hoverColor: Colors.black,
                                                fillColor: Colors.black,
                                                focusColor: Colors.black,
                                                isCollapsed: false
                                            ),
                                            maxSuggestionsInViewPort: 2,
                                            itemHeight: 50,
                                            onSubmit: (x) {
                                              setState(() {
                                               type=x;
                                              });
                                            },
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
                                        "Dose 1",
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
                                              time1=val;
                                            },
                                            validator: (val) =>
                                            val!.isEmpty ? 'Enter the 1st dose' : null,
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
                                        "Dose 2",
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
                                              time2=val;
                                            },
                                            validator: (val) =>
                                            val!.isEmpty ? 'Enter 2nd dose' : null,
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
                                        "Dose 3",
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
                                              time3=val;
                                            },
                                            validator: (val) =>
                                            val!.isEmpty ? 'Enter the 3rd dose' : null,
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(!satSelected){

                            setState(() {
                              sat="sat";
                              satSelected=true;
                            });
                          }else{

                            setState(() {
                              sat="";
                              satSelected=false;
                            });
                          }
                        },
                        child: Container(
                          color: satSelected
                              ? Color(0xFF6694F6)
                              : Colors.white,
                          height: 40,
                          width: size.width * 0.12,
                          child: Center(
                            child: Text(
                              "Sat",
                              style: Kconstants.fontMain
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(!sunSelected){
                            sun="sun";
                            setState(() {
                              sunSelected=true;
                            });
                          }else{
                            days.remove("sun");
                            setState(() {
                              sun="";
                              sunSelected=false;

                            });
                          }
                        },
                        child: Container(
                          color: sunSelected
                              ? Color(0xFF6694F6)
                              : Colors.white,
                          height: 40,
                          width: size.width * 0.12,
                          child: Center(
                            child: Text(
                              "Sun",
                              style: Kconstants.fontMain
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(!monSelected){

                            setState(() {
                              mon="mon";
                              monSelected=true;
                            });
                          }else{
                            setState(() {
                              mon="";
                              monSelected=false;
                            });
                          }
                        },
                        child: Container(
                          color: monSelected
                              ? Color(0xFF6694F6)
                              : Colors.white,
                          height: 40,
                          width: size.width * 0.12,
                          child: Center(
                            child: Text(
                              "mon",
                              style: Kconstants.fontMain
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(!thiSelected){

                            setState(() {
                              thi="thi";
                              thiSelected=true;
                            });
                          }else{
                            days.remove("thi");
                            setState(() {
                              thi="";
                              thiSelected=false;
                            });
                          }
                        },
                        child: Container(
                          color: thiSelected
                              ? Color(0xFF6694F6)
                              : Colors.white,
                          height: 40,
                          width: size.width * 0.12,
                          child: Center(
                            child: Text(
                              "thi",
                              style: Kconstants.fontMain
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(!wedSelected){
                            setState(() {
                              wedSelected=true;
                              wed="wed";
                            });
                          }else{
                            days.remove("wed");
                            setState(() {
                              wed="";
                              wedSelected=false;

                            });
                          }
                        },
                        child: Container(
                          color: wedSelected
                              ? Color(0xFF6694F6)
                              : Colors.white,
                          height: 40,
                          width: size.width * 0.12,
                          child: Center(
                            child: Text(
                              "wed",
                              style: Kconstants.fontMain
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(!tueSelected){

                            setState(() {
                              tue="tue";
                              tueSelected=true;
                            });
                          }else{
                            setState(() {
                              tue="";
                              tueSelected=false;

                            });
                          }
                        },
                        child: Container(
                          color: tueSelected
                              ? Color(0xFF6694F6)
                              : Colors.white,
                          height: 40,
                          width: size.width * 0.12,
                          child: Center(
                            child: Text(
                              "tue",
                              style: Kconstants.fontMain
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(!friSelected){
                            setState(() {
                              fri="fri";
                              friSelected=true;
                            });
                          }else{

                            setState(() {
                              fri="";
                              friSelected=false;
                            });
                          }
                        },
                        child: Container(
                          color: friSelected
                              ? Color(0xFF6694F6)
                              : Colors.white,
                          height: 40,
                          width: size.width * 0.12,
                          child: Center(
                            child: Text(
                              "fri",
                              style: Kconstants.fontMain
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  AppoButton(
                      size: size,
                      title: "Save",
                      color: Color(0xFF496CCE),
                      fontColor: Colors.white,
                      buttonFunc: ()async{
                        if(_formkey.currentState!.validate()){
                          jours=sat+sun+mon+thi+wed+tue+fri;
                          print("$jours ddddddddddddddddddddddd");
                          HomeController.instance.addMedicine(medicineName, debut, fin, dose, time1, time2, time3, type, jours);
                          Navigator.pop(context);
                        }
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
