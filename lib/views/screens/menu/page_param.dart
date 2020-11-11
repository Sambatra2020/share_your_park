import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/views/screens/setting/confidentialit%C3%A9.dart';

class PageParam extends StatefulWidget {
  @override
  _PageParamState createState() => _PageParamState();
}

class _PageParamState extends State<PageParam> {
  @override
  Widget build(BuildContext context) {
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
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.065,
                            left: screenWidth * 0.3,
                            bottom: screenHeight * 0.01),
                        child: Icon(
                          FontAwesome.cog,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.065,
                            left: screenWidth * 0.03,
                            bottom: screenHeight * 0.01),
                        child: Text(
                          'Paramètre',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: (140 / screenHeight) * 100),
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, top: 25),
                      child: Column(children: [
                        Row(
                          children: [
                            Icon(FontAwesome.bell, color: Colors.white),
                            SizedBox(width: 20),
                            RichText(
                                text: TextSpan(
                                    text: "Paramètre de confidentialité",
                                    style: TextStyle(
                                        fontFamily: kfontFamily,
                                        color: kTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Confidentialte()));
                                      }))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(FontAwesome.car, color: Colors.white),
                            SizedBox(width: 20),
                            RichText(
                                text: TextSpan(
                                    text: "Mon véhicule",
                                    style: TextStyle(
                                        fontFamily: kfontFamily,
                                        color: kTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(FontAwesome.sort, color: Colors.white),
                            SizedBox(width: 20),
                            RichText(
                                text: TextSpan(
                                    text: "Condition d'utilisation de l'app",
                                    style: TextStyle(
                                        fontFamily: kfontFamily,
                                        color: kTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(FontAwesome.eye, color: Colors.white),
                            SizedBox(width: 20),
                            RichText(
                                text: TextSpan(
                                    text: "Règle de confidentialité de l'app",
                                    style: TextStyle(
                                        fontFamily: kfontFamily,
                                        color: kTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(FontAwesome.exclamation_triangle,
                                color: Colors.white),
                            SizedBox(width: 20),
                            RichText(
                                text: TextSpan(
                                    text: "Signaler un problème",
                                    style: TextStyle(
                                        fontFamily: kfontFamily,
                                        color: kTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(FontAwesome.sign_out, color: Colors.white),
                            SizedBox(width: 20),
                            RichText(
                                text: TextSpan(
                                    text: "Déconnexion",
                                    style: TextStyle(
                                        fontFamily: kfontFamily,
                                        color: kTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}))
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(children: [
                          Icon(FontAwesome.star_half_empty,
                              color: Colors.white),
                          SizedBox(width: 20),
                          RichText(
                              text: TextSpan(
                                  text: "A propos",
                                  style: TextStyle(
                                      fontFamily: kfontFamily,
                                      color: kTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}))
                        ])
                      ]))
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.15,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
              fillColor: Color(0xFFFF008D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              elevation: 8.0,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop);
  }
}
