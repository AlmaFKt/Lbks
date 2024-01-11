import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add your user information here
            CircleAvatar(
              radius: 50,
              // You can display the user's profile picture here
              // Example:
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            const SizedBox(height: 20),
            Text(
              'User Name', // Replace with the user's name
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'user@example.com', // Replace with the user's email
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logout functionality here
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
