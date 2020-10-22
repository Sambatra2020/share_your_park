import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:share_your_park/const.dart';

class TutoOne extends StatefulWidget {
  static const pageName = "TutoOne";
  @override
  _TutoOneState createState() => _TutoOneState();
}

class _TutoOneState extends State<TutoOne> {
  // ignore: unused_field
  final int _numPages = 5;
  final PageController _pageController = PageController(initialPage: 0);
  // ignore: unused_field
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: kPrimaryGradientColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 600.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "SYP c’est l’appli qui t’aide à trouver ton stationement 😎🚗",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Center(
                            child: Image(
                              image: AssetImage('assets/images/Group 51.png'),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          //eto veh?
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
