/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

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

          //FIREBASE to get the data
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User Posts")
                  .orderBy("Timestamp", descending: false)
                  .snapshots(), //thats what the stream is gonna listen to
              builder: (context, snapshot) {
                if (snapshot.hasData) { //if we have data
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      //here is gonna get the message
                      final post = snapshot.data!.docs[index];
                      //return
                    },
                  );
                }
              },
            ),
          ),

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
 */