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
  try {
  await FirebaseAuth.instance
      .sendPasswordResetEmail(email: emailController.text.trim());
  // Always show a success message
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('If the email is registered, a password reset email has been sent to ${emailController.text.trim()}'),
      );
    },
  );
} catch (e) {
  // Show a dialog with the error message
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('Error: ${e.toString()}'),
      );
    },
  );
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
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }

}

