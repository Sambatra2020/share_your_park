import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/tuto/second.dart';

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
            margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
            child: Text(
              "Pour finir, le pins de localisation de la place change de couleur... 🚦",
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
            margin: EdgeInsets.only(top: 5),
            child: Image.asset('assets/images/Group 55.png'),
            width: (width * 75) / 100,
            height: (height * 60) / 100,
          ),
        ),
        Center(
          child: Container(
            //color: Colors.indigo,
            margin: EdgeInsets.all(5),
            child: Text(
              "Cela represente de code couleur pour la durée de vie de la place de stationnement. Vert ; elle vient d’être partagée, Rouge, cela fait longtemps...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: kfontFamily,
                  fontSize: 18,
                  color: kTextColor,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.all(5),
            child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Second()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Icon(Icons.arrow_forward),
                )))
      ])),
    ));
  }
}
