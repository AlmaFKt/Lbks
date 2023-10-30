import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

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
                height: 180,
                width: 250,
              ),
            ],
          ),
          //const SizedBox(height: 1, width: 20,),
            
            //PlodCat (logo) text
            Text('PlodCat',
            style: GoogleFonts.lobsterTwo (fontSize: 38)
            ),
              const SizedBox(height: 20, width: 20,),
            //(log in) text
              Text(
                'LOG IN',
              style: GoogleFonts.heebo (fontSize: 20) 
              ),

              const SizedBox(height: 20, width: 20,), // this makes a type of space between your objects
            //username textfield
            MyTextField(), // u can find the code for this in components

              const SizedBox(height: 20, width: 20,),
            //password textfield
              MyTextField(),
            //forgot password
              
            //log in button
              
            //Dont have an account? Sign up Button
              
          ],),
        ),
      ),
    ); //In this page we are only gonna have a blank scaffold
  }
}