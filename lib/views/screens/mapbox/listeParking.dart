import 'package:flutter/material.dart';
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
          child: Icon(Icons.ac_unit),
          onPressed: () async {
            await controller.getListParkingData('2.339432', '48.862056');
          }),
      body: controller.creationCarteMapBox(
          '48.862056', '2.339432', '48.866029', '2.340308'),
    );
  }
}
