import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/screens/views/signup.dart';
import 'package:share_your_park/screens/views/checkbox.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checked = true;
  void change(bool isChecked) {
    setState(() {
      checked = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 2,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFFFF008D),
                    Color(0xFFFF6EBE),
                    //Color(0xFFFF41AA),
                  ])),
              child: Column(children: [
                Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.35,
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.55, top: screenHeight * 0.05),
                  child: FittedBox(
                    fit:BoxFit.fitWidth,
                        child: Text('Bonjour',
                        style: TextStyle(
                            color: Colors.white,
                            //fontSize: 30,
                            fontFamily: 'Quicksand')),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: screenWidth * 0.51, top: screenHeight * 0.12),
                    child: FittedBox(
                      fit:BoxFit.fitWidth,
                           child: Image.asset(
                        'assets/images/revoir.png',
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.5,
                        alignment: Alignment.bottomRight,
                      ),
                    ))
              ]),
            ),

            Container(
              height: screenHeight * 0.02,
              color: Color(0xFFA3005A),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            //formulaire
            Column(
              children: [
                Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.75,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF008D))),
                        prefixIcon: Icon(Entypo.mail, color: Color(0xFFFF008D)),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color(0xFFFF008D))),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.75,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF008D))),
                        prefixIcon: Icon(Entypo.lock, color: Color(0xFFFF008D)),
                        hintText: 'Mot de passe',
                        hintStyle: TextStyle(
                          color: Color(0xFFFF008D),
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.65, top: screenHeight * 0.02),
                  child: CheckBox(
                    isChecked: true,
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),
                //bouton connexion
                Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.7,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Color(0xFFFF008D),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        'Connexion',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:  screenWidth * 0.05,
                            fontFamily: 'Quicksand'),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
