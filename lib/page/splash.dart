import 'package:flutter/material.dart';
import 'package:todo_app_firestore_example/page/dashboard.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:async';

import 'home_page.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: AnimatedSplashScreen(
        duration: 3000,
          splash: Text(
            'SL-DANCER APP',
            style: TextStyle(
            fontSize: 35.0,
            color: Colors.white,
            fontWeight: FontWeight.bold

            ),
          ),
          nextScreen: Dashboard(),
          splashTransition: SplashTransition.scaleTransition,
          // pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.blue
      ),
    );
  }
}
