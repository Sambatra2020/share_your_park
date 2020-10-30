import 'package:flutter/material.dart';
import 'package:share_your_park/const.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: kPrimaryGradientColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Align(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Bonjour",
                    style: TextStyle(
                        fontFamily: kfontFamily,
                        color: kTextColor,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    "VALENTINE",
                    style: TextStyle(
                        fontFamily: kfontFamily,
                        color: kTextColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
