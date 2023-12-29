import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPost extends StatelessWidget {
  AddPost({Key? key});

  // text controller
  final textController = TextEditingController();

  // post
  void postMessage() {
    String message = textController.text;
    if (message.isNotEmpty) {
      FirebaseFirestore.instance.collection("User Posts").add({
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear the text field after posting
      textController.clear();
    }
  }

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
            // FIREBASE to get the data
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("User Posts")
                    .orderBy("timestamp", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text('No posts available.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data!.docs[index];
                      final message = post['message'];

                      return ListTile(
                        title: Text(message),
                      );
                    },
                  );
                },
              ),
            ),

            // New post
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: textController,
                      hintText: 'How are you feeling today...',
                      obscureText: false,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Pop the current screen
                      Navigator.pop(context);

                      // Navigate to another screen (e.g., HomeScreen)
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    icon: Icon(Icons.arrow_circle_up),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 