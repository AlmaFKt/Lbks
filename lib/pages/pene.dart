import 'package:flutter/material.dart';

class MyPene extends StatefulWidget {
  const MyPene({super.key});

  @override
  State<MyPene> createState() => _MyPeneState();
}

class _MyPeneState extends State<MyPene> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
            Text("PENE")

        ],
      ),
    );
  }
}