import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:http/http.dart' as http;

class MapCarteBase extends StatefulWidget {
  @override
  _MapCarteBaseState createState() => _MapCarteBaseState();
}

class _MapCarteBaseState extends State<MapCarteBase> {
  MapboxMapController mapController;
  String lngDepart = '2.339432';
  String latDepart = '48.862056';
  String lngArriver = '2.339561';
  String latArriver = '48.863616';
  LatLng center = LatLng(48.862056, 2.339432);
  LatLng parkingPosition = LatLng(48.863616, 2.339561);
  List<LatLng> points = [
    LatLng(48.862056, 2.339432),
    LatLng(48.862261, 2.339185),
    LatLng(48.863531, 2.339754),
    LatLng(48.863616, 2.339561)
  ];
  final styleCarte = 'mapbox://styles/sambatra/ckgbwa2x706vs1ap3n6qcaptj';

  //initialisation map
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
    _addSymbols(center, 'positionDepart');
    _addSymbols(parkingPosition, 'positionVert');
    _drawRoutes();
  }

  //creation carte
  MapboxMap creaMapa() {
    return MapboxMap(
        styleString: styleCarte,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 14));
  }

  //draw routes
  void _drawRoutes() {
    mapController.addLine(LineOptions(
      geometry: points,
      lineColor: '#FF008D',
      lineWidth: 5.0,
    ));
  }

  // Add a symbol (marker)
  void _addSymbols(LatLng position, String image) {
    mapController.addSymbol(
      SymbolOptions(
        iconImage: image,
        iconSize: 1.0,
        //position symbol
        geometry: position,
      ),
    );
  }

  void _onStyleLoaded() {
    addImageFromAsset("positionDepart", "assets/positionDepart.png");
    addImageFromAsset("positionJaune", "assets/positionJaune.png");
    addImageFromAsset("positionRouge", "assets/positionRouge.png");
    addImageFromAsset("positionVert", "assets/positionVert.png");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  FloatingActionButton _boutonSymbols() {
    return FloatingActionButton(
        child: Icon(Icons.add_location), onPressed: () {});
  }

  //fonction get le routes
  /*Future<List<LatLng>> _getRoutes() async {
    var coords;
    var response = await http.get(
        'https://api.mapbox.com/directions/v5/mapbox.cycling/' +
            lngDepart +
            ',' +
            latDepart +
            ';'+lngArriver+','+latArriver+'?access_token = <pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA>',
            (data){
              coords = Line.;
            });
    return coords;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: creaMapa(),
      floatingActionButton: _boutonSymbols(),
    );
  }
}
