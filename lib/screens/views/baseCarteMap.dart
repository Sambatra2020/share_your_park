import 'dart:convert';
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
  //variable

  MapboxMapController mapController;
  String lngDepart = '2.339432';
  String latDepart = '48.862056';
  String lngArriver = '2.342597';
  String latArriver = '48.863569';
  LatLng center = LatLng(48.862056, 2.339432);
  LatLng parkingPosition = LatLng(48.865409, 2.342597);

  final styleCarte = 'mapbox://styles/sambatra/ckgbwa2x706vs1ap3n6qcaptj';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: creaMapa(),
      //floatingActionButton: _boutonSymbols(),
    );
  }

  // Add a symbol (marker)
  Future _addSymbols(
      LatLng position, String image, MapboxMapController mapControllerI) async {
    await mapControllerI.addSymbol(
      SymbolOptions(
        iconImage: image,
        iconSize: 1.0,
        geometry: position,
      ),
    );
  }

  /// Convert an assets image to string name and Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  //
  void _onStyleLoaded() {
    addImageFromAsset("positionDepart", "assets/images/positionDepart.png");
    addImageFromAsset("positionJaune", "assets/images/positionJaune.png");
    addImageFromAsset("positionRouge", "assets/images/positionRouge.png");
    addImageFromAsset("positionVert", "assets/images/positionVert.png");
  }

  //fonction get le routes
  Future getCoodsAndDrawRoutes() async {
    List<LatLng> chemin = [];
    //requete http qui retourne un response
    http.Response response = await http.get(
        "https://api.mapbox.com/directions/v5/mapbox/driving/" +
            lngDepart +
            "," +
            latDepart +
            ";" +
            lngArriver +
            "," +
            latArriver +
            "?geometries=geojson&access_token=pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA");

    //convert data response to json
    Map data = json.decode(response.body);
    var routes = data['routes'];
    var duration = routes[0]['duration'];
    var distance = routes[0]['distance'];
    var geometry = routes[0]['geometry'];

    var coordinates = geometry['coordinates'];

    //recuperation listes coordonné des chemin
    setState(() {
      chemin.add(center);
    });

    for (int i = 0; i < coordinates.length; i++) {
      var coords = coordinates[i];
      double lng = coords[0];
      double lat = coords[1];
      LatLng coo = LatLng(lat, lng);
      setState(() {
        chemin.add(coo);
      });
    }
    setState(() {
      chemin.add(parkingPosition);
    });

    _drawRoutes(chemin);

    debugPrint('voici les donnes $routes');
    debugPrint('voici la duree du trajet: $duration');
    debugPrint('voici la distance: $distance');
  }

  //draw routes
  void _drawRoutes(List<LatLng> ch) {
    mapController.addLine(LineOptions(
      geometry: ch,
      lineColor: '#FF008D',
      lineWidth: 5.0,
    ));
  }

  /*FloatingActionButton _boutonSymbols() {
    return FloatingActionButton(
        child: Icon(Icons.add_location), onPressed: () {});
  }*/

  //initialisation map
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    getCoodsAndDrawRoutes();
    _onStyleLoaded();
    _addSymbols(center, 'positionDepart', mapController);
    _addSymbols(parkingPosition, 'positionVert', mapController);
  }

  //creation carte
  MapboxMap creaMapa() {
    return MapboxMap(
        styleString: styleCarte,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 14));
  }
}
