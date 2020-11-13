import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:share_your_park/const.dart';

class ParkingVide extends StatefulWidget {
  @override
  _ParkingVideState createState() => _ParkingVideState();
}

class _ParkingVideState extends State<ParkingVide> {
  var points = <LatLng>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(center: LatLng(48.862056, 2.339432), zoom: 14),
        layers: [
          tileLayerOptions,
          MarkerLayerOptions(markers: [
            Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(48.866029, 2.340308),
                builder: (context) => Container(
                    child: Image.asset("assets/images/positionVert.png"))),
            Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(48.862056, 2.339432),
                builder: (context) => Container(
                    child: Image.asset("assets/images/positionDepart.png"))),
          ]),
          PolylineLayerOptions(
            polylines: [
              Polyline(
                  points: points, color: Color(0xFFFF008D), strokeWidth: 2.0)
            ],
          )
        ],
      ),
    );
  }
}
