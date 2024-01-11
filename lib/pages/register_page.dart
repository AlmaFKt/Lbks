import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/My_Button.dart';
import 'package:flutter_application_2/components/TextField.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  //we copied the one from the login page, so we can do some changes
  RegisterPage({super.key});

  //Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasController = TextEditingController(); //we added this 2 TextEd
  final emailController = TextEditingController();

void updateUserName(String newName) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.updateDisplayName(newName);
        user = FirebaseAuth.instance.currentUser; // Refresh the user object
        print("User display name updated: ${user?.displayName}");
      } catch (e) {
        print("Error updating user display name: $e");
      }
    }
  }
  //register user in method event
  void registerUserIn(BuildContext context) async {
  try {
    // Validate password and confirm password
    if (passwordController.text != confirmPasController.text) {
      // Passwords don't match, show a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords don't match"),
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
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

    // Use Firebase Authentication to create a new user account
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

    // Update the user's display name
    if (userCredential.user != null) {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        try {
          await user.updateDisplayName(usernameController.text);
          user = FirebaseAuth.instance.currentUser; // Refresh the user object
          print("User display name updated: ${user?.displayName}");
        } catch (e) {
          print("Error updating user display name: $e");
        }
      }
    }

    // Close loading indicator
    Navigator.pop(context);

    // Registration successful, navigate to home page
    Get.offAll(() => HomePage());

  } catch (error) {
    // Handle registration errors
    print("Registration failed: $error");

    // Close loading indicator
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Registration failed: $error"),
        duration: Duration(seconds: 4), // Adjust the duration as needed
      ),
    );
  }
}


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
                      height: 70,
                      width: 250,
                    ),
                  ],
                ),
                //const SizedBox(height: 1, width: 20,),

                //PlodCat (logo) text
                Text('PlodCat', style: GoogleFonts.lobsterTwo(fontSize: 38)),

                const SizedBox(
                  height: 12,
                  width: 20,
                ),

                //(Welcome!) text
                Text('Join us!', style: GoogleFonts.heebo(fontSize: 20)),

                const SizedBox(
                  height: 15,
                  width: 20,
                ), // this makes a type of space betweeno your objects

                //username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ), // u can find the code for this object in components

                const SizedBox(
                  height: 13,
                  width: 20,
                ),

                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ), // u can find the code for this object in components

                const SizedBox(
                  height: 13,
                  width: 20,
                ),

                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 13,
                  width: 20,
                ),

                MyTextField(
                  controller: confirmPasController,
                  hintText: 'Password confirm',
                  obscureText: true,
                ),


                const SizedBox(
                  height: 25,
                ),

                //log in button
                MyButton(
                  text: 'Register', // Add the text parameter for the button
                  onTap: () {
                    registerUserIn(context);
                  },
                ),

                const SizedBox(
                  height: 25,
                  width: 20,
                ),

                //already have an account? Register now
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
                          'Already a PlodCat user?',
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
                  height: 20,
                  width: 20,
                ),

                //Register now text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 180.0),
                  child: Expanded(
                    child: Divider(
                      thickness: 0.4,
                      color: Color.fromARGB(255, 5, 5, 5),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    // Navigate to the logIn page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginPage(), 
                      ),
                    );
                  },
                  //GestureD is for making everythin that its inside a button
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.robotoSlab(
                      fontSize: 15,
                      textStyle:
                          TextStyle(color: Color.fromARGB(255, 66, 48, 224)),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 180.0),
                  child: Expanded(
                    child: Divider(
                      thickness: 0.4,
                      color: Color.fromARGB(255, 5, 5, 5),
                    ),
                  ),
                ),

                //more stuff if u want 2 c; :c
              ],
            ),
          ),
        ),
      ),
    ); //In this page we are only gonna have a blank scaffold
  }
}

