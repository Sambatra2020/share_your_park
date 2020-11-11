import 'package:flutter/material.dart';

class Parrainage extends StatefulWidget {
  @override
  _ParrainageState createState() => _ParrainageState();
}

class _ParrainageState extends State<Parrainage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
          child: Align(
              child: Container(
            child: Column(children: [
              Container(
                height: size.height * 0.58,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 2,
                    colors: [Color(0xFFFF008D), Color(0xFFAD206E)],
                  ),
                ),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.001),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/Send.png'),
                        Text(
                          'Parrainage',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: (95 / screenWidth) * 100),
                        )
                      ],
                    ),
                  ),
                  Center(child: Image.asset('assets/icons/parain.png'))
                ]),
              ),
              Container(
                height: screenHeight * 0.02,
                color: Color(0xFFA3005A),
              ),
              Center(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenWidth * 0.02),
                    child: Text(
                      'Tout le monde y gagne !',
                      style: TextStyle(
                          color: Color(0xFFFF008D),
                          fontSize: (80 / screenWidth) * 100),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenWidth * 0.01),
                    child: Text(
                      ' 😎',
                      style: TextStyle(fontSize: (80 / screenWidth) * 100),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenWidth * 0.01),
                    child: Text(
                      ' Invitez vos amis avec votre code \npersonnel \nQuand ils feront leur premier trajet, vous \nrecevrez chacun des points pour \nmonter en niveau sur SYP',
                      style: TextStyle(fontSize: (60 / screenWidth) * 100),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )),
              Container(
                margin: EdgeInsets.only(top: screenWidth * 0.035),
                height: screenHeight * 0.08,
                width: screenWidth * 0.7,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: Color(0xFFFF008D),
                    onPressed: () {},
                    child: Text(
                      'Partager 🚀',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (110 / screenHeight) * 100,
                          fontFamily: 'Quicksand'),
                    )),
              ),
            ]),
          )),
        )),
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
