import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/services/auth.dart';

import 'login.dart';
import 'signup.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ignore: unused_field
  final AuthService _auth = AuthService();

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
                    margin: EdgeInsets.only(left: screenWidth * 0.08),
                    child: Image.asset('assets/bon.png',
                        width: screenWidth * 0.5,
                        height: screenHeight * 0.45,
                        alignment: Alignment.center),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(FlutterIcons.apple_mco, color: Colors.white),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          FittedBox(
                            child: Text(
                              'Connecter avec Apple',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (36 / screenWidth) * 100,
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
                    width: screenWidth * 0.6,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Color(0xFF5071C3),
                      onPressed: () async {
                        var res = await _auth.signInWithFacebook();
                        if (res == null) print("error");
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
                          ),
                          FittedBox(
                              child: Text('Connecter avec Facebook',
                                style: TextStyle(
                                    color: Colors.white,
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
                    width: screenWidth * 0.6,
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
                            width: screenWidth * 0.02,
                          ),
                          FittedBox(
                             child: Text('Connecter avec google',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: (36 / screenWidth) * 100,
                                    fontFamily: 'Roboto')),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Container(
                    height: screenHeight * 0.06,
                    width: screenWidth * 0.6,
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
                            width: screenWidth * 0.015,
                          ),
                          FittedBox(
                              child: Text('Connecter avec Email',
                                style: TextStyle(
                                    color: Colors.black,
                                   fontSize: (36 / screenWidth) * 100,
                                    fontFamily: 'Roboto')),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  FittedBox(
                    //fit:BoxFit.fitWidth,
                    child: Text(
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
