import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Paranotif extends StatefulWidget {
  @override
  _ParanotifState createState() => _ParanotifState();
}

class _ParanotifState extends State<Paranotif> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                child: Column(
                  children: [
                    Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: screenHeight * 0.1, left: screenWidth * 0.1),
                            child: Icon(
                              FontAwesome.cog, 
                              color: Colors.white70,
                              size: 46 
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: screenHeight * 0.1, left: screenWidth * 0.015),
                            child: Column(
                              children: [
                                Text(
                                  'Paramètre de',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: (100 / screenWidth) * 100,
                                    )
                                  ),
                                  Text(
                                  'notification',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (120 / screenWidth) * 100,
                                    )
                                  ),
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
                        margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.01),
                        child: Text(
                          'Mise à jour du compteet des stationnements',
                          style: TextStyle(
                            fontSize: (90 / screenHeight) * 100, 
                            )
                          ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.015, right: screenWidth * 0.33),
                        child: Text(
                          'Notification push ou sms',
                          style: TextStyle(
                            fontSize: (90 / screenHeight) * 100, 
                            )
                          ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.03),
                        child: Text(
                          'Comprend des notifications sur le statut d\'un \nstationnement et des mises à jour concernant \nvotre localisation vis à vis de ce dernier',
                          style: TextStyle(
                            fontSize: (90 / screenHeight) * 100, 
                            )
                          ),
                      ),
                      ],
                    )
                )
                  ]
                )
              )
        ),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          backgroundColor: Color(0xFFFF008D),
          onPressed: (){},
          child: Icon(Entypo.menu),
          ),
         ),
         floatingActionButtonLocation:  FloatingActionButtonLocation.endTop,
    );
      
    
  }
}