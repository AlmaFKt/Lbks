import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/My_Button.dart';
import 'package:flutter_application_2/components/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {//we copied the one from the login page, so we can do some changes
  RegisterPage({super.key});

  //Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasController = TextEditingController();//we added this 2 TextEd
  final usernameConfirmController = TextEditingController();



  //register user in method event
  void registerUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 218, 247),
      body: SafeArea(
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
                    height: 160,
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
                height: 10,
                width: 20,
              ),

               MyTextField(
                controller: usernameConfirmController,
                hintText: 'User Confirm',
                obscureText: false,
              ), // u can find the code for this object in components

              const SizedBox(
                height: 10,
                width: 20,
              ),


              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
                width: 20,
              ),

              MyTextField(
                controller: confirmPasController,
                hintText: 'Password confirm',
                obscureText: true,
              ),

              const SizedBox(
                height: 12,
                width: 20,
              ),

              //forgot password TEXT (In a row)
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  //we wrap it into a row so it isn't on the center
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Color.fromARGB(255, 97, 81, 180)),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //log in button
              MyButton(
                onTap: registerUserIn,
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
              
              GestureDetector(//GestureD is for making everythin that its inside a button
                child: Text("Register now",
                style: GoogleFonts.robotoSlab(
                  fontSize: 15,
                  textStyle: TextStyle(color: Color.fromARGB(255, 120, 109, 223)),
                ),),
                onTap: () {
                  
                },
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

              
              //more stuff if u want 2 c;
            ],
          ),
        ),
      ),
    ); //In this page we are only gonna have a blank scaffold
  }
}
