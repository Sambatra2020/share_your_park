import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/screens/views/signup.dart';

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
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        //child: Align(
        //child: Container(
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
                    //Color(0xFFFF41AA),
                  ])),
              child: Column(children: [
                //SizedBox(height: 35,),
                Container(
                  margin: EdgeInsets.only(right: 220, top: 45),
                  //alignment: Alignment(-0.7,-1),
                  //color: Colors.amber,
                  child: Text('Bonjour',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Quicksand')),
                ),

                Container(
                    //color: Colors.amber,
                    margin: EdgeInsets.only(left: 200, top: 30),
                    child: Image.asset(
                      'assets/images/revoir.png',
                      height: 205,
                      width: 220,
                      alignment: Alignment.bottomRight,
                    ))
              ]),
            ),
            Container(
              height: 10.0,
              color: Color(0xFFA3005A),
            ),
            SizedBox(
              height: 35,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        /*icon: Icon(Entypo.message, color: Color(0xFFFF008D),),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xFFFF008D),)*/
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF008D))),
                        prefixIcon: Icon(Entypo.mail, color: Color(0xFFFF008D)),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color(0xFFFF008D))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      //prefix: Image.asset('assets/Message.png', color: Color(0xFFFF008D), width: 20,height: 20,),
                      /* prefixIconConstraints: BoxConstraints(
                                                              minHeight: 20,
                                                              minWidth: 20,
                                                            ),*/
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF008D))),
                      prefixIcon: Icon(Entypo.lock, color: Color(0xFFFF008D)),
                      hintText: 'Mot de passe',
                      hintStyle: TextStyle(
                        color: Color(0xFFFF008D),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.8, 1),
                  child: Checkbox(
                      activeColor: Color(0xFFFF008D),
                      checkColor: Colors.white,
                      value: checked,
                      onChanged: change),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: 240,
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
                            fontSize: 18,
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
