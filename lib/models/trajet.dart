import 'package:mapbox_gl/mapbox_gl.dart';

class Trajet {
  int tId;
  int uId;
  LatLng pDepart;
  LatLng pArriver;
  List<LatLng> coords;
  double duration;
  double distance;

  Trajet(
      {this.tId,
      this.uId,
      this.pDepart,
      this.pArriver,
      this.coords,
      this.distance,
      this.duration});
  //getter
  int get idTrajet => tId;
  int get idUser => uId;
  LatLng get positionDepart => pDepart;
  LatLng get positionArriver => pArriver;
  List<LatLng> get trajetCoords => coords;
  double get dureeTrajet => duration;
  double get distanceTrajet => distance;

  //setter
  set idUser(int newUserId) {
    this.uId = newUserId;
  }

  set positionDepart(LatLng newPositionDepart) {
    this.pDepart = newPositionDepart;
  }

  set positionArriver(LatLng newPositionArriver) {
    this.pArriver = newPositionArriver;
  }

  set trajetCoords(List<LatLng> newCoords) {
    this.coords = newCoords;
  }

  set dureeTrajet(double newduration) {
    this.duration = newduration;
  }

  set distanceTrajet(double newdistance) {
    this.distance = newdistance;
  }
}
