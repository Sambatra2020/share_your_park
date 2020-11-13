import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/controllers/controller.dart';

class Partir extends StatefulWidget {
  @override
  _PartirState createState() => _PartirState();
}

class _PartirState extends State<Partir> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(50),
                  topEnd: Radius.circular(50),
                  bottomStart: Radius.circular(50),
                  bottomEnd: Radius.zero)),
          backgroundColor: Color(0xFFFF008D),
          child: Icon(
            Entypo.menu,
            color: Color(0xFFFFFFFF),
          ),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Stack(
        children: <Widget>[
          Container(
            child: controller.mapBoxVide(48.862056, 2.331332),
          ),
          Align(
            alignment: Alignment(-0.9, 0.5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: 20,
              color: Color(0xFFFF008D),
              child: Icon(Icons.search, color: Color(0xFFFFFFFF)),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment(0.9, 0.5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: 20,
              color: Color(0xFFFF008D),
              child: Icon(Icons.rss_feed, color: Color(0xFFFFFFFF)),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              minWidth: 150,
              color: Color(0xFFFF008D),
              child: Text("Je me gare",
                  style: TextStyle(color: kTextColor, fontSize: 12)),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
