import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/models/user.dart' as userModel;
import 'package:share_your_park/views/screens/validate.dart';

class Car extends StatefulWidget {
  final userModel.UserInformation newUser;
  Car({this.newUser});

  @override
  _CarState createState() => _CarState(newUser);
}

class _CarState extends State<Car> {
  userModel.UserInformation newUser;
  _CarState(this.newUser);
  String typeVehicule = '';
  String tailleVehicule = '';
  bool isSelectedElectrique = false;
  bool isSelectedThermique = false;
  bool isSelectedSmall = false;
  bool isSelectedMedium = false;
  bool isSelectedLarge = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          child: Container(
            child: Column(
              children: [
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
                  child: Center(
                    Container(
                    child:  Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChatBubble(
                          margin: EdgeInsets.only(top: screenHeight * 0.1),
                              alignment: Alignment.center,clipper: ChatBubbleClipper3(type: BubbleType.sendBubble),
                              backGroundColor: Colors.white,
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: screenWidth * 0.45,
                                      ),
                                      child: Text(
                                        'Chouette ! Un nouveau copain💖',
                                        style: TextStyle(color: Color(0xFFFF008D)),
                                        )),
                          ),
                          SizedBox(height: screenHeight * 0.01,),
                          Image.asset('assets/images/seepy.png',
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.2
                          ),

                      ],
                      ),
                  ),
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.02,
                  color: Color(0xFFA3005A),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),

                Column(children: [
                  //taille voiture
                  Align(
                      alignment: Alignment(-0.7, 0),
                      child: Text(
                        "Type de véhicule",
                        style: TextStyle(
                          color: Color(0xFFFF008D),
                          fontFamily: 'Arial',
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      )),
                ]),

                Container(
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.01, bottom: screenHeight * 0.02),
                  child: Align(
                      child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: screenWidth * 0.15),
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.1,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              isSelectedElectrique = true;
                              isSelectedThermique = false;
                              typeVehicule = 'Electrique';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(
                                color: isSelectedElectrique
                                    ? kbordercolor
                                    : Colors.transparent,
                                width: 1,
                              )),
                          color: Colors.white,
                          child: Column(children: [
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Image.asset(
                              'assets/images/taxijaune.png',
                              alignment: Alignment.center,
                            ),
                            Text(
                              'Electrique',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.015),
                            )
                          ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: screenWidth * 0.02),
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.1,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              isSelectedThermique = true;
                              isSelectedElectrique = false;
                              typeVehicule = 'Thermique';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(
                                color: isSelectedThermique
                                    ? kbordercolor
                                    : Colors.transparent,
                                width: 1,
                              )),
                          color: Colors.white,
                          child: Column(children: [
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Image.asset(
                              'assets/icons/taxigris.png',
                              alignment: Alignment.center,
                            ),
                            Text(
                              'Thermique',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.015),
                            )
                          ]),
                        ),
                      ),
                    ],
                  )),
                ),

                Container(
                  height: 2,
                  color: Color(0xFFFF008D),
                  width: screenWidth * 0.8,
                  margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                ),
                //taille de voiture
                Align(
                  alignment: Alignment(-0.7, 0),
                  //color: Colors.orange,
                  child: Text(
                    "Taille de voiture",
                    style: TextStyle(
                      color: Color(0xFFFF008D),
                      fontFamily: 'Arial',
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.01, bottom: screenHeight * 0.02),
                  child: Align(
                      child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: screenWidth * 0.15),
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              isSelectedSmall = true;
                              isSelectedMedium = false;
                              isSelectedLarge = false;
                              tailleVehicule = 'Small';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(
                                color: isSelectedSmall
                                    ? kbordercolor
                                    : Colors.transparent,
                                width: 1,
                              )),
                          color: Colors.white,
                          child: Column(children: [
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Image.asset(
                              'assets/images/taxijaune.png',
                              alignment: Alignment.center,
                            ),
                            Text(
                              'Small',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.015),
                            )
                          ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: screenWidth * 0.02),
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              isSelectedMedium = true;
                              isSelectedSmall = false;
                              isSelectedLarge = false;
                              tailleVehicule = 'Medium';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(
                                color: isSelectedMedium
                                    ? kbordercolor
                                    : Colors.transparent,
                                width: 1,
                              )),
                          color: Colors.white,
                          child: Column(children: [
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Image.asset(
                              'assets/icons/taxigris.png',
                              alignment: Alignment.center,
                            ),
                            Text(
                              'Mediun',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.015),
                            )
                          ]),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: screenWidth * 0.02),
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.1,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              isSelectedLarge = true;
                              isSelectedSmall = false;
                              isSelectedMedium = false;
                              tailleVehicule = 'Large';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(
                                color: isSelectedLarge
                                    ? kbordercolor
                                    : Colors.transparent,
                                width: 1,
                              )),
                          color: Colors.white,
                          child: Column(children: [
                            SizedBox(
                              height: screenHeight * 0.015,
                            ),
                            Image.asset(
                              'assets/icons/taxirouge.png',
                              alignment: Alignment.center,
                            ),
                            Text(
                              'Large',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.015),
                            )
                          ]),
                        ),
                      ),
                    ],
                  )),
                ),
                Container(
                  height: 2,
                  color: Color(0xFFFF008D),
                  width: screenWidth * 0.8,
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                //bouton inscription
                Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.7,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Color(0xFFFF008D),
                      onPressed: () {
                        if (typeVehicule != '' || tailleVehicule != '') {
                          newUser.setTypeDeVehicule(typeVehicule);
                          newUser.setTailleDeVehicule(tailleVehicule);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Validate(
                                        newUser: newUser,
                                      )
                                      )
                                      );
                        }
                      },
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                            fontFamily: 'Quicksand'),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
