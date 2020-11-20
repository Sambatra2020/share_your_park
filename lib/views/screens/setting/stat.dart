import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';

class Stat extends StatefulWidget {
  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> {
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
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/dessins/Paper.png'),
                        Text(
                          'Mes Stats',
                          style: TextStyle(
                                color: Colors.white70,
                                fontSize: (80 / screenWidth) * 100,
                              )
                          )
                      ]
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.01),
                      child: CircleAvatar(
                      backgroundColor: Color(0xFF8E0055),
                      radius: 55,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFFF008D),
                        radius: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03,),
                  Text(
                    'De temps de vie gagné \ngrâce à SYP',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.2,
                          width: screenWidth * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), 
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFD91883),
                                Color(0xFFBD0069),])
                            ),
                            child: Column(
                              children: [
                                Image.asset('assets/dessins/co2.png', width: screenWidth * 0.15, height: screenHeight * 0.1,),
                                Text(
                                  'CO2 economisé',
                                  style: TextStyle(color: Colors.white, fontSize: (80 / screenHeight) * 100,)
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: screenHeight * 0.01, bottom: screenHeight * 0.01),
                                    height: screenHeight * 0.01,
                                    width: screenWidth * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Text(
                                  '8kg non émis',
                                  style: TextStyle(color: Colors.white, fontSize: (80 / screenHeight) * 100,)
                                  ),

                              ],)
                        ),
                        SizedBox(width: screenWidth * 0.05,),
                        Container(
                          height: screenHeight * 0.2,
                          width: screenWidth * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), 
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFD91883),
                                Color(0xFFBD0069),
                              ])
                            ),
                            child: Column(
                              children: [
                                Image.asset('assets/dessins/co2.png', width: screenWidth * 0.15, height: screenHeight * 0.1,),
                                Text(
                                  'CO2 economisé',
                                  style: TextStyle(color: Colors.white, fontSize: (80 / screenHeight) * 100,)
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: screenHeight * 0.01, bottom: screenHeight * 0.01),
                                    height: screenHeight * 0.01,
                                    width: screenWidth * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Text(
                                  '8kg non émis',
                                  style: TextStyle(color: Colors.white, fontSize: (80 / screenHeight) * 100,)
                                  ),

                              ],)
                        ),
                      ]
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChatBubble(
                            clipper: ChatBubbleClipper3(type: BubbleType.sendBubble),
                            backGroundColor: Colors.white,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: screenWidth * 0.4,
                                    ),
                                    child: Text(
                                      'I\'m a bubble',
                                      style: TextStyle(color: Color(0xFFFF008D)),
                                      )),
                                ),
                          /*Container(
                            height: screenHeight * 0.07,
                            width: screenWidth * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(25),
                                  topEnd: Radius.circular(25),
                                  bottomStart: Radius.circular(25 ),
                                  bottomEnd: Radius.zero)
                              ),
                          ),*/
                          Image.asset('assets/dessins/stat.png',  height: screenHeight * 0.15),
                        ],
                      ),
                    ),
                    Container(
                      child: Image.asset('assets/dessins/graph.png', height: screenHeight * 0.25,),
                    ),

                ],
                )
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
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop
    );
  }
}

//D91883
//BD0069