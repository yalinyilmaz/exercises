import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color.fromARGB(255, 192, 192, 192),
    //fontFamily: GoogleFonts.inter().fontFamily,
    cardTheme: CardTheme(
        color: Colors.white,
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 192, 192, 192),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        elevation: 10,
        modalElevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38), topRight: Radius.circular(38)))),
    appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 192, 192, 192),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor:
                MaterialStateProperty.all(Colors.grey))),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.black,
      selectionHandleColor: Colors.black,
    ),
    inputDecorationTheme:  InputDecorationTheme(
        contentPadding:const  EdgeInsets.symmetric(vertical: 0,horizontal: 20),
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide:BorderSide.none,
        ),
        hintStyle: const TextStyle(color: Colors.grey)),
  );
}
