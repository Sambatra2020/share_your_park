import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
              child: Container(
          child: Column(
            children: [
              Container(
                height: size.height/2,
                
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                       colors: [
                    Color(0xFFFF008D),
                    Color(0xFFFF41AA),
                  ])
                ),
                child: Align(
                  alignment: Alignment(0, 0),
                  //alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                     SizedBox(height: 35,),
                          Align(alignment: Alignment(-0.7,-1),
                              //padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Bonjour',
                              style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Quicksand')
                              ),
                          ),
                          
                          Align(
                            alignment: Alignment(1.1, 1),
                            child: Image.asset(
                              'assets/revoir.png',
                              height: 240, width: 220
                              ),
                          )
                    ]
                  ) ,
                  ),
              ),
              Container(
                    height: 10.0,
                    color: Color(0xFFA3005A),
                    ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical:5, horizontal: 50),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Entypo.message, color: Color(0xFFFF008D),),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color(0xFFFF008D),)

                      ),
                    ),
                  ),

              ],
              )
            
                   
            ],
          ),
          
        ),
      ),
      
    );
  }
}