import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/const.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItem({Key key, this.icon, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: (width * 6 / 100),
          ),
          SizedBox(
            width: (width * 4 / 100),
          ),
          Text(
            title,
            style: TextStyle(
                color: kTextColor,
                fontFamily: kfontFamily,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
