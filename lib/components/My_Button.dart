import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;// function to make the event works
  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //We wrap it into a widget so we can make it a gesture detector
      onTap: onTap, //here we add the event to happen on the button
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 130.0),
        decoration: BoxDecoration(color: Color.fromARGB(255, 88, 43, 99),
        borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Sign in",
            style: TextStyle(color: Color.fromARGB(255, 204, 203, 204),
            fontWeight: FontWeight.bold,
            fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
