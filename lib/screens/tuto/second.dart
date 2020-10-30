import 'package:flutter/material.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/screens/tuto/screen_slide.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
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
        child: Column(
          children: [
            Center(
              child: Container(
                //color: Colors.indigo,
                margin: EdgeInsets.only(
                    top: height * 0.055, left: width * 0.1, right: width * 0.1),
                child: Text(
                  "SYP c’est l’appli qui t’aide à\ntrouver ton stationement\n😎🚗",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: kfontFamily,
                      fontSize: width * 0.055,
                      color: kTextColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Align(
              child: Container(
                child: Image.asset('assets/images/Group 51.png'),
                width: (width * 75) / 100,
                height: (height * 70) / 100,
              ),
            ),
            Container(
              width: width * 0.7,
              height: height * 0.08, decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 0.01)),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(height * 0.05)),
                  color: Color(0xFFFF008D),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScreenSlide()));
                  },
                  child: Text("Commencer",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: width * 0.05,
                      ))),
            ),
          ],
        ),
      ),
    ));
  }
}
