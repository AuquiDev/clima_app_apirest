import 'package:clima_app_apirest/pages/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Clima',
      home: HomePages(),
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme()
      ),
    );
  }
}