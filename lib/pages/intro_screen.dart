import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 87, 41, 70),
      centerTitle: true,
      title: Text('PlodCat',
      style: GoogleFonts.lobsterTwo(
      textStyle:TextStyle(color: Color.fromARGB(255, 233, 193, 225),),),
      ),
    ),
    backgroundColor: Color.fromARGB(255, 221, 221, 221),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // big logo
              Padding(
                padding: const EdgeInsets.only(
                  left: 100.0,
                  right: 100.0,
                  top: 60,
                  bottom: 20,
                ),
                child: Image.asset('lib/images/catLogo.webp',
                height: 120,),
              ),
        
        
              // greeting
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  'Welcome to the club for average gym and cat enjoyers',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerif(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        
                      const SizedBox(height: 20),

              // fresh posts
              Text(
                'Fresh posts everyday',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
        
              const SizedBox(height: 40),
        
              // get started button
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(255, 114, 60, 86)              ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

}