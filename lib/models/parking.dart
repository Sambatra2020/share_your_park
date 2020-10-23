class Parking {
  int pId;
  String pNomRue;
  double pLat;
  double pLng;
  int pStatus = 0;

  Parking({this.pNomRue, this.pLat, this.pLng, this.pStatus});
  Parking.withId({this.pId, this.pNomRue, this.pLat, this.pLng, this.pStatus});

  //getter
  int get id => pId;
  String get nomRue => pNomRue;
  double get lat => pLat;
  double get lng => pLng;
  int get status => pStatus;

  //setter
  set nomRue(String newNomRue) {
    this.pNomRue = newNomRue;
  }

  set lat(double newLat) {
    this.pLat = newLat;
  }

  set lng(double newLng) {
    this.pLng = newLng;
  }
}
