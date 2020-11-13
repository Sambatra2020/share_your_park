import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/views/screens/setting/infoedit.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
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
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.065,
                          left: screenWidth * 0.3,
                          bottom: screenHeight * 0.01),
                      child: Icon(
                        FontAwesome.user,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.065,
                            left: screenWidth * 0.03,
                            bottom: screenHeight * 0.01),
                        child: Text(
                          'Mes \ninformations',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (140 / screenHeight) * 100,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Stack(children: [
                  Container(
                    width: screenWidth * 0.75,
                    height: screenHeight * 0.7,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          //spreadRadius: 1,
                          blurRadius: 15,
                          offset:
                              Offset(0.0, 0.75), // changes position of shadow
                        ),
                      ],
                      color: Color(0xFFDB1B8D),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                left: screenWidth * 0.1),
                            child: Text(
                              'Numéro de téléphone',
                              style: TextStyle(
                                color: Color(0xFFC8C8C8),
                                fontSize: (100 / screenHeight) * 100,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                left: screenWidth * 0.1),
                            child: Text(
                              'Numéro de téléphone',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (100 / screenHeight) * 100,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFC8C8C8),
                            thickness: screenHeight * 0.001,
                            indent: screenWidth * 0.1,
                            endIndent: screenWidth * 0.1,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                left: screenWidth * 0.1),
                            child: Text(
                              'Adresse Email',
                              style: TextStyle(
                                color: Color(0xFFC8C8C8),
                                fontSize: (100 / screenHeight) * 100,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                left: screenWidth * 0.1),
                            child: Text(
                              'Adresse Email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (100 / screenHeight) * 100,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFC8C8C8),
                            thickness: screenHeight * 0.001,
                            indent: screenWidth * 0.1,
                            endIndent: screenWidth * 0.1,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                left: screenWidth * 0.1),
                            child: Text(
                              'Type de véhicule',
                              style: TextStyle(
                                color: Color(0xFFC8C8C8),
                                fontSize: (100 / screenHeight) * 100,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                left: screenWidth * 0.1),
                            child: Text(
                              'Type de véhicule',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (100 / screenHeight) * 100,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFC8C8C8),
                            thickness: screenHeight * 0.001,
                            indent: screenWidth * 0.1,
                            endIndent: screenWidth * 0.1,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                left: screenWidth * 0.1),
                            child: Text(
                              'Taille de véhicule',
                              style: TextStyle(
                                color: Color(0xFFC8C8C8),
                                fontSize: (100 / screenHeight) * 100,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.03,
                                left: screenWidth * 0.1),
                            child: Text(
                              'Taille de véhicule',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (100 / screenHeight) * 100,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Divider(
                            color: Color(0xFFC8C8C8),
                            thickness: screenHeight * 0.001,
                            indent: screenWidth * 0.1,
                            endIndent: screenWidth * 0.1,
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenWidth * 0.65, bottom: screenHeight * 0.15),
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.15,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InfoEdit()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Colors.white,
                        elevation: 10,
                        child: Icon(Entypo.dots_three_horizontal,
                            color: Color(0xFFFF008D))),
                  ),
                ]),
              ],
            )),
          ),
        ),
        floatingActionButton: Container(
            margin: EdgeInsets.only(top: screenWidth * 0.05),
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
