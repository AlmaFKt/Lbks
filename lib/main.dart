import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:Theme/dark_mode.dart';
import 'package:provider/provider.dart';
import 'Theme/ligth_mode.dart';
import 'pages/intro_screen.dart';
import 'package:flutter_application_2/Theme/dark_mode.dart';
import 'package:flutter_application_2/pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      theme: LigthMode,
      //darkTheme: DarkMode,
      );
  // This widget is the root of your application.
}}