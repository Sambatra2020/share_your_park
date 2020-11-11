import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/controllers/controller.dart';

class ListeParking extends StatefulWidget {
  @override
  _ListeParkingState createState() => _ListeParkingState();
}

class _ListeParkingState extends State<ListeParking> {
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
            onPressed: () async {
              await controller.getListParkingData('2.339432', '48.862056');
              print("${controller.listeParking.length}");
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Stack(children: [
          Container(
            child: controller.creationCarteMapBox(
                '48.862056', '2.339432', '48.866029', '2.340308'),
          ),
          Align(
            alignment: Alignment(-0.9, 0.5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: 20,
              //padding: EdgeInsets.all(10),
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
              //padding: EdgeInsets.all(10),
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
              //padding: EdgeInsets.all(10),
              color: Color(0xFFFF008D),
              child:
                  Text("j'y vais", style: TextStyle(color: Color(0xFFFFFFFF))),
              onPressed: () {},
            ),
          ),
        ]));
  }
}
