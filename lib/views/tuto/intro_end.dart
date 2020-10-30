import 'package:flutter/material.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/main.dart';

class IntroEnd extends StatefulWidget {
  @override
  _IntroEndState createState() => _IntroEndState();
}

class _IntroEndState extends State<IntroEnd> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: kPrimaryGradientColor,
        ),
        child: Align(
            child: Column(children: [
          Center(
            child: Container(
              //color: Colors.indigo,
              margin: EdgeInsets.only(
                  top: (height * 6) / 100,
                  left: (width * 6) / 100,
                  right: (width * 6) / 100,
                  bottom: (height * 1.5) / 100),
              child: Text(
                "Pour finir, le pins de localisation de la place change de couleur... 🚦",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: kfontFamily,
                    fontSize: (width * 5.5) / 100,
                    color: kTextColor,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Align(
            child: Container(
              child: Image.asset('assets/images/Group 55.png'),
              width: (width * 75) / 100,
              height: (height * 55) / 100,
            ),
          ),
          Center(
            child: Container(
              //color: Colors.indigo,
              margin: EdgeInsets.only(
                  left: (width * 4) / 100, right: (width * 4) / 100),
              child: Text(
                "Cela represente de code couleur pour la\ndurée de vie de la place de stationnement.\nVert ; elle vient d’être partagée,\nRouge, cela fait longtemps...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: kfontFamily,
                    fontSize: (width * 4.1) / 100,
                    color: kTextColor,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ])),
      ),
      floatingActionButton: Container(
          height: (height * 0.07),
          width: (width * 0.23),
          child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Color(0xFFFF008D),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.06)),
                child: Icon(Icons.arrow_forward),
              ))),
    );
  }
}
