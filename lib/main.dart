import 'package:flutter/material.dart';
import 'package:share_your_park/tuto/acceuil.dart';
//import 'package:share_your_park/tuto/second.dart';
//import 'package:share_your_park/tuto/acceuil.dart';
//import 'package:share_your_park/tuto/tutoOne.dart';
//import 'package:share_your_park/tuto/tutoOne.dart';
//import 'package:share_your_park/tuto/tutoTwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SYP Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Acceuil(),
    );
  }
}
