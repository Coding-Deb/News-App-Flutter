import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData lighttheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white70,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // Creates border
            color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.grey[350],
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
        titleMedium: GoogleFonts.meowScript(
            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
        titleSmall: GoogleFonts.meowScript(
            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
           displaySmall: GoogleFonts.meowScript(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
            displayMedium: GoogleFonts.quicksand(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey[300]),
            
      ),
      iconTheme: IconThemeData(color: Colors.black));
  static ThemeData darktheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), // Creates border
            color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: GoogleFonts.meowScript(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey),
        titleSmall: GoogleFonts.meowScript(
            fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
             displaySmall: GoogleFonts.meowScript(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
            displayMedium: GoogleFonts.quicksand(
            fontSize: 15, fontWeight: FontWeight.bold, color: Color(0x73000000)),
      ),
      iconTheme: IconThemeData(color: Colors.white));
}
 