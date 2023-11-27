import 'package:flutter/material.dart';
import 'package:flutter_application_2/Theme/dark_mode.dart';
import 'package:flutter_application_2/Theme/ligth_mode.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/register_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//pene
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: LigthMode,
      //darkTheme: DarkMode,
    );
  }
}
