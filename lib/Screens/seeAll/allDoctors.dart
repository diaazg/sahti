import 'package:flutter/material.dart';
import 'package:sa7ti/Services/StoreController.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sa7ti/Models/DoctorModel.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Screens/Profiles/doctorProfile.dart';

class AllDoctors extends StatefulWidget {
  const AllDoctors({Key? key}) : super(key: key);
  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  List<String> special = [
    "Urology",
    "Neurology",
    "Ophtalmology",
    "Cardiology",
    "Dentist",
    "Gastroenterologist",
    "Gynecologist",
    "Pulmonologist"
  ];
  List<DoctorModel> doctorBySpecial = [];
  String searchDoctor = "";
  List<String?> doctors = [];
  int chooseSpecial = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put<HomeController>(HomeController());
    for (DoctorModel doctor in HomeController.instance.getterDoctors) {
      setState(() {
        doctors.add(doctor.name);
      });
      if (doctor.specialite == special[chooseSpecial]) {
        setState(() {
          doctorBySpecial.add(doctor);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEAEBEC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Container(
                height: size.height * 0.09 * 0.7,
                width: size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 20, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.1 * 0.3,
                        width: size.width * 0.5,
                        child: SearchField(
                          suggestions: doctors
                              .map((e) => SearchFieldListItem(e!,
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(e),
                                  )))
                              .toList(),
                          suggestionState: Suggestion.expand,
                          hint: 'Doctor name',
                          searchStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          validator: (x) =>
                              x!.isEmpty ? 'Please enter your commune' : null,
                          searchInputDecoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Kconstants.blueBackground,
                              ),
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hoverColor: Colors.black,
                              fillColor: Colors.black,
                              focusColor: Colors.black,
                              isCollapsed: false),
                          maxSuggestionsInViewPort: 2,
                          itemHeight: 50,
                          onSubmit: (x) {
                            setState(() {
                              searchDoctor = x;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (searchDoctor == "") {
                            print("Tap doooooooooooooooone");
                          } else {
                            print("$searchDoctor dooooooooooooooooone");
                          }
                        },
                        onLongPress: () {
                          print("Long doooooooooooooooone");
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Kconstants.blueBackground,
                                borderRadius: BorderRadius.circular(200)),
                            child: Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.09 * 0.75,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: special.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          chooseSpecial = index;
                          doctorBySpecial.clear();
                        });
                        Get.put<HomeController>(HomeController());

                        for (DoctorModel doctor in HomeController.instance.getterDoctors) {
                          if (doctor.specialite == special[chooseSpecial]) {
                            setState(() {
                              doctorBySpecial.add(doctor);
                            });
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: size.height * 0.09 * 0.75,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: chooseSpecial == index
                                ? Kconstants.blueBackground
                                : Color(0xFFEAEBEC)),
                        child: Center(
                          child: Text(
                            special[index],
                            style: Kconstants.fontMain.copyWith(
                                color: chooseSpecial == index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: doctorBySpecial.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Get.put<HomeController>(HomeController());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorProfile(
                                  docName: doctorBySpecial[index].name,
                                  id:doctorBySpecial[index].id,
                                  specialite:doctorBySpecial[index].specialite,
                                  wilaya: doctorBySpecial[index].wilaya,
                                  commune: doctorBySpecial[index].commune,
                                  phoneNbr: "+213 549930141",
                                  ind:HomeController.instance.getterfixApt.indexWhere((element) => element.id==doctorBySpecial[index].id),)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        height: size.height * 0.17,
                        width: size.width * 0.95,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.15,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF3C0C0),
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                    "images/appointement/7.png",
                                    height: size.height * 0.15,
                                    width: size.width * 0.2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Dr-${doctorBySpecial[index].name} ",
                                    style: Kconstants.fontMain.copyWith(
                                        color: Color(0xFFF3C0C0),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Specialiy : ${doctorBySpecial[index].specialite} ",
                                    style: Kconstants.fontMain.copyWith(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    height: 40,
                                    width: size.width * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20),
                                        color: Color(0xFFF3C0C0)),
                                    child: Center(
                                      child: Text(
                                        "Veiw more ",
                                        style: Kconstants.fontMain
                                            .copyWith(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.favorite,
                              color: Color(0xFFF3C0C0),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
