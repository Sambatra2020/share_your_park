import 'package:flutter/material.dart';
import 'package:share_your_park/screens/views/acceuil.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
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


