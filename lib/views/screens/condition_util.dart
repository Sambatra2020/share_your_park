import 'package:flutter/material.dart';

import '../../const.dart';

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
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: kbordercolor,
          title: Text("Condition d'utilisation",
              style: TextStyle(
                  fontFamily: kfontFamily, fontSize: screenWidth * 6 / 100),
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
