import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AutoSetting extends StatefulWidget {
  @override
  _AutoSettingState createState() => _AutoSettingState();
}

class _AutoSettingState extends State<AutoSetting> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Align(
              child: Container(
                  child: Column(children: [
        Container(
          height: size.height / 2,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFFFF008D),
                Color(0xFFFF6EBE),
              ])),
          child: Align(
            child: Column(children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.05, left: screenWidth * 0.1),
                      child: Icon(FontAwesome.cog,
                          color: Colors.white70, size: 32)),
                  Container(
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.03, left: screenWidth * 0.015),
                    child: Column(
                      children: [
                        Text('Paramètre de',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: (100 / screenWidth) * 100,
                            )),
                        Text('confidentialité',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: (100 / screenWidth) * 100,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  //top: screenHeight * 0.01,
                  margin: EdgeInsets.only(
                    left: screenWidth * 0.1,
                  ),
                  //color: Colors.blue,
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.5,
                  child: Align(
                      child: Image.asset(
                    'assets/images/carseepy.png',
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.8,
                  )),
                ),
              ),
              //SizedBox(height: screenHeight * 0.01),
              Center(
                  child: Text("Paramètre véhicule",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (144 / screenHeight) * 100,
                          fontFamily: 'Quicksand')))
            ]),
          ),
        ),
        Container(
          height: screenHeight * 0.02,
          color: Color(0xFFA3005A),
        ),
        Container(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.05, right: screenWidth * 0.35),
              child: Text('Paramètre de votre appareil',
                  style: TextStyle(
                    fontSize: (90 / screenHeight) * 100,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.015, right: screenWidth * 0.4),
              child: Text('Localisation : app active',
                  style: TextStyle(
                    fontSize: (90 / screenHeight) * 100,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.02, left: screenWidth * 0.05),
              child: Text(
                  'Syp utilise les services de localisation de votre \nappareil pour vous proposer un service plus fiable \net pertinent. ( en savoir plus )',
                  style: TextStyle(
                    fontSize: (90 / screenHeight) * 100,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.03, right: screenWidth * 0.42),
              child: Text('partage de ma position',
                  style: TextStyle(
                    fontSize: (90 / screenHeight) * 100,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.015, right: screenWidth * 0.23),
              child: Text('partager ma position en temps réel',
                  style: TextStyle(
                    fontSize: (90 / screenHeight) * 100,
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              height: 2,
              color: Color(0xFFFF008D),
              width: screenWidth * 0.8,
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Container(
              height: screenHeight * 0.08,
              width: screenWidth * 0.7,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: Color(0xFFFF008D),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Retour",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                        fontFamily: 'Quicksand'),
                  )),
            ),
          ],
        ))
      ])))),
      floatingActionButton: Container(
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(50),
                  topEnd: Radius.circular(50),
                  bottomStart: Radius.circular(50),
                  bottomEnd: Radius.zero)),
          backgroundColor: Color(0xFFFF008D),
          onPressed: () {},
          child: Icon(Entypo.menu),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
