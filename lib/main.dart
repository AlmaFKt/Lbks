import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:get/get.dart';
//import 'package:Theme/dark_mode.dart';
import 'package:provider/provider.dart';
import 'Theme/ligth_mode.dart';
import 'model/cart_model.dart';
import 'pages/intro_screen.dart';
import 'package:flutter_application_2/Theme/dark_mode.dart';
import 'package:flutter_application_2/Theme/ligth_mode.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/register_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: GetMaterialApp( // with the Get encierra todo tu proyecto y el Get tiene control de todo
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
        theme: LigthMode,
      //darkTheme: DarkMode,
      ));
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
}}