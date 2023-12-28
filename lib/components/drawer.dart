import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(246, 174, 169, 176),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://static01.nyt.com/images/2014/07/23/upshot/23UP-cat/23UP-cat-articleLarge.jpg?quality=75&auto=webp&disable=upscale'),
                ),
                accountEmail: Text('example@gmail.com'),
                accountName: Text(
                  'Exam Ple',
                  style: TextStyle(fontSize: 24.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.house),
                title: const Text(
                  'Houses',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Apartments',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  HomePage(),
                    ),
                  );
                 } 
              )
        ],
      ),
    );
  }
}