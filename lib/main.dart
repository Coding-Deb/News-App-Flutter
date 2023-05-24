
import 'package:e_news_app/SRC/Screens/Login-Signup/login.dart';
import 'package:e_news_app/SRC/Screens/mainscreen.dart';
import 'package:e_news_app/SRC/Themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     theme: Themes.lighttheme,
     darkTheme: Themes.darktheme,
     themeMode: ThemeMode.system,
      home: const Login(),
    );
  }
}

