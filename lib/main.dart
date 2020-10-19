import 'package:flutter/material.dart';
import 'package:share_your_park/screens/views/acceuil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Acceuil(),
      debugShowCheckedModeBanner: false,
    );
  }
}


