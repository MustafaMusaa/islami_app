import 'package:flutter/material.dart';
import 'package:islami_app/splash_screen.dart';
import 'package:islami_app/theme_data.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName :(context)=> SplashScreen(),
        HomeScreen.routeName :(context)=> HomeScreen(),
      },

    );
  }
}

