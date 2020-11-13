import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_screenutil/screenutil.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/views/screens/FAQ.dart';
import 'package:share_your_park/views/screens/setting/autosetting.dart';
//import 'package:share_your_park/views/screens/menu/menu_item.dart';
import 'package:share_your_park/views/screens/setting/infos.dart';
import 'package:share_your_park/views/screens/setting/parain.dart';

class MenuPrincipal extends StatelessWidget {
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
          padding:
              EdgeInsets.only(left: width * 2 / 100, top: height * 5 / 100),
          child: Stack(
            children: [
              Align(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Bonjour",
                        style: TextStyle(
                            fontFamily: kfontFamily,
                            color: kTextColor,
                            fontSize: height * 4 / 100,
                            fontWeight: FontWeight.normal),
                      ),
                      subtitle: Text(
                        "VALENTIN",
                        style: TextStyle(
                            fontFamily: kfontFamily,
                            color: kTextColor,
                            fontSize: height * 6 / 100,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 11 / 100, top: height * 2 / 100),
                      child: Stack(children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.grey,
                          ),
                          radius: height * 7 / 100,
                        ),
                        Positioned(
                          top: height * 0.06 / 100,
                          left: width * 0.05 / 100,
                          child: Container(
                            height: height * 4 / 100,
                            width: width * 6 / 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: width * 0.01 / 100,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.blueGrey,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 30 / 100),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "12 270 XP",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  SizedBox(width: 20),
                                  Icon(
                                    FontAwesome.star_half_empty,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "324 minutes",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    FontAwesome.clock_o,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "94 partages",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    FontAwesome.sign_out,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesome.user, color: Colors.white),
                              SizedBox(width: 20),
                              RichText(
                                  text: TextSpan(
                                      text: "Mes informations",
                                      style: TextStyle(
                                          fontFamily: kfontFamily,
                                          color: kTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Information()));
                                        })),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(FontAwesome.file_text, color: Colors.white),
                              SizedBox(width: 20),
                              Text("Mes stats",
                                  style: TextStyle(
                                      fontFamily: kfontFamily,
                                      color: kTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(FontAwesome.paper_plane_o,
                                  color: Colors.white),
                              SizedBox(width: 20),
                              RichText(
                                  text: TextSpan(
                                      text: "Parrainage",
                                      style: TextStyle(
                                          fontFamily: kfontFamily,
                                          color: kTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Parrainage()));
                                        }))
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(FontAwesome.sun_o, color: Colors.white),
                              SizedBox(width: 20),
                              RichText(
                                  text: TextSpan(
                                      text: "Paramètre",
                                      style: TextStyle(
                                          fontFamily: kfontFamily,
                                          color: kTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AutoSetting()));
                                        }))
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(FontAwesome.map_marker, color: Colors.white),
                              SizedBox(width: 20),
                              Text("Mes trajets",
                                  style: TextStyle(
                                      fontFamily: kfontFamily,
                                      color: kTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(FontAwesome.commenting, color: Colors.white),
                              SizedBox(width: 20),
                              RichText(
                                  text: TextSpan(
                                      text: "F A Q",
                                      style: TextStyle(
                                          fontFamily: kfontFamily,
                                          color: kTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PolitiConfid()));
                                        }))
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(FontAwesome.info_circle,
                                  color: Colors.white),
                              SizedBox(width: 20),
                              Text(
                                "Offres",
                                style: TextStyle(
                                    fontFamily: kfontFamily,
                                    color: kTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 65 / 100,
                width: width * 60 / 100,
                margin: EdgeInsets.only(
                    left: width * 73 / 100, top: height * 25 / 100),
                child: Align(
                  child: Image.asset("assets/images/phone.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
