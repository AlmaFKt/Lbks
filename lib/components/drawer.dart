import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({super.key});
Color avatarBackgroundColor = Color.fromARGB(255, 132, 94, 119);
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser =
        FirebaseAuth.instance.currentUser; //for the sign out button auth

    return Drawer(
      backgroundColor: Color.fromARGB(217, 251, 251, 251),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //Header -PICTURE
          UserAccountsDrawerHeader(
            currentAccountPicture: currentUser != null
                ? GestureDetector(
                    onTap: () async {
                      final ImagePicker _picker = ImagePicker();
                      // Pick an image
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      // Use the picked image
                      if (image != null) {
                        // You can upload the image to Firebase Storage and then update the user's photoURL
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: currentUser.photoURL != null
                          ? NetworkImage(currentUser.photoURL!)
                          : AssetImage('assets/default_avatar.png')
                              as ImageProvider<
                                  Object>, // Provide a default avatar image
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/default_avatar.png'), // Provide a default avatar image
                  ),
            accountEmail: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.hasData && snapshot.data!.email != null) {
                  return Text(snapshot.data!.email!);
                } else {
                  return GestureDetector(
                    onTap: () {
                      Get.offAll(() => LoginPage());
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 132, 94, 119),
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 87, 41, 70), width: 2.0),
                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Color.fromARGB(255, 244, 239, 239),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),

            //To show the user's name in the drawer header
            accountName: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.hasData && snapshot.data!.displayName != null) {
                  // Use the user's display name if available
                  return Text(snapshot.data!.displayName!,
                      style: TextStyle(fontSize: 22.0));
                } else {
                  return Text(
                    '', // Default or fallback name
                    style: TextStyle(fontSize: 22.0),
                  );
                }
              },
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
              Get.offAll( HomePage());
            },
          ),

          //Search BUTTON 
          ListTile(
              leading: const Icon(Icons.search_outlined),
              title: const Text(
                'Search',
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
               Get.offAll( HomePage());
              }),

          //NOTIFICATIONS BUTTON
          if (currentUser != null) // Only show button if the user is signed in
        ListTile(
          leading: const Icon(Icons.notifications_none_outlined),
          title: const Text(
            'Notifications',
            style: TextStyle(fontSize: 17.0),
          ),
          onTap: () {
            Get.offAll(HomePage());
          },
        ),
        
          //DIVIDER
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          //LOGOUT BUTTON (conditionally show based on auth state)
          if (currentUser != null)
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text(
                'Log out',
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () async {
                try {
                  // Sign out the user
                  signUserOut();
                  // Navigate to the login screen
                  Get.offAll(() => HomePage());
                } catch (e) {
                  // Error message
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
