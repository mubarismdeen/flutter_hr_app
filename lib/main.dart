// import 'package:admin/contollers/menu_controller.dart';
import 'package:admin/contollers/menu_controller.dart';
import 'package:admin/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/contollers/navigation_controller.dart';
import 'package:admin/constants/style.dart';

void main() {
  Get.put(CustomMenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme
        ).apply(
          bodyColor: Colors.black
        ),
        // pageTransitionsTheme: const PageTransitionsTheme(
        //   builders: {
        //     TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        //     TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
        //   }
        // ),
        colorScheme: ColorScheme.light(primary: themeColor)
      ),
      home: LoginPage(),
    );
  }
}