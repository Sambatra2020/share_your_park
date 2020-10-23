import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_your_park/tuto/second.dart';

import '../const.dart';

class Acceuil extends StatefulWidget {
  Acceuil({Key key}) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
        context,
        // ignore: missing_required_param
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            transitionsBuilder: (context, animation, animationTime, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return Second();
            }));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: kPrimaryGradientColor,
          ),
          child: Align(
            child: Column(
              children: [
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 130),
                      //color: Colors.amber,
                      child: Image.asset(
                        'assets/images/tuto_one.png',
                        width: 250,
                        height: 210,
                      )),
                ),
                Align(
                    child: Container(
                  //color: Colors.cyan,
                  margin: EdgeInsets.only(top: 50, left: 50),
                  child: Image.asset('assets/images/tuto_two.png'),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
