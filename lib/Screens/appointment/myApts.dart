import 'package:flutter/material.dart';
import 'package:sa7ti/Kconstants.dart';

class myApts extends StatefulWidget {
  const myApts({Key? key}) : super(key: key);

  @override
  State<myApts> createState() => _myAptsState();
}

class _myAptsState extends State<myApts> {
  bool tdy = true;
  bool tmrw = false;
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
              height: size.height * 0.5,
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
                      onTap: () {},
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
                              Text(
                                "Hello ",
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "Fatima naddk",
                                style: Kconstants.fontMain.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "This is \n your appointments !",
                          style: Kconstants.fontMain.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Add",
                              style: Kconstants.fontMain.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFF2F7FC),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tdy = true;
                              tmrw = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Today",
                                style: Kconstants.fontMain.copyWith(
                                  color: tdy
                                      ? const Color(0xFF496CCE)
                                      : Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(
                                  height: 1.0,
                                  width: 130.0,
                                  color: tdy ? Color(0xFF496CCE) : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tmrw = true;
                              tdy = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text("Tomorrow",
                                  style: Kconstants.fontMain.copyWith(
                                    color: tmrw
                                        ? const Color(0xFF496CCE)
                                        : Colors.black54,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(
                                  height: 1.0,
                                  width: 130.0,
                                  color:
                                      tmrw ? Color(0xFF496CCE) : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      height: size.height * 0.2,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                color: Color(0xFFF3C0C0),
                                borderRadius: BorderRadius.circular(20)),
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
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Text(
                                    "Dr-islam Ghachi ",
                                    style: Kconstants.fontMain
                                        .copyWith(color: Color(0xFFF3C0C0),fontSize: 15),
                                  ),
                                  SizedBox(width: 20,),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month,color: Color(0xFFF3C0C0) ,),
                                      Text(
                                        "28 May",
                                        style: Kconstants.fontMain
                                            .copyWith(color: Colors.black,fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Text(
                                    "Specialiy : Cardiologist ",
                                    style: Kconstants.fontMain
                                        .copyWith(color: Colors.black,fontSize: 10),
                                  ),
                                  SizedBox(width: 20,),
                                  Row(
                                    children: [
                                      Icon(Icons.watch_later,color: Color(0xFFF3C0C0) ,),
                                      Text(
                                        "  8:00 AM",
                                        style: Kconstants.fontMain
                                            .copyWith(color: Colors.black,fontSize: 10),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
                             Row(
                               children: [
                                 Row(
                                   children: [
                                     Icon(Icons.flag,color: Color(0xFFF3C0C0) ,),
                                     Text(
                                       "  Your turn : 19",
                                       style: Kconstants.fontMain
                                           .copyWith(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),
                                     ),
                                   ],
                                 ),
                                 SizedBox(width: 5,),
                                 Row(
                                   children: [
                                     Icon(Icons.timer,color: Color(0xFFF3C0C0) ,),
                                     Text(
                                       "  Count down : 12",
                                       style: Kconstants.fontMain
                                           .copyWith(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: size.width*0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xFFF3C0C0)
                                    ),
                                    child: Center(
                                      child: Text("Veiw",style: Kconstants.fontMain.copyWith(color: Colors.white,fontSize: 15),),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    height: 40,
                                    width: size.width*0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xFFD9D9D9)
                                    ),
                                    child: Center(
                                      child: Text("Cancel",style: Kconstants.fontMain.copyWith(color: Colors.white,fontSize: 15),),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
