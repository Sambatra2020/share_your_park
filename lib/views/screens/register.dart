import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/position_actuelle.dart';
import 'package:share_your_park/services/auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:share_your_park/views/screens/apple.dart';
// import 'package:share_your_park/views/screens/facebook.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ignore: unused_field
  final AuthService _auth = AuthService();
  final LocationServices _location = LocationServices();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
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
                                        'Allez, viens! On est bien😎',
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
                  
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.62,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Apple()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(FlutterIcons.apple_mco, color: Colors.white),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Container(
                            child: AutoSizeText(
                              'Connecter avec Apple',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (32 / screenWidth) * 100,
                                  //fontSize: screenWidth * 0.03,
                                  fontFamily: 'Roboto'),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.63,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Color(0xFF5071C3),
                      onPressed: () async {
                        var res = await _auth.signInWithFacebook();
                        if (res == null) print("error");
                        // Navigator.push(context, 
                        // MaterialPageRoute(builder: (context) => Facebook()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/icons/fb 1.png',
                            //width: 16, height: 16,
                            height: screenHeight * 0.06,
                            width: screenWidth * 0.06,
                            alignment: AlignmentDirectional(-0.5, 0),
                          ),
                          Container(
                            child: Text('Connecter avec Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: (35 / screenWidth) * 100,
                                    fontFamily: 'Roboto')),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.62,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.white,
                      onPressed: () async {
                        var res = await _auth.loginWithGoogle();
                        if (res == null) print("error");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/icons/google.png',
                            //width: 16,height: 16,
                            height: screenHeight * 0.06,
                            width: screenWidth * 0.06,
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Container(
                            child: AutoSizeText('Connecter avec google',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: (32 / screenWidth) * 100,
                                    fontFamily: 'Roboto')),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.62,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/icons/Message.png',
                            //width: 22,height: 22,
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.08,
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Container(
                            child: AutoSizeText('Connecter avec Email',
                              style: TextStyle(
                                  color: Colors.black,
                                 
                                 fontSize: (32 / screenWidth) * 100,
                                  fontFamily: 'Roboto')),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    child: AutoSizeText(
                      'On partagera jamais rien sans \nta permission',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: screenWidth * 0.04,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )),
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
/*
Container(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        ChatBubble(
                              alignment: Alignment.center,clipper: ChatBubbleClipper3(type: BubbleType.sendBubble),
                              backGroundColor: Colors.white,
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: screenWidth * 0.4,
                                      ),
                                      child: Text(
                                        'Allez, viens! On est bien',
                                        style: TextStyle(color: Color(0xFFFF008D)),
                                        )),
                                  ),
                         Image.asset('assets/seepy.png',
                          width: screenWidth * 0.5,),
                    
                      ]
                    ),
                  ),
*/