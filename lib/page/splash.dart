import 'package:flutter/material.dart';
import 'package:todo_app_firestore_example/page/dashboard.dart';
import 'dart:async';

import 'home_page.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Dashboard(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "SL-Danser",
          style: TextStyle(
            fontSize: 35.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
