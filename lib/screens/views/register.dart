import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                     margin: EdgeInsets.only(left:45),
                     child: Image.asset(
                     'assets/bon.png',
                      width: screenWidth * 0.5, height: screenHeight * 0.45,
                     alignment: Alignment.center
                    ),
                  ),
                
                SizedBox(height: screenHeight * 0.01),
                
                Container(
                  height:  screenHeight * 0.06,
                  width: screenWidth * 0.60,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.black,
                    onPressed: () {},
                    
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(FlutterIcons.apple_mco, color: Colors.white),
                        SizedBox(width: screenWidth * 0.02,
                        ),
                        Text('Connecter avec Apple',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Roboto'),
                                textAlign: TextAlign.start,
                                )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Container(
                  height:  screenHeight * 0.06,
                  width: screenWidth * 0.6,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Color(0xFF5071C3),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                        'assets/icons/fb 1.png',
                        width: 16, height: 16,
                          ),
                        Text('Connecter avec Facebook',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Roboto'))
                      ],
                    ),
                  ),
                ),
               SizedBox(height: screenHeight * 0.015),
                Container(
                   height:  screenHeight * 0.06,
                  width: screenWidth * 0.6,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                            'assets/icons/google.png',
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: screenWidth * 0.02,),
                        Text('Connecter avec google',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Roboto'))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Container(
                   height:  screenHeight * 0.06,
                  width: screenWidth * 0.6,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.white,
                    onPressed: () { Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())
                          );
                        },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                            'assets/icons/Message.png',
                            width: 22,
                            height: 22,
                          ),
                        SizedBox(width: screenWidth * 0.02,),
                        Text('Connecter avec Email',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Roboto'))
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
                Text(
                  'On partagera jamais rien sans',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Roboto', fontSize: 12),
                ),
                Text(
                  'ta permission',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Roboto', fontSize: 12),
                ),
              ],
            )),
      ),
      
      floatingActionButton: Container(
        height: screenHeight * 0.05,
        width: screenWidth * 0.15,
        child: RawMaterialButton(
          onPressed: () {},
           child: Icon(Icons.arrow_back, color: Colors.white, size: 28,),
          fillColor: Color(0xFFFF008D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          elevation: 8.0,
          )
        ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop
    );
  }
}
