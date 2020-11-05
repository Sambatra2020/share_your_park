import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:share_your_park/models/parking.dart';
import 'package:share_your_park/models/trajet.dart';

final styleCarte = 'mapbox://styles/sambatra/ckgbwa2x706vs1ap3n6qcaptj';
MapboxMapController mapController;

class Controller {
  //requette pour avoir les chemins
  Future<http.Response> getListLatLng(String latDepart, String lngDepart,
      String lngArriver, String latArriver) async {
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
    return response;
  }

  //conversion de la reponse en liste liste de double
  List<List<double>> convertReponseToListLatLng(String latDepart,
      String lngDepart, String latArriver, String lngArriver) {
    Future<http.Response> response =
        getListLatLng(latDepart, lngDepart, lngArriver, latArriver);
    List<List<double>> chemin = [];
    double latInitiale = double.parse(latDepart);
    double lngInitiale = double.parse(lngDepart);
    List<double> initiale = [latInitiale, lngInitiale];
    chemin.add(initiale);
    response.then((value) {
      Map data = json.decode(value.body);
      var routes = data['routes'];
      var geometry = routes[0]['geometry'];
      var coordinates = geometry['coordinates'];
      for (int i = 0; i < coordinates.length; i++) {
        var coords = coordinates[i];
        double lng = coords[0];
        double lat = coords[1];
        List<double> coo = [lat, lng];
        chemin.add(coo);
      }
    });
    return chemin;
  }

  //fonction qui transforme une liste de liste double en list latlng
  List<LatLng> listListDoubleToListLatlng(String latDepart, String lngDepart,
      String latArriver, String lngArriver) {
    List<List<double>> coords = convertReponseToListLatLng(
        latDepart, lngDepart, latArriver, lngArriver);
    List<LatLng> chemin = [];
    for (int i = 0; i < coords.length; i++) {
      LatLng latLng = LatLng(coords[i][0], coords[i][1]);
      chemin.add(latLng);
    }
    for (int i = 0; i < chemin.length; i++) {
      print(chemin[i]);
    }
    return chemin;
  }

  //construction trajet d'un utilisateur
  Trajet constructionTrajetUtilisateur(
      Future<http.Response> response,
      List<List<double>> coords,
      String idUtilisateur,
      int idTrajet,
      List<double> positionDepart,
      List<double> positionArriver) {
    Trajet trajet = Trajet();
    double duration;
    double distance;
    response.then((value) {
      Map data = json.decode(value.body);
      var routes = data['routes'];
      duration = routes[0]['duration'];
      distance = routes[0]['distance'];
    });

    trajet.setidTrajetId(idTrajet);
    trajet.setidUser(idUtilisateur);
    trajet.setdureeTrajet(duration);
    trajet.setdistanceTrajet(distance);
    trajet.setpositionDepart(positionDepart);
    trajet.setpositionArriver(positionArriver);
    trajet.settrajetCoords(coords);

    return trajet;
  }

  //requete vers opendatasoft pour avoir les parking
  Future<http.Response> getListParkingData(
      String latitude, String longitude) async {
    http.Response response = await http.get(
        "https://data.opendatasoft.com/api/records/1.0/search/?dataset=stationnement-sur-voie-publique-emplacements%40datailedefrance&rows=20&facet=regpri&facet=regpar&facet=typsta&facet=arrond&facet=zoneres&facet=tar&facet=locsta&facet=parite&facet=signhor&facet=signvert&facet=confsign&facet=typemob&facet=datereleve&facet=mtlast_edit_date_field&geofilter.distance=" +
            longitude +
            "%2C" +
            latitude +
            "%2C5000&format=geojson");
    return response;
  }

  //convert data response listparking to liste objet parking
  List<Parking> convertDataToListObjetParking(Future<http.Response> response) {
    List<Parking> listObjetParking = [];
    response.then((value) {
      Map data = json.decode(value.body);
      var instance = data['features'];
      for (int i = 0; i < instance.length; i++) {
        Parking parking = Parking();
        parking.setId(i + 1);
        parking.setNomVoie(instance[i]['properties']['nomvoie']);
        parking.setSurface(instance[i]['properties']['surface_calculee']);
        parking.setTarif(instance[i]['properties']['tar']);
        parking.setLng(instance[i]['properties']['geo_point_2d'][0]);
        parking.setLat(instance[i]['properties']['geo_point_2d'][1]);
        listObjetParking.add(parking);
      }
    });
    print(listObjetParking);
    return listObjetParking;
  }

  //draw routes
  void _drawRoutes(List<LatLng> chemin) {
    mapController.addLine(LineOptions(
      geometry: chemin,
      lineColor: '#FF008D',
      lineWidth: 5.0,
    ));
  }

  /// Convert an assets image to string name and Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  //conversion image to String
  void _onStyleLoaded() {
    addImageFromAsset("positionDepart", "assets/images/positionDepart.png");
    addImageFromAsset("positionJaune", "assets/images/positionJaune.png");
    addImageFromAsset("positionRouge", "assets/images/positionRouge.png");
    addImageFromAsset("positionVert", "assets/images/positionVert.png");
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

  //liste fonction executer lors de la creation de la carte

  //style de la carte

  //creation carte mapbox
  MapboxMap creationCarteMapBox(String latDepart, String lngDepart,
      String latArriver, String lngArriver) {
    //coordonner en Objet latitute et longitude de la position de depart et position parking
    LatLng center = LatLng(double.parse(latDepart), double.parse(lngDepart));
    LatLng parkingPosition =
        LatLng(double.parse(latArriver), double.parse(lngArriver));

    //fonction qui control la creation de la carte
    void _onMapCreated(MapboxMapController controller) {
      //construction et ajout de la chemin entre les deux
      mapController = controller;
      _drawRoutes(listListDoubleToListLatlng(
          latDepart, lngDepart, latArriver, lngArriver));
      //ajout deux symbole de depart et d'arriver
      _onStyleLoaded();
      _addSymbols(center, 'positionDepart', mapController);
      _addSymbols(parkingPosition, 'positionVert', mapController);
    }

    return MapboxMap(
        styleString: styleCarte,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 14));
  }
}
