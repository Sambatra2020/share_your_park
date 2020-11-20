import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/models/trajet.dart';
import 'package:share_your_park/services/database.dart';

class MesTrajets extends StatefulWidget {
  @override
  _MesTrajetsState createState() => _MesTrajetsState();
}

class _MesTrajetsState extends State<MesTrajets> {
  List<Trajet> liste = [];
  @override
  Widget build(BuildContext context) {
    DatabaseService databaseService = DatabaseService(uid: "nata");
    Future<List<Trajet>> listeTrajet = databaseService.readDatatrajet();
    listeTrajet.then((value) {
      setState(() {
        liste = value;
      });
    });
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          children: [
            Container(
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
            SizedBox(
              height: 20,
            )
          ],
        ),
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFF008D),
        actions: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Entypo.location_pin,
                      color: Color(0xFFFFFFFF),
                      size: 40.0,
                    ),
                    Text(
                      'Mes trajets',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 18.0,
                          fontFamily: kfontFamily),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.0, top: 40.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '13:58',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 24.0,
                              fontFamily: kfontFamily),
                        ),
                        Text(
                          'minutes',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 10.0,
                              fontFamily: kfontFamily),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Passé à chercher un stationnement',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 14.0,
                          fontFamily: kfontFamily),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFFF008D),
              Color(0xFFFF6EBE),
            ])),
        child: ListView.builder(
          itemCount: liste.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black,
                    ),
                    height: 120.0,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 10.0, left: 20.0, bottom: 40.0),
                    child: Row(
                      children: [
                        Text(
                          liste[index].time.substring(0, 19),
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 14.0,
                              fontFamily: kfontFamily),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Stationnement trouvé en ' +
                              liste[index].duration.toString() +
                              ' min',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 13.0,
                              fontFamily: kfontFamily),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
