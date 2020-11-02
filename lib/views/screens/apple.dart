import 'package:flutter/material.dart';

class Apple extends StatefulWidget {
  @override
  _AppleState createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  //colors: [Color(0xFF008D), Color(0xFF8DCC)
                  colors: [
                Color(0xFFFF008D),
                Color(0xFFFF6EBE),
              ])
              //color: Colors.pink
              ),
              child: Align(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.4 ),
                      child: Image.asset('assets/icons/syp.png')
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.2,
                        left: screenWidth * 0.2 ),
                      child: Image.asset('assets/icons/dispo.png',
                      width: screenWidth * 0.8,)
                    ),
                  ],
                  )
              ),
      ),
    );
  }
}