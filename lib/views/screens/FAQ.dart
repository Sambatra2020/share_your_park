import 'package:flutter/material.dart';
import 'package:share_your_park/const.dart';

class PolitiConfid extends StatefulWidget {
  @override
  _PolitiConfidState createState() => _PolitiConfidState();
}

class _PolitiConfidState extends State<PolitiConfid> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: kbordercolor,
          title: Text("FAQ",
              style: TextStyle(
                  fontFamily: kfontFamily,
                  fontSize: screenWidth * 6 / 100,
                  letterSpacing: 4),
              textAlign: TextAlign.center),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
            ),
            child: Align(
              child: Column(
                children: [
                  Text(""),
                ],
              ),
            ),
          ),
        ])));
  }
}
