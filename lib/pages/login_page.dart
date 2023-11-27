import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/My_Button.dart';
import 'package:flutter_application_2/components/TextField.dart';
import 'package:flutter_application_2/pages/forgot_password.dart';
import 'package:flutter_application_2/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method event
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
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
                Text('PlodCat', style: GoogleFonts.lobsterTwo(fontSize: 38)),

                const SizedBox(
                  height: 20,
                  width: 20,
                ),

                //(Welcome!) text
                Text('Welcome back!', style: GoogleFonts.heebo(fontSize: 20)),

                const SizedBox(
                  height: 20,
                  width: 20,
                ), // this makes a type of space betweeno your objects

                //username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ), // u can find the code for this object in components

                const SizedBox(
                  height: 12,
                  width: 20,
                ),

                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 12,
                  width: 20,
                ),

                //forgot password TEXT (In a row)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ForgotPwPage());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 97, 81, 180)),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 32,
                  width: 20,
                ),

                //log in button
                //log in button
                MyButton(
                  text: 'Log In', // Add the text parameter for the button
                  onTap: signUserIn,
                ),

                const SizedBox(
                  height: 32,
                  width: 20,
                ),

                //Dont have an account? Register now
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 163, 76, 127),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Not a PlodCat user?',
                          style:
                              TextStyle(color: Color.fromARGB(183, 66, 66, 66)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 163, 76, 127),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 32,
                  width: 20,
                ),

                //Register now text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 170.0),
                  child: Expanded(
                    child: Divider(
                      thickness: 0.4,
                      color: Color.fromARGB(255, 5, 5, 5),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    // Navigate to the register page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RegisterPage(), // Replace with your RegisterPage widget
                      ),
                    );
                  },
                  child: Text(
                    'Register now',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 15,
                      textStyle:
                          TextStyle(color: Color.fromARGB(255, 120, 109, 223)),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 170.0),
                  child: Expanded(
                    child: Divider(
                      thickness: 0.4,
                      color: Color.fromARGB(255, 5, 5, 5),
                    ),
                  ),
                ),

                //more stuff if u want 2 c;
              ],
            ),
          ),
        ),
      ),
    ); //In this page we are only gonna have a blank scaffold
  }
}
