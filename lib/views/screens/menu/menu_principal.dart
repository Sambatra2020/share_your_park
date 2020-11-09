import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_screenutil/screenutil.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/views/screens/menu/menu_item.dart';

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
                          left: width * 9 / 100, top: height * 2 / 100),
                      child: Stack(children: [
                        CircleAvatar(
                          foregroundColor: Colors.black,
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.grey,
                          ),
                          radius: height * 7 / 100,
                        ),
                        Align(
                            alignment: Alignment(-1, 1),
                            child: Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                              ),
                            )),
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
                        padding: EdgeInsets.only(
                            top: height * 4 / 100, left: width * 0.1 * 100)),
                    MenuItem(
                      icon: FontAwesome.user,
                      title: "Mes Informations",
                    ),
                    MenuItem(
                      icon: FontAwesome.file_text,
                      title: "Mes Stats",
                    ),
                    MenuItem(
                      icon: FontAwesome.send,
                      title: "Parrainage",
                    ),
                    MenuItem(
                      icon: FontAwesome.sun_o,
                      title: "Parametre",
                    ),
                    MenuItem(
                      icon: FontAwesome.map_marker,
                      title: "Mes trajets",
                    ),
                    MenuItem(
                      icon: FontAwesome.commenting,
                      title: "F A Q",
                    ),
                    MenuItem(
                      icon: FontAwesome.info_circle,
                      title: "Offres",
                    ),
                  ],
                ),
              ),
              Container(
                height: 350,
                width: 240,
                margin: EdgeInsets.only(
                    left: width * 71 / 100, top: height * 28 / 100),
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
