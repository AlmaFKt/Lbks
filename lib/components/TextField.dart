import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller; //this is to have acces to what the user typed in the textField
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller, //required means that needs a default value, it can't be null
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller, //access info in the textfield
        obscureText: obscureText, //A boolean to hide the characters when ur typing a password
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 32, 9, 43))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 32, 9, 43))),
          fillColor: Color.fromARGB(192, 197, 192, 206),
          filled: true,
          hintText: hintText, //String to give a hint to the user of what he should type in
          hintStyle: TextStyle(color: Color.fromARGB(211, 146, 145, 145))
        ),
      ),
    );
  }
}