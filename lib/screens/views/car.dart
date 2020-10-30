import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/screens/views/validate.dart';
import 'package:share_your_park/models/user.dart' as userModel;

class Car extends StatefulWidget {
  final userModel.UserInformation newUser;
  Car({this.newUser});

  @override
  _CarState createState() => _CarState(newUser);
}

class _CarState extends State<Car> {
  userModel.UserInformation newUser;
  _CarState(this.newUser);
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
                    child: Column(children: [
                      Container(
                        //color: Colors.amber,
                        //margin:  EdgeInsets.only(left:25, top: 15),
                        child: Align(
                            child: Image.asset(
                          'assets/images/car.png',
                          //height: 300, width: 280,
                          height: screenHeight * 0.5,
                          width: screenWidth * 0.75,
                          alignment: Alignment(0, 1),
                        )),
                      ),
                    ]),
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
                  //taille de voiture
                  Align(
                      alignment: Alignment(-0.7, 0),
                      //color: Colors.orange,
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
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
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
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
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
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
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
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
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
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            //side: BorderSide(width: 2.0, color: Colors.pink)
                          ),
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
                        newUser.setTypeDeVehicule("Electrique");
                        newUser.setTailleDeVehicule("Medium");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Validate(
                                      newUser: newUser,
                                    )));
                      },
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: (90 / screenHeight) * 100,
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
