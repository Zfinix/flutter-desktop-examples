import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color(0XFF2C54D8);

const Color accent = Color(0xFF1373FC);

const Color alt = Color(0xffE4B36B);

const Color textColor = Color(0xFF0F1950);

const Color bgColor = Color(0xFF201F1F);

const Color darkGrey = Color(0xff292525);

const Color red = Color(0xFFD82C68);

const Color iconColor = Color(0xFF010F48);

const Color white = Colors.white;

const Color black = Colors.black;

const Color grey = Colors.grey;

themeData(context) => ThemeData(
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

darkThemeData(context) => ThemeData.dark().copyWith(
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      primaryColor: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
