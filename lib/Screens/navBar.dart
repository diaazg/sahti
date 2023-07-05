import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:sa7ti/Kconstants.dart';
import 'package:sa7ti/Screens/homePage.dart';
import 'package:sa7ti/Screens/malad/MedicalHis.dart';
import 'package:sa7ti/Screens/appointment/myApts.dart';
import 'package:sa7ti/Screens/Profiles/maladProfile.dart';
import 'package:sa7ti/Screens/Profiles/listOfProfile.dart';
import 'malad/medicineRminder.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<TabItem> items = [
    TabItem(
      icon: Icons.filter_frames,
      title: 'Profile',
    ),
    TabItem(
      icon: Icons.home_filled,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.notifications_outlined,
      title: 'Notifications',
    ),

  ];
  List<Widget> screens=[listOfProfile(),homePage(),medicineRminder()];
  int visit = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:BottomBarDefault(
            borderRadius:BorderRadius.vertical(top: Radius.circular(20)) ,
            items: items,
            backgroundColor: Colors.white,
            color: Colors.black,
            colorSelected: Kconstants.blueBackground,
            indexSelected: visit,
            onTap: (int index) => setState(() {
              visit = index;
            }),
            animated: true,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
          ) ,
          backgroundColor: Color(0xFFF5F5F5),
          body: screens[visit],
        ));
  }
}
