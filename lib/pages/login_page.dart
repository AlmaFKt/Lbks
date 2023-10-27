import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 218, 247),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
            //Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/Images/catLogo.webp',
                height: 250,
                width: 250,
              )
            ],
          ),
          const SizedBox(height: 1, width: 20,),
            //PlodCat (logo) text
            Text('PlodCat',
            style: TextStyle(
              color: Color.fromARGB(255, 126, 84, 165),
            ),),
              
            //(log in) text
              
            //username textfield
              
            //password textfield
              
            //forgot password
              
            //log in button
              
            //Dont have an account? Sign up Button
              
          ],),
        ),
      ),
    ); //In this page we are only gonna have a blank scaffold
  }
}