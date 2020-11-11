import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:share_your_park/models/parking.dart';
import 'package:share_your_park/models/trajet.dart';

class Controller {
  MapboxMapController mapController;
  String styleCarte = 'mapbox://styles/sambatra/ckgbwa2x706vs1ap3n6qcaptj';
  String accessToken =
      'pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA';
  List<LatLng> chemin = [];
  LatLng ancienPosition;
  List<Parking> listObjetParking = [];
  List<List<double>> _coords = [];
  List<Parking> get listeParking => listObjetParking;
  //draw routes
  void _drawRoutes(List<LatLng> chemin) {
    mapController.addLine(LineOptions(
      geometry: chemin,
      lineColor: '#FF008D',
      lineWidth: 5.0,
    ));
  }
  //requette pour avoir les chemins

  //conversion response en liste de coordonner
  void conversionResponseEnlistDouble(String latDepart, String lngDepart,
      String latArriver, String lngArriver) {}

  Future getListLatLngAndDrawRoute(
    String latDepart,
    String lngDepart,
    String latArriver,
    String lngArriver,
  ) async {
    http.Response response = await http.get(
        "https://api.mapbox.com/directions/v5/mapbox/driving/" +
            lngDepart +
            "," +
            latDepart +
            ";" +
            lngArriver +
            "," +
            latArriver +
            "?geometries=geojson&access_token=" +
            accessToken +
            "");

    //conversion de la reponse en liste liste de double

    double latInitiale = double.parse(latDepart);
    double lngInitiale = double.parse(lngDepart);
    List<double> initiale = [latInitiale, lngInitiale];
    double latFinale = double.parse(latArriver);
    double lngFinale = double.parse(lngArriver);
    List<double> finale = [latFinale, lngFinale];
    _coords.add(initiale);
    print("chemin.length: ${_coords.length}");

    //export et ajout du coordonne dans la liste
    Map data;
    var routes, geometry, coordinates, coords;
    double lng, lat;
    List<double> coo;
    data = json.decode(response.body);
    routes = data['routes'];
    geometry = routes[0]['geometry'];
    coordinates = geometry['coordinates'];
    for (int i = 0; i < coordinates.length; i++) {
      coords = coordinates[i];
      lng = coords[0];
      lat = coords[1];
      coo = [lat, lng];
      _coords.add(coo);
    }
    _coords.add(finale);

    //fonction qui transforme une liste de liste double en list latlng

    for (int i = 0; i < _coords.length; i++) {
      LatLng latLng = LatLng(_coords[i][0], _coords[i][1]);
      chemin.add(latLng);
    }

    _drawRoutes(chemin);
  }

  //construction trajet d'un utilisateur
  Future<Trajet> constructionTrajetUtilisateur(
      List<List<double>> coords,
      String idUtilisateur,
      int idTrajet,
      List<double> positionDepart,
      List<double> positionArriver) async {
    http.Response response = await http.get(
        "https://api.mapbox.com/directions/v5/mapbox/driving/" +
            positionDepart[1].toString() +
            "," +
            positionDepart[0].toString() +
            ";" +
            positionArriver[1].toString() +
            "," +
            positionArriver[0].toString() +
            "?geometries=geojson&access_token=pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA");

    //construction objet parking a partir de ka requette
    Trajet trajet = Trajet();
    double duration;
    double distance;

    Map data = json.decode(response.body);
    var routes = data['routes'];
    duration = routes[0]['duration'];
    distance = routes[0]['distance'];

    trajet.setidTrajetId(idTrajet);
    trajet.setidUser(idUtilisateur);
    trajet.setdureeTrajet(duration);
    trajet.setdistanceTrajet(distance);
    trajet.setpositionDepart(positionDepart);
    trajet.setpositionArriver(positionArriver);
    trajet.settrajetCoords(coords);

    return trajet;
  }

