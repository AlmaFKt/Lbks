import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/TextField.dart';

class ForgotPwPage extends StatefulWidget {
  const ForgotPwPage({Key? key}) : super(key: key);

  @override
  State<ForgotPwPage> createState() => _ForgotPwPageState();
}

class _ForgotPwPageState extends State<ForgotPwPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future pwReset() async {
    // when u click Reset if it procceds it happens try
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('correo existente, email enviado!'),
            );
          });
    } on FirebaseAuthException catch (e) {
      // if it doesnt then whats the error
      print(e); // like for example a email that doesnt exists in our data base
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 246),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 52, 68),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/Images/Smart_cat.png',
                      height: 180,
                      width: 250,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                Text(
                  'Ingresa tu E-mail',
                  style: GoogleFonts.breeSerif(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Mandaremos un link para resetear tu contraseña',
              style: GoogleFonts.heebo(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: pwReset,
            child: Text('Send email'),
            color: Color.fromARGB(255, 236, 201, 201),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 4afe8ef9462087c0270a845082d02f63250f9d17
