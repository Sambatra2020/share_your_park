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
            backgroundColor: Color(0xFFFF008D),
            child: Icon(
              Entypo.menu,
              color: Color(0xFFFFFFFF),
            ),
            onPressed: () async {
              await controller.getListParkingData('2.339432', '48.862056');
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Stack(children: [
          Container(
            child: controller.creationCarteMapBox(
                '48.862056', '2.339432', '48.866029', '2.340308'),
          ),
          Stack(
            children: [
              MaterialButton(
                minWidth: 20,
                //padding: EdgeInsets.all(10),
                color: Color(0xFFFF008D),
                child: Icon(Icons.search, color: Color(0xFFFFFFFF)),
                onPressed: () {},
              ),
            ],
          )
        ]));
  }
}
