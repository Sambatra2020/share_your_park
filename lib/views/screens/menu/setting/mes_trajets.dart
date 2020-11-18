import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/const.dart';

class MesTrajets extends StatefulWidget {
  @override
  _MesTrajetsState createState() => _MesTrajetsState();
}

class _MesTrajetsState extends State<MesTrajets> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFFF008D),
              Color(0xFFFF6EBE),
            ])),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.0, left: 10.0),
              child: Row(
                children: [
                  //ajout bouton retour
                  Container(
                      margin: EdgeInsets.only(right: 40.0),
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
                  Icon(
                    Entypo.location_pin,
                    color: Color(0xFFFFFFFF),
                    size: 40.0,
                  ),
                  Text(
                    'Mes trajets',
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 18.0,
                        fontFamily: kfontFamily),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, top: 40.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '13:58',
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 24.0,
                            fontFamily: kfontFamily),
                      )
                    ],
                  ),
                  Text(''),
                ],
              ),
            ),
            Container(),
            Row(
              children: [],
            ),
            Container(),
            Row(
              children: [],
            ),
            Container(),
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
