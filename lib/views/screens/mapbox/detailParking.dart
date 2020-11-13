import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/controllers/controller.dart';
import 'package:share_your_park/models/parking.dart';
import 'package:share_your_park/views/screens/mapbox/slideListParking.dart';
import 'package:share_your_park/views/screens/menu/menu_principal.dart';

class ListeParking extends StatefulWidget {
  final List<Parking> listObjetParking;
  ListeParking({this.listObjetParking});
  @override
  _ListeParkingState createState() => _ListeParkingState(listObjetParking);
}

class _ListeParkingState extends State<ListeParking> {
  List<Parking> listObjetParking;
  _ListeParkingState(this.listObjetParking);

  Controller controller = Controller();

  String latDepart = '48.853846';
  String lngDepart = '2.311969';
  String latParking;
  String lngParking;

  List<LatLng> points = [];
  @override
  Widget build(BuildContext context) {
    if (latParking == null) {
      print(listObjetParking.length);
      setState(() {
        latParking = this.listObjetParking[0].lng.toString();
        lngParking = this.listObjetParking[0].lat.toString();
      });
    }

    Future<List<LatLng>> result =
        controller.getListLatLng(latDepart, lngDepart, latParking, lngParking);
    result.then((value) {
      setState(() {
        points = value;
      });
    });

    return Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(top: 15),
          child: FloatingActionButton(
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MenuPrincipal()));
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Stack(children: [
          Container(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(48.853846, 2.311969),
                minZoom: 18,
                maxZoom: 64,
              ),
              layers: [
                tileLayerOptions,
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                        points: points,
                        color: Color(0xFFFF008D),
                        strokeWidth: 6.0)
                  ],
                ),
                MarkerLayerOptions(markers: [
                  Marker(
                      width: 40.0,
                      height: 40.0,
                      point: LatLng(
                          double.parse(latDepart), double.parse(lngDepart)),
                      builder: (context) => Container(
                          child:
                              Image.asset("assets/images/positionDepart.png"))),
                  Marker(
                      width: 40.0,
                      height: 40.0,
                      point: LatLng(
                          double.parse(latParking), double.parse(lngParking)),
                      builder: (context) => Container(
                          child:
                              Image.asset("assets/images/positionVert.png"))),
                ]),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-0.9, -0.85),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              width: 130,
              height: 54,
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 49.0,
                    lineWidth: 5.0,
                    percent: 0.6,
                    center: Image.asset("assets/images/positionDepart.png"),
                    backgroundColor: Colors.white,
                    progressColor: Color(0xFFFF008D),
                  ),
                  Text(
                    ' 12 720XP',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SlideListParking(
                            listObjetParking: this.listObjetParking)));
              },
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
              child: Icon(FontAwesome.rss, color: Color(0xFFFFFFFF)),
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
