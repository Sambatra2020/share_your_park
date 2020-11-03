import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/main.dart';
import 'package:share_your_park/services/auth.dart';
import 'package:share_your_park/views/screens/checkbox.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool checked = true;
  String currentEmail;
  String currentPassword;
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
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.55, top: screenHeight * 0.05),
                  child: Text('Bonjour',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Quicksand')),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: screenWidth * 0.51, top: screenHeight * 0.12),
                    child: Image.asset(
                      'assets/images/revoir.png',
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.5,
                      alignment: Alignment.bottomRight,
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
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFF008D))),
                          prefixIcon:
                              Icon(Entypo.mail, color: Color(0xFFFF008D)),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xFFFF008D))),
                      validator: (val) => EmailValidator.validate(val) == false
                          ? 'Email obligatoire'
                          : null,
                      onChanged: (val) => setState(() => currentEmail = val),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.8,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color: Color(0xFFFF008D))),
                          prefixIcon:Icon(Entypo.lock, color: Color(0xFFFF008D)),
                          labelText: 'Mot de passe',
                          labelStyle: TextStyle(
                            color: Color(0xFFFF008D),
                          )),
                      validator: (val) =>
                          val.isEmpty || val.length < 6 ? 'obligatoire' : null,
                      onChanged: (val) => setState(() => currentPassword = val),
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
                          if (_formkey.currentState.validate()) {
                            var result = _auth.registerWithEmailAndPassword(
                                currentEmail, currentPassword);
                               
                            if (result != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                            }
                          }
                        },
                        child: Text(
                          'Connexion',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: (90 / screenHeight) * 100,
                              fontFamily: 'Quicksand'),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
