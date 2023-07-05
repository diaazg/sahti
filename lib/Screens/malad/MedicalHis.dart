import 'package:flutter/material.dart';
import 'package:sa7ti/Kconstants.dart';

class MedicalHis extends StatefulWidget {
  const MedicalHis({Key? key}) : super(key: key);

  @override
  State<MedicalHis> createState() => _MedicalHisState();
}

class _MedicalHisState extends State<MedicalHis> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int i;
    for (i = 1; i < 8; i++) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<DayCard> listDay = [
      DayCard(
        day: "Sat",
        dayNbr: "21",
        size: size,
      ),
      DayCard(
        day: "Sun",
        dayNbr: "22",
        size: size,
      ),
      DayCard(
        day: "Mon",
        dayNbr: "23",
        size: size,
      ),
      DayCard(
        day: "Thi",
        dayNbr: "24",
        size: size,
      ),
      DayCard(
        day: "Wed",
        dayNbr: "25",
        size: size,
      ),
      DayCard(
        day: "Tue",
        dayNbr: "26",
        size: size,
      ),
      DayCard(
        day: "Fri",
        dayNbr: "27",
        size: size,
      )
    ];
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEAEBEC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.white,
                      child: Center(child: Icon(Icons.navigate_before)),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Medical History",
                          style: Kconstants.fontMain.copyWith(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: size.height * 0.25 * 0.2,
                        ),
                        Row(
                          children: listDay,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.9,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Active",
                              style: Kconstants.fontMain.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "see all",
                              style: Kconstants.fontMain.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: size.height * 0.8 * 0.2 * 0.1,
                        ),
                        illnessCard(size: size,pic: 1,periode: "Wed 26 - 2023",illName: "Viral infection",),
                        SizedBox(
                          height: size.height * 0.8 * 0.2 * 0.3,
                        ),
                        Row(
                          children: [
                            Text(
                              "Archive",
                              style: Kconstants.fontMain.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "see all",
                              style: Kconstants.fontMain.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: size.height * 0.8 * 0.2 * 0.1,
                        ),
                        illnessCard(size: size,pic: 3,periode: "May 27-2004  ;  Mar 08 -2008",illName: "Allergies",),
                        SizedBox(
                          height: size.height * 0.8 * 0.2 * 0.1,
                        ),
                        illnessCard(size: size,pic: 2,periode: "May 27-2004  ;  Mar 08 -2008",illName: "Chronic Maladies ",),
                        SizedBox(
                          height: size.height * 0.8 * 0.2 * 0.1,
                        ),
                        illnessCard(size: size,pic: 4,periode: "May 27-2004  ;  Mar 08 -2008",illName: "Bacterial Infection ",),

                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class illnessCard extends StatelessWidget {
  const illnessCard({
    super.key,
    required this.size,
    required this.illName,
    required this.periode,
    required this.pic
  });

  final Size size;
  final int pic;
  final String illName;
  final String periode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.8 * 0.2,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "images/MedicalRep/$pic.png",
                height: size.height * 0.8 * 0.2 * 0.8,
                width: size.width * 0.3,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(illName,style: Kconstants.fontMain.copyWith(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900),),
                    Text(periode,style: Kconstants.fontMain.copyWith(color: Colors.black54,fontSize: 12,fontWeight: FontWeight.w400),)
                  ],
                ),
              ),
            ],
          ),
          Icon(Icons.navigate_next,color: Colors.black38,size: 50,)
        ],
      ),
    );
  }
}

class DayCard extends StatelessWidget {
  const DayCard(
      {super.key, required this.size, required this.day, required this.dayNbr});

  final Size size;
  final String day;
  final String dayNbr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25 * 0.25,
      width: size.width * 0.14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: Kconstants.fontMain.copyWith(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w900),
          ),
          Text(
            dayNbr,
            style: Kconstants.fontMain.copyWith(
                color: Colors.redAccent,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class CardInfo {
  String day;
  String dayNbr;
  CardInfo({required this.day, required this.dayNbr});
}
