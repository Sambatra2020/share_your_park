import 'package:flutter/material.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/tuto/tutoOne.dart';

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
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  "SYP c’est l’appli qui t’aide à trouver ton stationement 😎🚗",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Align(
              child: Container(
                //color: Colors.black,
                margin: EdgeInsets.only(top: 5),
                child: Image.asset('assets/images/Group 51.png'),
                width: 270,
                height: 370,
              ),
            ),
            Container(
              width: 170,
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: Color(0xFFFF008D),
                  onPressed: () {
                    Navigator.pushNamed(context, TutoOne.pageName);
                  },
                  child: Text("Commencer",
                      style: TextStyle(
                        color: Color(0xFFF1EFF1),
                        fontSize: 16,
                      ))),
            ),
          ],
        ),
      ),
    ));
  }
}
