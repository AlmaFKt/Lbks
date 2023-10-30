import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 32, 9, 43))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 32, 9, 43))
                    ),
                    fillColor: Color.fromARGB(192, 197, 192, 206),
                    filled: true,
                  ),
                ),
              );
  }
}