import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),//gonna tell us if its logged or not
        builder: (context, snapshot) {
          //if yes
          if (snapshot.hasData){
            return const HomePage();
          }
          //if not
          else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}