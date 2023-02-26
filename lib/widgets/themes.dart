import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: Theme.of(context).textTheme,
        // appBarTheme: AppBarTheme(
        //   color: Colors.white,
        //   elevation: 0,
        //   //  iconTheme: const IconThemeData(color: Colors.black),
        //   //toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        //   titleTextStyle: Theme.of(context).textTheme.headline6,
        // ),
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
