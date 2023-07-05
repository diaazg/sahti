import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:sa7ti/Screens/LoginPages/LogIn.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sa7ti/Screens/navBar.dart';
import 'package:sa7ti/translations/translationDocument.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = PageController();
  bool isLastPage = false;
  int? ind;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 650,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                  index == 0 ? ind = index + 2 : ind = index - 1;
                });
              },
              controller: controller,
              children: [
                Page(
                  size: size,
                  img: 1,
                  title: 'first_title'.tr,
                  description:
                  'first_sub'.tr,
                ),
                Page(
                    size: size,
                    img: 2,
                    title: 'second_title'.tr,
                    description: 'second_sub'.tr),
                Page(
                  size: size,
                  img: 3,
                  title: 'third_title'.tr,
                  description: 'third_sub'.tr,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
                dotColor: Color(0xFF6694F6), activeDotColor: Color(0xFF6694F6)),
            onDotClicked: (index) {
              controller.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              isLastPage
                  ? Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()))
                  : controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
            },
            child: Text(
              isLastPage?'third_title'.tr:'next'.tr,
              style: Kconstants.fontMain
                  .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 70),
                primary: Color(0xFF6694F6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
          )
        ],
      ),
    ));
  }
}

class Page extends StatelessWidget {
  const Page(
      {super.key,
      required this.size,
      required this.img,
      required this.title,
      required this.description});
  final int img;
  final Size size;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: size.width,
      child: CustomPaint(
        painter: CurvePainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "images/splash/$img.png",
                height: 300,
                width: size.width,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  description,
                  style: Kconstants.fontMain,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // TODO: Set properties to paint
    paint.color = Color(0xFF6694F6);
    paint.style = PaintingStyle.fill;

    var path = Path();

    // TODO: Draw your path
    path.moveTo(0, 600);
    path.lineTo(size.width * 0.05, 600);
    path.quadraticBezierTo(size.width * 0.5, 630, size.width * 0.95, 600);
    path.lineTo(size.width, 600);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
