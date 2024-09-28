import 'package:bmi_app/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
       canvasColor: Colors.black,
       iconTheme: IconThemeData(color:Colors.white),
        textTheme: TextTheme(
          headlineLarge:  GoogleFonts.abhayaLibre(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)
,headlineMedium:  TextStyle(fontWeight: FontWeight.w800,fontSize: 29,color: Colors.white)
        )
      ),

      home: MyHomePage() );
  }
}