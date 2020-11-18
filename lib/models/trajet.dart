class Trajet {
  int tId;
  String uId;
  List<double> pDepart;
  List<double> pArriver;
  List<List<double>> coords;
  double duration;
  double distance;
  String date;

  Trajet(
      {this.tId,
      this.uId,
      this.pDepart,
      this.pArriver,
      this.coords,
      this.distance,
      this.duration,
      this.date});
  //getter
  int get idTrajet => tId;
  String get idUser => uId;
  List<double> get positionDepart => pDepart;
  List<double> get positionArriver => pArriver;
  List<List<double>> get trajetCoords => coords;
  double get dureeTrajet => duration;
  double get distanceTrajet => distance;
  String get time => date;

  //setter
  setDate(String newTime) {
    this.date = newTime;
  }

  setidTrajetId(int newTrajetId) {
    this.tId = newTrajetId;
  }

  setidUser(String newUserId) {
    this.uId = newUserId;
  }

  setpositionDepart(List<double> newPositionDepart) {
    this.pDepart = newPositionDepart;
  }

  setpositionArriver(List<double> newPositionArriver) {
    this.pArriver = newPositionArriver;
  }

  settrajetCoords(List<List<double>> newCoords) {
    this.coords = newCoords;
  }

  setdureeTrajet(double newduration) {
    this.duration = newduration;
  }

  setdistanceTrajet(double newdistance) {
    this.distance = newdistance;
  }

  //convert a Trajet object to a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['positionDepart'] = pDepart;
    map['positionArriver'] = pArriver;
    map['coords'] = coords;
    map['duration'] = duration;
    map['distance'] = distance;
    map['date'] = date;

    return map;
  }

  //extract a Dev object from a Map object
  Trajet.fromMapObject(Map<String, dynamic> map) {
    this.uId = map['userId'];
    this.tId = map['trajetId'];
    this.pDepart = map['positionDepart'];
    this.pArriver = map['positionArriver'];
    this.coords = map['coords'];
    this.duration = map['duration'];
    this.distance = map['distance'];
    this.date = map['date'];
  }
}
