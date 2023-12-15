import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/intro_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),//gonna tell us if its logged or not
        builder: (context, snapshot) {
          //if yes
          if (snapshot.hasData){
            return HomePage();
          }
          //if not
          else {
            return IntroScreen();
          }
        },
      ),
    );
  }
}