
import 'package:ecommerce_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
      title: "TripMate",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xffF7F8FC),
      ),
    
    );
  }
}
