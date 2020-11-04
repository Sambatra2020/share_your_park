import 'package:flutter/material.dart';

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
                        child: Align(
                            child: Image.asset(
                          'assets/images/carseepy.png',
                          height: screenHeight * 0.4,
                          width: screenWidth * 0.75,
                          alignment: Alignment(0, 1),
                        )),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Center(
                            child: Text("Paramètre véhicule",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (144 / screenHeight) * 100,
                                    fontFamily: 'Quicksand')))
                    ]),
                  ),
                ),
              ]
            )
          )
        )
      )
    );
  }
}