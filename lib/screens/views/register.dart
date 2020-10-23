import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/auth.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
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
                  SizedBox(height: 55),

                  Container(
                    margin: EdgeInsets.only(left: 45),
                    child: Image.asset('assets/bon.png',
                        width: 230, height: 230, alignment: Alignment.center),
                  ),

                  SizedBox(height: 25),
                  //Text("Enregistre-toi!", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'Quicksand' ))

                  Container(
                    height: 35,
                    width: 190,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.black,
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Icon(FlutterIcons.apple_mco,
                                  color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Connecter avec Apple',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Roboto'))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    width: 190,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Color(0xFF5071C3),
                      onPressed: () async {
                          var res = await _auth.signInWithFacebook();
                          if ( res == null )
                            print("error");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/icons/fb 1.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                          Text('Connecter avec Facebook',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Roboto'))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    width: 190,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.white,
                      onPressed: () async {
                        var res = await _auth.loginWithGoogle();
                        if ( res == null )
                          print("error");
                      },  
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/icons/google.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                          Text('Connecter avec google',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto'))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 35,
                    width: 190,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Colors.white,
                      onPressed: () {
                        /*Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));*/
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/icons/Message.png',
                              width: 22,
                              height: 22,
                            ),
                          ),
                          Text('Connecter avec Email',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto'))
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'On partagera jamais rien sans',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 10),
                  ),
                  Text(
                    'ta permission',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 10),
                  ),
                ],
              )),
        ),
        // ignore: missing_required_param
        floatingActionButton: Container(
            width: 45,
            height: 35,
            child: RawMaterialButton(
              onPressed: () {},
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
