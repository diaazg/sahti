import 'package:flutter/material.dart';
import 'package:sa7ti/Kconstants.dart';

class AllSpecial extends StatefulWidget {
  const AllSpecial({Key? key}) : super(key: key);

  @override
  State<AllSpecial> createState() => _AllSpecialState();
}

class _AllSpecialState extends State<AllSpecial> {
  List <String> special=["Urology","Neurology","Ophtalmology","Cardiology","Dentist","Gastroenterologist","Gynecologist","Pulmonologist"];
  List <String> pic=["urology","brain","eye","cardiogram","Dentist","Gastroenterologist","Gynecologist","Pulmonologist"];
  List <Color> colors=[Color(0xFFD3B1E2),Color(0xFFF3C0C0),Color(0xFF63D2B0),Color(0xFFE8C752),Color(0xFFC17BEC),Color(0xFFEEA3AB),Color(0xFFB5F2A0),Color(0xFFFEEBA7),Color(0xFF6AAED5)];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            height: size.height * 0.3,
            width: size.width,
            child: Center(
              child: Container(
                width: 329 * fem,
                height: 151 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // rectangle127WU5 (1:84)
                      left: 18 * fem,
                      top: 116 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 297 * fem,
                          height: 35 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20 * fem),
                              color: Color(0x7f20b8b8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle128NmB (1:85)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 329 * fem,
                          height: 145 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20 * fem),
                              color: Color(0xff20b8b8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // doctor5H7T (1:86)
                      left: 211 * fem,
                      top: 13 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 110 * fem,
                          height: 114 * fem,
                          child: Image.asset(
                            'assets/page-1/images/doctor-5.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // vector12yW5 (1:87)
                      left: 210 * fem,
                      top: 13 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 111 * fem,
                          height: 114 * fem,
                          child: Image.asset(
                            'assets/page-1/images/vector-12.png',
                            width: 111 * fem,
                            height: 114 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // besmartbesaferpm (1:88)
                      left: 25 * fem,
                      top: 13 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 171 * fem,
                          height: 30 * fem,
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                            child: Text(
                              'Looking for specialist?',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // line9H9P (1:89)
                      left: 23 * fem,
                      top: 51 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 152 * fem,
                          height: 1 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // covid19wearmasksaeH (1:90)
                      left: 29 * fem,
                      top: 55 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 124 * fem,
                          height: 60 * fem,
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                            child: Text(
                              'Sa7ti is what you need!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All specialites",
                    style: Kconstants.fontMain.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: size.height*0.6,
                    width: size.width,
                    child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 15.0,
                children: List.generate(pic.length-1, (index) {
                    return SpecialCard(size: size,pic: pic[index],name: special[index],color: colors[index],);
                }
                )),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    ));
  }
}
class SpecialCard extends StatelessWidget {
  const SpecialCard({
    super.key,
    required this.size,
    required this.name,
    required this.pic,
    required this.color
  });

  final Size size;
  final String name;
  final String pic;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: size.height*0.11,
          width: size.width*0.25,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset("images/special/$pic.png"),
        ),
        Text(name,style: Kconstants.fontMain.copyWith(color: Colors.black,fontSize: 12),)
      ],
    );
  }
}