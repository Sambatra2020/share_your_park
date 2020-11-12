import 'package:flutter/material.dart';

class Offre extends StatefulWidget {
  @override
  _OffreState createState() => _OffreState();
}

class _OffreState extends State<Offre> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 2,
                colors: [Color(0xFFFF008D), Color(0xFFAD206E)],
              ),
            ),

            child: Align(
              child: Padding(
                padding:EdgeInsets.only(top: screenHeight * 0.65, left: screenWidth * 0.2) ,
                child: Image.asset('assets/dessins/offre.png',width: screenWidth * 0.8,),
                )
            ),
        ),

      ),
    );
  }
}