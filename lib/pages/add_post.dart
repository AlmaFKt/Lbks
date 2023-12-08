import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/cart_model.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});

//text controller
  final textController = TextEditingController();

//post
  void postMessage() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(44, 201, 184, 211),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 14, 13, 13),
        ),
        title: Text(
          'New Post',
          style: GoogleFonts.notoSans(
            fontSize: 18,
            color: Color.fromARGB(255, 148, 35, 99),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          //New post
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                 //text field
                  child: MyTextField(
                      controller: textController,
                      hintText: 'How are u feeling today...',
                      obscureText: false),
                ),
                IconButton(
                onPressed: postMessage,
                icon: Icon(Icons.arrow_circle_up),
              ),
              ],
            ),
          ),
          //Button to post
          
        ],
      )),
    );
  }
}
