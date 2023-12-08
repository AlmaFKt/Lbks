import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_post.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(44, 201, 184, 211),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Icon(
            CupertinoIcons.bars,
            color: Colors.grey[700],
          ),
        ),
        title: Text(
          'Tlaltizapán, Morelos',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.put(tag: 'dato', 3);
                  Get.to(
                    LoginPage(),
                    arguments: "Hola",
                  );
                },
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),

      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddPost();
            },
          ),
        ),
        child: const Icon(Icons.add,
        color: Color.fromARGB(255, 225, 192, 228)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
        children: [
          Image.asset(
                  'lib/Images/catLogo.webp',
                  height: 40,
                  width: 140,
                ),
        ]
      ),
              const SizedBox(height: 1),

              // good morning
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text('Good morning,'),
              ),

              const SizedBox(height: 4),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Let's explore some posts!",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Divider(),
              ),

              const SizedBox(height: 15),

              // categories -> horizontal listview
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Home page",
                  style: GoogleFonts.notoSerif(
                    fontSize: 18,
                  ),
                ),
              ),   
            ],
          ),
        ),
      ),
    );
  }
}