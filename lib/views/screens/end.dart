import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/services/auth.dart';

class Ending extends StatefulWidget {
  @override
  _EndingState createState() => _EndingState();
}

class _EndingState extends State<Ending> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  //colors: [Color(0xFF008D), Color(0xFF8DCC)
                  colors: [
                Color(0xFFFF008D),
                Color(0xFFFF6EBE),
              ])
              //color: Colors.pink
              ),
              child: Align(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.4 ),
                      child: Image.asset('assets/icons/syp.png')
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.2,
                        left: screenWidth * 0.2 ),
                      child: Image.asset('assets/icons/ending.png',
                      width: screenWidth * 0.8,)
                    ),
                  ],
                  )
              ),
      ),
      floatingActionButton: Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.15,
            child: RawMaterialButton(
              onPressed: () async {
                await _auth.logOut();
                SystemNavigator.pop();
              },
              child: Icon(
                FontAwesome.sign_out,
                color: Colors.white,
                size: 28,
              ),
              fillColor: Color(0xFFFF008D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              elevation: 8.0,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop
    );
  }
}