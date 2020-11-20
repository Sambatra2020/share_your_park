import 'dart:convert';
import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';
//import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:share_your_park/models/parking.dart';
import 'package:share_your_park/models/trajet.dart';

class Controller {
  //
  ///declaration des variables
  //MapboxMapController mapController;
  // MapboxMapController mapControllerVide;
  //
  ///

  //
  ///
  String styleCarte = 'mapbox://styles/sambatra/ckgbwa2x706vs1ap3n6qcaptj';
  String accessToken =
      'pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA';
  //
  ///
  List<LatLng> chemin = [];
  LatLng ancienPosition;
  List<Parking> listObjetParking = [];
  List<List<double>> _coords = [];
  String duree, dist;
  String get duration => duree;
  String get distance => dist;
  List<Parking> get listeParking => listObjetParking;
  ////
  //////
  ///////
  ///les Fonctions

  //draw routes

  //fonction  pour avoir les chemins
  List<List<double>> convertResponse(http.Response response, String latDepart,
      String lngDepart, String latArriver, String lngArriver) {
    //
    ///declaration des variables locaux
    Map data;
    var routes, geometry, coordinates, coords;
    double lng, lat;
    List<double> coo;
    List<List<double>> _coordsLocal = [];
    //
    double latInitiale = double.parse(latDepart);
    double lngInitiale = double.parse(lngDepart);
    List<double> initiale = [latInitiale, lngInitiale];
    //
    double latFinale = double.parse(latArriver);
    double lngFinale = double.parse(lngArriver);
    List<double> finale = [latFinale, lngFinale];
    //
    _coordsLocal.add(initiale);

    //export et ajout du coordonne dans la liste
    data = json.decode(response.body);
    routes = data['routes'];
    geometry = routes[0]['geometry'];
    coordinates = geometry['coordinates'];
    duree = (1 + (routes[0]['duration'] / 60)).toStringAsFixed(0);
    dist = (routes[0]['distance']).toStringAsFixed(0);
    //
    ///
    for (int i = 0; i < coordinates.length; i++) {
      coords = coordinates[i];
      lng = coords[0];
      lat = coords[1];
      coo = [lat, lng];
      _coordsLocal.add(coo);
    }
    //
    _coordsLocal.add(finale);

    return _coordsLocal;
  }

  //conversion response en liste de coordonner
  ///
  List<LatLng> convertListToLatLng(List<List<double>> _coordsLocal) {
    List<LatLng> cheminLocal = [];
    for (int i = 0; i < _coordsLocal.length; i++) {
      LatLng latLng = LatLng(_coordsLocal[i][0], _coordsLocal[i][1]);
      cheminLocal.add(latLng);
    }
    return cheminLocal;
  }

  //
  ///
  ///fonctions qui envoie dde la requette pour avoir les coordonnes de la routes et traces le chemin
  //////

  Future<List<LatLng>> getListLatLng(
    String latDepart,
    String lngDepart,
    String latArriver,
    String lngArriver,
  ) async {
    //
    ///
    /////requette pour avoir les coordonees de la route
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

    //
    //conversion de la reponse en liste liste de double
    _coords =
        convertResponse(response, latDepart, lngDepart, latArriver, lngArriver);
    //
    ///
    //fonction qui transforme une liste de liste double en list latlng
    chemin = convertListToLatLng(_coords);

    return chemin;
  }

  //conversion liste latln en list list double
  List<List<double>> convertionLatLngToListdouble(List<LatLng> points) {
    List<List<double>> coords = [];
    for (int i = 0; i < points.length; i++) {
      List<double> a = [points[i].latitude, points[i].longitude];
      coords.add(a);
    }
    return coords;
  }

  //construction trajet d'un utilisateur
  Future<Trajet> constructionTrajetUtilisateur(
      List<List<double>> coords,
      String idUtilisateur,
      int idTrajet,
      List<double> positionDepart,
      List<double> positionArriver,
      double distance,
      double duration) async {
    //construction objet parking a partir de ka requette
    Trajet trajet = Trajet();

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
  Future getListParkingData(String latitude, String longitude) async {
    //requete pour avoir la liste des parking sur opendata
    http.Response response = await http.get(
        "https://data.opendatasoft.com/api/records/1.0/search/?dataset=stationnement-sur-voie-publique-emplacements%40datailedefrance&rows=20&facet=regpri&facet=regpar&facet=typsta&facet=arrond&facet=zoneres&facet=tar&facet=locsta&facet=parite&facet=signhor&facet=signvert&facet=confsign&facet=typemob&facet=datereleve&facet=mtlast_edit_date_field&geofilter.distance=" +
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
  }

  void moveCamAndZoomAuto(
      Map<String, dynamic> map, String distance, MapController mapC) {
    LatLng centreCam = map['centre'];
    double zoom = 18;
    if (double.parse(distance) > 100) {
      zoom = 16;
    } else if (double.parse(distance) < 10) {
      zoom = 20;
    } else if (double.parse(distance) > 1000) {
      zoom = 15;
    }
    if (mapC != null) {
      mapC.move(centreCam, zoom);
    }
  }

  Map<String, dynamic> calculCentreEtDistance2LatLng(
      double _lat1, double _lng1, double _lat2, double _lng2) {
    LatLng centre;
    Map<String, dynamic> mapE = {};
    //conversion latlng en coordonner cartesienne
    var x1 = cos(_lat1 * pi / 180) * cos(_lng1 * pi / 180);
    var y1 = cos(_lat1 * pi / 180) * sin(_lng1 * pi / 180);
    var z1 = sin(_lat1 * pi / 180);
    var x2 = cos(_lat2 * pi / 180) * cos(_lng2 * pi / 180);
    var y2 = cos(_lat2 * pi / 180) * sin(_lng2 * pi / 180);
    var z2 = sin(_lat2 * pi / 180);

    //calcul coordonner centre en cartesienne
    var x = (x1 + x2) / 2;
    var y = (y1 + y2) / 2;
    var z = (z1 + z2) / 2;

    //calcul distance entre ces 2 points
    var dist = sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2) + pow((z2 - z1), 2));

    //conversion de ce coordonner cartesienne en latlng
    var lng = atan2(y, x);
    var hyp = sqrt(pow(x, 2) + pow(y, 2));
    var lat = atan2(z, hyp);
    centre = LatLng(lat * 180 / pi, lng * 180 / pi);

    //ajout centre et distance dans map
    mapE['centre'] = centre;
    mapE['distance'] = dist * 10000000;

    return mapE;
  }
}
