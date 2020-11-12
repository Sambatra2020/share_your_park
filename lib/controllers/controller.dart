import 'dart:convert';

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
  List<Parking> get listeParking => listObjetParking;
  ////
  //////
  ///////
  ///les Fonctions

  //draw routes

  //requette pour avoir les chemins
  //
  ///
  List<List<double>> convertResponse(http.Response response, String latDepart,
      String lngDepart, String latArriver, String lngArriver) {
    //
    ///declaration des variables locaux
    ///
    Map data;
    var routes, geometry, coordinates, coords;
    double lng, lat;
    List<double> coo;
    List<List<double>> _coordsLocal = [];

    ///
    //
    double latInitiale = double.parse(latDepart);
    double lngInitiale = double.parse(lngDepart);
    List<double> initiale = [latInitiale, lngInitiale];
    //
    ///
    double latFinale = double.parse(latArriver);
    double lngFinale = double.parse(lngArriver);
    List<double> finale = [latFinale, lngFinale];
    //
    ///
    _coordsLocal.add(initiale);
    print("chemin.length: ${_coords.length}");

    //export et ajout du coordonne dans la liste
    ///

    data = json.decode(response.body);
    routes = data['routes'];
    geometry = routes[0]['geometry'];
    coordinates = geometry['coordinates'];
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
