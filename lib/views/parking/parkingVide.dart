import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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
          TileLayerOptions(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/sambatra/ckgbwa2x706vs1ap3n6qcaptj/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA',
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA',
                'id': 'mapbox.mapbox-streets-v7'
              }),
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
            polylines: points,
          )
        ],
      ),
    );
  }
}
