class Parking {
  int pId;
  String pNomvoie;
  double pLat;
  double pLng;
  String pTarif;
  double pSurface;
  int pStatus = 0;
  int pNumvoie;
  String pTaille;
  DateTime pHeurePartage;

  Parking(
      {this.pNomvoie,
      this.pNumvoie,
      this.pLat,
      this.pLng,
      this.pStatus,
      this.pSurface,
      this.pTarif,
      this.pTaille,
      this.pHeurePartage});
  Parking.withId(
      {this.pId,
      this.pNomvoie,
      this.pNumvoie,
      this.pLat,
      this.pLng,
      this.pStatus,
      this.pSurface,
      this.pTarif,
      this.pTaille,
      this.pHeurePartage});

  //getter
  int get id => pId;
  String get nomRue => pNomvoie;
  int get numRue => pNumvoie;
  double get lat => pLat;
  double get lng => pLng;
  int get status => pStatus;
  String get tarif => pTarif;
  double get surface => pSurface;
  String get taille => pTaille;
  DateTime get heurePartage => pHeurePartage;

  //setter
  setId(int newId) {
    this.pId = newId;
  }

  setNomVoie(String newNomvoie) {
    this.pNomvoie = newNomvoie;
  }

  setNumVoie(int newNumvoie) {
    this.pNumvoie = newNumvoie;
  }

  setLat(double newLat) {
    this.pLat = newLat;
  }

  setLng(double newLng) {
    this.pLng = newLng;
  }

  setStatus(int newStatus) {
    this.pStatus = newStatus;
  }

  setSurface(double newSurface) {
    this.pSurface = newSurface;
  }

  setTarif(String newTarif) {
    this.pTarif = newTarif;
  }

  setTaille(String newTaille) {
    this.pTaille = newTaille;
  }

  setHeurePartage(DateTime newheurePartage) {
    this.pHeurePartage = newheurePartage;
  }

  //convert a Trajet object to a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['idParking'] = pId;
    map['nomVoie'] = pNomvoie;
    map['numVoie'] = pNumvoie;
    map['lat'] = pLat;
    map['lng'] = pLng;
    map['status'] = pStatus;
    map['taille'] = pTaille;
    map['heurePartage'] = pHeurePartage;

    return map;
  }

  //extract a Dev object from a Map object
  Parking.fromMapObject(Map<String, dynamic> map) {
    this.pId = map['idParking'];
    this.pNomvoie = map['nomVoie'];
    this.pNumvoie = map['numVoie'];
    this.pLat = map['lat'];
    this.pLng = map['lng'];
    this.pStatus = map['status'];
    this.pTaille = map['taille'];
    this.pHeurePartage = map['heurePartage'];
  }
}
