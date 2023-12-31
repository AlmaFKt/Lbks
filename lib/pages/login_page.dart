import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/My_Button.dart';
import 'package:flutter_application_2/components/TextField.dart';
import 'package:flutter_application_2/pages/forgot_password.dart';
import 'package:flutter_application_2/pages/home_page.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method event
  void signUserIn() async {
  // Validate email and password
  if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
    // Empty email or password
    showErrorDialog('Please enter both email and password.');
    return;
  }

  // Show loading indicator
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // Close the loading indicator
    Navigator.pop(context);

    // Navigate to the home page
    Get.to(() => HomePage());
  } on FirebaseAuthException catch (e) {
    // Close the loading indicator
    Navigator.pop(context);

    // Handle specific authentication errors
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      showErrorDialog('Incorrect Email or Password');
    } else {
      // Handle other authentication errors
      showErrorDialog('Incorrect Email or Password');
    }
  }
}

void showErrorDialog(String errorMessage) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(errorMessage),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null, // Set the appBar property to null
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  //button
                  child: IconButton(
                    onPressed: () {
                      Get.to(HomePage());
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 1, 0, 0),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    //Logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/Images/catLogo.webp',
                          height: 70,
                          width: 250,
                        ),
                      ],
                    ),
                    //const SizedBox(height: 1, width: 20,),

                    //PlodCat (logo) text
                    Text('PlodCat',
                        style: GoogleFonts.lobsterTwo(fontSize: 38)),

                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),

                    //(Welcome!) text
                    Text('Welcome back!',
                        style: GoogleFonts.heebo(fontSize: 20)),

                    const SizedBox(
                      height: 20,
                      width: 20,
                    ), // this makes a type of space betweeno your objects

                    //username textfield
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
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
                    MyButton(
                      text: 'Sign In',
                      onTap: () {
                        signUserIn();
                      },
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Not a PlodCat user?',
                              style: TextStyle(
                                  color: Color.fromARGB(183, 66, 66, 66)),
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
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 120, 109, 223)),
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
            ]),
          ),
        )); //In this page we are only gonna have a blank scaffold
  }
}
