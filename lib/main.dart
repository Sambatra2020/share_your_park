import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:share_your_park/screens/views/acceuil.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:share_your_park/screens/views/baseCarteMap.dart';
import 'package:share_your_park/screens/views/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
