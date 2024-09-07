import 'dart:async';

import 'package:doctors_appointment/BottomNavBar/bottomNav.dart';
import 'package:doctors_appointment/home/homeScreen.dart';
import 'package:doctors_appointment/login/login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  bool loginState;
  Splashscreen({required this.loginState, super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  (widget.loginState == true) ? const BottomNav() : LoginPage(),
            )));
    return Image.asset(
      'assets/images/splashImage1.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      
    );
  }
}
