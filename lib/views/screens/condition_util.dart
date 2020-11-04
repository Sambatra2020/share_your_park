import 'package:flutter/material.dart';
import 'package:share_your_park/const.dart';

class ConditionUtil extends StatefulWidget {
  @override
  _ConditionUtilState createState() => _ConditionUtilState();
}

class _ConditionUtilState extends State<ConditionUtil> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: size.height / 2,
            width: size.width,
            decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
            ),
            child: Align(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 8 / 100,
                          left: screenWidth * 70 / 100),
                      child: FloatingActionButton(
                          backgroundColor: Color(0xFFFF008D),
                          child: Icon(Icons.menu),
                          onPressed: () {})),
                  Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.10),
                      child: Image.asset(
                        'assets/images/revoir.png',
                        height: screenHeight * 0.20,
                        width: screenWidth * 0.9,
                        alignment: Alignment.center,
                      ))
                ],
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.02,
            color: Color(0xFFA3005A),
          ),
        ]),
      ),
    );
  }
}
