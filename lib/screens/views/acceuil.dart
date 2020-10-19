import 'package:flutter/material.dart';
import 'package:share_your_park/screens/views/register.dart';

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