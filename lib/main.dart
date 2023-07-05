import 'package:flutter/material.dart';
import 'Screens/FirstPages/splashScreen.dart';
import 'package:sa7ti/Screens/seeAll/allSpecial.dart';
import 'package:sa7ti/Screens/Profiles/myQr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sa7ti/Services/AuthController.dart';
import 'package:sa7ti/Screens/Profiles/doctorProfile.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'translations/translationDocument.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('fr','FR'),
      translations: translationDocument(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}


