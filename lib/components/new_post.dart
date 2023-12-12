import 'package:flutter/cupertino.dart';

class MyWidget extends StatelessWidget {
  final String message;
  final String user;
  //final String time;
  const MyWidget({super.key,
  required this.message,
  required this.user,
  //required this.time
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}