import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
       body: SingleChildScrollView(
        child: Align(
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
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(left:40),
                      child: Align(
                        child: Image.asset('assets/images/bien.png', height: 240, width: 220)
                      ),
                    ),
                    )
                ),
                Container(
                      height: 10.0,
                      color: Color(0xFFA3005A),
                      ),
                Column(
                      children: [
                      
                           Container(
                             margin: EdgeInsets.symmetric(vertical:5, horizontal: 120),
                             child: TextField(
                                decoration: InputDecoration(
                             
                              enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                              prefixIcon: Icon(Entypo.user, color: Color(0xFFFF008D)),
                              labelText: 'Nom',
                              labelStyle: TextStyle(color: Color(0xFFFF008D),
                               
                              ),
                              ),
                        ),
                           ),
                            Container(
                             margin: EdgeInsets.symmetric(vertical:5, horizontal: 50),
                             child: TextField(
                                decoration: InputDecoration(
                             
                              enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                              prefixIcon: Icon(Entypo.mail, color: Color(0xFFFF008D)),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Color(0xFFFF008D),
                               
                              ),
                              ),
                        ),
                           ),
                           Container(
                             margin: EdgeInsets.symmetric(vertical:5, horizontal: 50),
                             child: TextField(
                                decoration: InputDecoration(
                             
                              enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                              prefixIcon: Icon(Entypo.lock, color: Color(0xFFFF008D)),
                              labelText: 'Mot de passe',
                              labelStyle: TextStyle(color: Color(0xFFFF008D),
                               
                              ),
                              ),
                        ),
                           ),
                           Container(
                        width: 200,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          color: Color(0xFFFF008D),
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Signup())
                                );
                          }, 
                          child: Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Quicksand'
                            ),
                          
                          )
                          ),
                      ),
                         
                      ]       
                ),
              ]
            ),
            ),
        ),
      ),
    );
  }
}