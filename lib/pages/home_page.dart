import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/FB_Auth.dart';
import 'add_post.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? _user;

  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Color.fromARGB(255, 100, 35, 75), // Set the color here
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 207, 199, 203),
        elevation: 0,
        title: Text(
          'Tlaltizapán, Morelos',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 43, 43, 43),
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color.fromARGB(19, 93, 48, 76),
                borderRadius: BorderRadius.circular(18),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => LoginPage());
                },
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 104, 52, 84),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
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
              Column(children: [
                Image.asset(
                  'lib/Images/catLogo.webp',
                  height: 40,
                  width: 140,
                ),
              ]),
              const SizedBox(height: 1),

              //email user, sign in text
              Center(
                child: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder:
                      (BuildContext context, AsyncSnapshot<User?> snapshot) {
                    if (snapshot.hasData && snapshot.data!.email != null) {
                      // User is signed in. Display the user's email.
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text('Hi ' + snapshot.data!.email!),
                      );
                    } else {
                      // User is not signed in. Display a default message.
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text('Hi there'),
                      );
                    }
                  },
                ),
              ),

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