  /// Convert an assets image to string name and Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  void _onStyleLoaded() async {
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
    ancienPosition = position;
  }

  //creation carte mapbox
  MapboxMap creationCarteMapBox(String latDepart, String lngDepart,
      String latArriver, String lngArriver) {
    //coordonner en Objet latitute et longitude de la position de depart et position parking
    LatLng center = LatLng(double.parse(latDepart), double.parse(lngDepart));
    LatLng parkingPosition =
        LatLng(double.parse(latArriver), double.parse(lngArriver));
    print("=================================================");
    print(latArriver);
    print(lngArriver);

    //fonction qui control la creation de la carte

    void _onMapCreated(MapboxMapController controller) async {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      mapController = controller;
      _onStyleLoaded();
      //ajout deux symbole de depart et d'arriver
      await _addSymbols(center, 'positionDepart', mapController);
      await _addSymbols(parkingPosition, 'positionVert', mapController);
      //construction et ajout de la chemin entre les deux
      await getListLatLngAndDrawRoute(
          latDepart, lngDepart, latArriver, lngArriver);
    }

    return MapboxMap(
        styleString: styleCarte,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 18));
  }

  /*FlutterMap carteMap(String latDepart, String lngDepart,
      String latArriver, String lngArriver){
        //coordonner en Objet latitute et longitude de la position de depart et position parking
    LatLng icenter = new LatLng(double.parse(latDepart), double.parse(lngDepart));
    LatLng iparkingPosition =
        LatLng(double.parse(latArriver), double.parse(lngArriver));
   return FlutterMap(
    options:  MapOptions(
      center: ,
      zoom: 13.0,
    ),
    layers: [
       TileLayerOptions(
        urlTemplate: "https://api.mapbox.com/styles/v1/sambatra/ckgbwa2x706vs1ap3n6qcaptj.html?fresh=true&title=view&access_token=pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA",
      ),
       MarkerLayerOptions(
        markers: [
           Marker(
            width: 80.0,
            height: 80.0,
            point: iparkingPosition,
          ),
        ],
      ),
    ],
  );
  }*/

  MapboxMap mapBoxVide(double latitudeParking, double longitudeParking) {
    LatLng positionParking = LatLng(latitudeParking, longitudeParking);
    void _onMapCreated(MapboxMapController controller) async {
      //construction et ajout de la chemin entre les deux
      mapController = controller;
      //ajout deux symbole de depart et d'arriver
    }

    return MapboxMap(
        styleString: styleCarte,
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: positionParking, zoom: 14));
  }

  //requete vers opendatasoft pour avoir les parking
  Future getListParkingData(String latitude, String longitude) async {
    //requete pour avoir la liste des parking sur opendata
    http.Response response = await http.get(
        "https://data.opendatasoft.com/api/records/1.0/search/?dataset=stationnement-sur-voie-publique-emplacements%40datailedefrance&rows=10&facet=regpri&facet=regpar&facet=typsta&facet=arrond&facet=zoneres&facet=tar&facet=locsta&facet=parite&facet=signhor&facet=signvert&facet=confsign&facet=typemob&facet=datereleve&facet=mtlast_edit_date_field&geofilter.distance=" +
            longitude +
            "%2C" +
            latitude +
            "%2C5000&format=geojson");

    //convert data response listparking to liste objet parking
    Map data = json.decode(response.body);
    var instance = data['features'];

    for (int i = 0; i < instance.length; i++) {
      Parking parking = Parking();
      parking.setId(i + 1);
      parking.setNomVoie(instance[i]['properties']['nomvoie']);
      parking.setNumVoie(instance[i]['properties']['numvoie']);
      parking.setSurface(instance[i]['properties']['surface_calculee']);
      parking.setTarif(instance[i]['properties']['tar']);
      parking.setLng(instance[i]['properties']['geo_point_2d'][0]);
      parking.setLat(instance[i]['properties']['geo_point_2d'][1]);
      listObjetParking.add(parking);
    }

    //visualisation liste parking sur le terminale
    print(instance.length);
    print("les parking disponible");
    for (int i = 0; i < instance.length; i++) {
      print("parking numero ${i + 1}");
      print(instance[i]['properties']['nomvoie']);
      print(instance[i]['properties']['surface_calculee']);
      print(instance[i]['properties']['tar']);
      print(instance[i]['properties']['geo_point_2d'][0]);
      print(instance[i]['properties']['geo_point_2d'][1]);
    }
  }
}
