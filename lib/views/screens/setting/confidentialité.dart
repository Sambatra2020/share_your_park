import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Confidentialte extends StatefulWidget {
  @override
  _ConfidentialteState createState() => _ConfidentialteState();
}

class _ConfidentialteState extends State<Confidentialte> {
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 2,
                colors: [Color(0xFFFF008D), Color(0xFFAD206E)],
              ),
            ),
            child: Align(
                child: Column(children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.1, left: screenWidth * 0.1),
                      child: Icon(FontAwesome.cog,
                          color: Colors.white70, size: 46)),
                  Container(
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.1, left: screenWidth * 0.015),
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
              Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.07),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.05,
                            right: screenWidth * 0.33),
                        child: Text('Paramètre de votre appareil',
                            style: TextStyle(
                              fontSize: (90 / screenHeight) * 100,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.015,
                            right: screenWidth * 0.4),
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
                            top: screenHeight * 0.03,
                            right: screenWidth * 0.41),
                        child: Text('partage de ma position',
                            style: TextStyle(
                              fontSize: (90 / screenHeight) * 100,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.015,
                            right: screenWidth * 0.21),
                        child: Text('partager ma position en temps réel',
                            style: TextStyle(
                              fontSize: (90 / screenHeight) * 100,
                            )),
                      ),
                    ],
                  ))
            ]))),
      ),
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
