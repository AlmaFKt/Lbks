import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(217, 251, 251, 251),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(
                    255, 0, 0, 0), // Replace with your desired color
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://png.pngtree.com/png-clipart/20190115/ourmid/pngtree-funny-cat-taking-selfie-couple-of-kitty-with-a-smile-stick-png-image_314917.jpg',
                ),
              ),
            ),
            accountEmail: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.hasData && snapshot.data!.email != null) {
                  return Text(snapshot.data!.email!);
                } else {
                  return GestureDetector(
                onTap: () {
                  // Navigate to the sign-in page using Get
                  Get.offAll(() => LoginPage()); // Replace SignInPage with your sign-in page
                },
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 132, 94, 119), // Background color
                    borderRadius: BorderRadius.circular(6.0), // Optional: Rounded corners
                    border: Border.all(color: Color.fromARGB(255, 87, 41, 70), width: 2.0), // Border for a clickable appearance
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Color.fromARGB(255, 244, 239, 239), // Text color
                    ),
                  ),
                ),
              );
                }
              },
            ),
            accountName: Text(
              'Exam Ple',
              style: TextStyle(fontSize: 22.0),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 169, 149, 161),
            ),
          ),

          //HOME BUTTON
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 17.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => HomePage(),
                ),
              );
            },
          ),

          //NOTIFICATIONS BUTTON
          ListTile(
              leading: const Icon(Icons.notifications_none_outlined),
              title: const Text(
                'Notifications',
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              }),
//DIVIDER
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          //LOGOUT BUTTON
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 17.0),
            ),
            onTap: () async {
              try {
                // Sign out the user
                signUserOut();

                // Navigate to the login screen or any appropriate screen
                Get.offAll(() => HomePage());
              } catch (e) {
                // Show an error dialog based on the error code
                String errorMessage =
                    'An error occurred while signing out. Please try again.';

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text(errorMessage),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
