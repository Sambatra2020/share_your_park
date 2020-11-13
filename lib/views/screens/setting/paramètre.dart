import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/views/screens/condition_util.dart';
import 'package:share_your_park/views/screens/setting/autosetting.dart';
import 'package:share_your_park/views/screens/setting/confidentialit%C3%A9.dart';

class Parametre extends StatefulWidget {
  @override
  _ParametreState createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
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
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.08, left: screenWidth * 0.29),
                        child: Icon(FontAwesome.cog,
                            color: Colors.white70, size: 42)),
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.08, left: screenWidth * 0.03),
                      child: Text('Paramètre ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: (100 / screenWidth) * 100,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.15,
                        left: screenWidth * 0.10,
                      ),
                      child: Image.asset('assets/dessins/notification.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.15, left: screenWidth * 0.08),
                      child: RichText(
                        text: TextSpan(
                            text: 'Paramètre de confidentialité',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 60 / screenWidth * 100),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Confidentialte()));
                              }),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.10,
                      ),
                      child: Image.asset('assets/dessins/taxi.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.03, left: screenWidth * 0.07),
                      child: RichText(
                        text: TextSpan(
                            text: 'Mon véhicule',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 60 / screenWidth * 100),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AutoSetting()));
                              }),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.10,
                      ),
                      child: Image.asset('assets/dessins/swap.png'),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.03, left: screenWidth * 0.08),
                        child: RichText(
                          text: TextSpan(
                              text: 'Conditions d\'utilisations de l\'app',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 60 / screenWidth * 100),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ConditionUtil()));
                                }),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.10,
                      ),
                      child: Image.asset('assets/dessins/show.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.03, left: screenWidth * 0.07),
                      child: Text('Règles de confidentialités de l\'app',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: (60 / screenWidth) * 100)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.10,
                      ),
                      child: Image.asset('assets/dessins/danger.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.03, left: screenWidth * 0.07),
                      child: Text('Signaler un problème',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: (60 / screenWidth) * 100)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.10,
                      ),
                      child: Image.asset('assets/dessins/logout.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.03, left: screenWidth * 0.09),
                      child: RichText(
                        text: TextSpan(
                            text: 'Déconnexion',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: (60 / screenWidth) * 100),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                SystemNavigator.pop();
                              }),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.10,
                      ),
                      child: Image.asset('assets/dessins/fill.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.03, left: screenWidth * 0.09),
                      child: Text('A propos',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: (60 / screenWidth) * 100)),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ),
        floatingActionButton: Container(
            margin: EdgeInsets.only(top: screenWidth * 0.05),
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
