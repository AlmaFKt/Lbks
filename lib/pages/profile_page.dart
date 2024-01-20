import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;

//text for notifications list
  List<String> notifications = [
    'Tienes un nuevo seguidor',
    'Haz una publicación',
  ];

  @override
  void initState() {
    super.initState();
    // Listen to changes in the authentication state
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    // Display the profile image
                    backgroundImage: AssetImage('assets/default_avatar.png'),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Get.to(() => HomePage());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenido,',
                    style: GoogleFonts.assistant(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  // User Name
                  Text(
                    _user?.displayName ??
                        'User Name', // Display the user name if it is not null
                    style: GoogleFonts.assistant(
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
      
                  const SizedBox(height: 35),
      
                  ExpansionTile(
                    title: Row(
                      children: [
                        Icon(Icons.notifications_none_rounded),
                        const SizedBox(width: 10),
                        Text(
                          'Notificaciones',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      // List of notifications
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(notifications[index]),
                            // Add onTap behavior for each notification if needed
                          );
                        },
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 8),
      
                  Divider(),
      
                  ExpansionTile(
                    title: Row(
                      children: [
                        Icon(CupertinoIcons.tickets),
                        const SizedBox(width: 14),
                        Text(
                          'Mis Boletos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      // List of notifications
                      ListTile(
                        title: Text('Ver Próximos Eventos'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Ver Eventos Pasados'),
                        onTap: () {},
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 8),
      
                  Divider(),
      
                  Row(
                    children: [
                      Icon(Icons.favorite_border), //My favorites icon
                      const SizedBox(width: 14),
                      Text(
                        'Mis Favoritos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 8),
      
                  Divider(),
      
                  Row(
                    children: [
                      Icon(CupertinoIcons.person_crop_circle), //My Profile icon
                      const SizedBox(width: 14),
                      Text(
                        'Mi Cuenta',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 8),
      
                  Divider(),
      
                  Row(
                    children: [
                      Icon(Icons.sos_sharp), //My favorites icon
                      const SizedBox(width: 14),
                      Text(
                        'Ayuda Ciudadana',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 8),
      
                  Divider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
