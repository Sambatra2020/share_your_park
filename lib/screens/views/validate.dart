import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:share_your_park/models/user.dart' as userModel;
import 'package:share_your_park/services/database.dart';

import 'package:share_your_park/screens/views/checkbox.dart';

class Validate extends StatefulWidget {
  final userModel.UserInformation newUser;
  Validate({this.newUser});
  @override
  _ValidateState createState() => _ValidateState(newUser);
}

class _ValidateState extends State<Validate> {
  userModel.UserInformation newUser;
  _ValidateState(this.newUser);
  bool checked1 = false;
  bool checked2 = false;
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<userModel.User>(context);
    //DatabaseService databaseService = DatabaseService(uid: user.userId);
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print("check1 : $checked1");

    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: size.height * 2 / 3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0xFFFF008D),
                        Color(0xFFFF6EBE),
                      ])),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                //top: 20, right:85
                                top: screenHeight * 0.035,
                                right: screenWidth * 0.25),
                            //color: Colors.amber,
                            child: Image.asset('assets/images/validate.png')),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  left: screenWidth * 0.06,
                                  right: screenWidth * 0.02,
                                ),
                                child: Image.asset(
                                    'assets/icons/validverrou.png')),
                            FittedBox(
                              child: Text(
                                  "Vos données personnelles sont \nuniquement utilisées pour adapter \nl'application à vos besoins",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand',
                                   fontSize: (40 / screenWidth) * 100,
                                    wordSpacing: 1,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  left: screenWidth * 0.06,
                                  right: screenWidth * 0.02,
                                ),
                                child:
                                    Image.asset('assets/icons/validcheck.png')),
                            FittedBox(
                                child: Text(
                                  "Nous ne partageons pas à nos \ntiers vos données à des fins \ncommerciales",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand',
                                    fontSize: (40 / screenWidth) * 100,
                                    wordSpacing: 1,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  left: screenWidth * 0.06,
                                  right: screenWidth * 0.02,
                                ),
                                child:
                                    Image.asset('assets/icons/validsend.png')),
                            FittedBox(
                               child: Text(
                                  "Nous utilisons uniquement vos \ndonnées pour échanger avec vous\nsyp vos données restent privée",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand',
                                    fontSize: (40 / screenWidth) * 100,
                                    wordSpacing: 1,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.015,
                        ),
                        FittedBox( 
                          child: RichText(
                            text: TextSpan(
                                text:
                                    'Lire la politique de confidentialité et les CGV',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Quicksand',
                                    fontSize: (36 / screenWidth) * 100,
                                    wordSpacing: 2,
                                    decoration: TextDecoration.underline)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                            //left: 30, right: 15, top: 30
                            left: screenWidth * 0.1,
                            right: screenWidth * 0.01,
                            top: screenWidth * 0.07,
                          ),
                          child: checkbox1()),
                      Container(
                        margin: EdgeInsets.only(top: screenWidth * 0.07),
                        child: FittedBox(
                            child: Text(
                            "J'accepte de partager avec syp mes \ninfos afin d'établir mon profil de syppeur",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                              fontSize: (36 / screenWidth) * 100,
                              wordSpacing: 2,
                            ),
                          ),
                        ),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: screenWidth * 0.1,
                          right: screenWidth * 0.01,
                          top: screenWidth * 0.06,
                        ),
                        child: checkbox2(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: screenWidth * 0.06),
                        child: FittedBox(
                            child: Text(
                            "J'ai lu et j'accepte les conditions \ngénérales d'utilisation",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Quicksand',
                              fontSize: (36 / screenWidth) * 100,
                              wordSpacing: 2,
                            ),
                          ),
                        ),
                      )
                    ]),
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  width: screenWidth * 0.45,
                  height: screenHeight * 0.08,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Color(0xFFFF008D),
                      onPressed: () {
                        if (checked1 && checked2) {
                          print(newUser.firstName);
                          print(newUser.lastName);
                          print(newUser.adress);
                          print(newUser.email);
                          print(newUser.codePostal);
                          print(newUser.tailleDeVehicule);
                          print(newUser.typeDeVehicule);
                          // databaseService.updateUserData(newUser);
                          SystemNavigator.pop();
                        }
                      },
                      child: Text(
                        "Valider",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:  screenHeight * 0.03,
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

  Widget checkbox1() {
    return GestureDetector(
        onTap: () {
          setState(() {
            checked1 = !checked1;
          });
        },
        child: AnimatedContainer(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: checked1 ? Colors.grey[300] : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border:
                  checked1 ? null : Border.all(color: Colors.grey, width: 2.0)),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          child: checked1
              ? Icon(
                  Entypo.check,
                  color: Colors.black,
                )
              : null,
        ));
  }

  Widget checkbox2() {
    return GestureDetector(
        onTap: () {
          setState(() {
            checked2 = !checked2;
          });
        },
        child: AnimatedContainer(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: checked2 ? Colors.grey[300] : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border:
                  checked2 ? null : Border.all(color: Colors.grey, width: 2.0)),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          child: checked2
              ? Icon(
                  Entypo.check,
                  color: Colors.black,
                )
              : null,
        ));
  }
}
