import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:Theme/dark_mode.dart';
import 'Theme/ligth_mode.dart';
import 'pages/intro_screen.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (error) {
    print('Error initializing Firebase: $error');
  }
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
  }
}
