import 'package:flutter/material.dart';
import 'package:share_your_park/screens/views/login.dart';
import 'package:share_your_park/screens/views/register.dart';
import 'package:share_your_park/screens/views/signup.dart';
import 'package:share_your_park/screens/views/validate.dart';

class Acceuil extends StatefulWidget {
  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Register(),
    );
  }
}
