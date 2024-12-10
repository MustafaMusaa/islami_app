import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash_screen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      backgroundColor: Color(0xff29384D),
      body: Container(
        decoration: BoxDecoration(

            image: DecorationImage(
              image: AssetImage("assets/images/splash_screen.png"),
              fit: BoxFit.cover,)),
      ),
    );
  }
}
