import 'package:flutter/material.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/tuto/screen_slide.dart';
//import 'package:share_your_park/tuto/tutoOne.dart';

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
                margin:
                    EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
                child: Text(
                  "SYP c’est l’appli qui t’aide à trouver ton stationement 😎🚗",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: kfontFamily,
                      fontSize: 20,
                      color: kTextColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Align(
              child: Container(
                //color: Colors.black,
                margin: EdgeInsets.only(top: 5, bottom: 15),
                child: Image.asset('assets/images/Group 51.png'),
                width: (width * 75) / 100,
                height: (height * 70) / 100,
              ),
            ),
            Container(
              width: (width * 50) / 100,
              height: (height * 10) / 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: Color(0xFFFF008D),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScreenSlide()));
                  },
                  child: Text("Commencer",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 18,
                      ))),
            ),
          ],
        ),
      ),
    ));
  }
}
