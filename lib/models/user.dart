class User {
  String userId;
  User({this.userId});
}

class UserInformation {
  String userId;
  String userFirstName;
  String userLastName;
  String userEmail;
  String userAdress;
  int userCodePostal;
  String userNumeroPhone;
  DateTime userDateDeNaissance;
  DateTime userDateInscription;
  String userTypeVehicule;
  String userTailleVehicule;

  UserInformation(
      {this.userId,
      this.userFirstName,
      this.userLastName,
      this.userEmail,
      this.userNumeroPhone,
      this.userAdress,
      this.userCodePostal,
      this.userDateDeNaissance,
      this.userTypeVehicule,
      this.userTailleVehicule,
      this.userDateInscription});

  //getter
  String get id => userId;
  String get firstName => userFirstName;
  String get lastName => userLastName;
  String get email => userEmail;
  String get numeroPhone => userNumeroPhone;
  String get adress => userAdress;
  int get codePostal => userCodePostal;
  DateTime get dateDeNaissance => userDateDeNaissance;
  String get typeDeVehicule => userTypeVehicule;
  String get tailleDeVehicule => userTailleVehicule;
  DateTime get dateInscription => userDateInscription;

  //setter
  setId(String newId) {
    this.userId = newId;
  }

  setFirstName(String newfirstName) {
    if (newfirstName.length < 50) {
      this.userFirstName = newfirstName;
    }
  }

  setLastName(String newlastName) {
    if (newlastName.length < 50) {
      this.userLastName = newlastName;
    }
  }

  setEmail(String newemail) {
    if (newemail.length < 50) {
      this.userEmail = newemail;
    }
  }

  setNumeroPhone(String newnumeroPhone) {
    if (newnumeroPhone.length < 18) {
      this.userNumeroPhone = newnumeroPhone;
    }
  }

  setAdress(String newAdress) {
    if (newAdress.length < 50) {
      this.userAdress = newAdress;
    }
  }

  setCodePostal(int newCodePostal) {
    this.userCodePostal = newCodePostal;
  }

  setDateDeNaissance(DateTime newdateDeNaissance) {
    this.userDateDeNaissance = newdateDeNaissance;
  }

  setTypeDeVehicule(String newTypeDeVehicule) {
    if (newTypeDeVehicule.length < 11) {
      this.userTypeVehicule = newTypeDeVehicule;
    }
  }

  setTailleDeVehicule(String newTailleDeVehicule) {
    if (newTailleDeVehicule.length < 7) {
      this.userTailleVehicule = newTailleDeVehicule;
    }
  }

  setDateInscription(DateTime newdateInscription) {
    this.userDateInscription = newdateInscription;
  }

  //convert a Dev object to a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = userId;
    }

    map['firstName'] = userFirstName;
    map['lastName'] = userLastName;
    map['email'] = userEmail;
    map['numeroPhone'] = userNumeroPhone;
    map['adress'] = userAdress;
    map['codePostal'] = userCodePostal;
    map['dateDeNaissance'] = userDateDeNaissance;
    map['typeDeVehicule'] = userTypeVehicule;
    map['tailleDeVehicule'] = userTailleVehicule;
    map['dateInscription'] = userDateInscription;

    return map;
  }

  //extract a Dev object from a Map object
  UserInformation.fromMapObject(Map<String, dynamic> map) {
    this.userId = map['id'];
    this.userFirstName = map['firstName'];
    this.userLastName = map['lastName'];
    this.userEmail = map['email'];
    this.userNumeroPhone = map['numeroPhone'];
    this.userDateDeNaissance = map['dateDeNaissance'];
    this.userAdress = map['adress'];
    this.userCodePostal = map['dateDeNaissance'];
    this.userTypeVehicule = map['typeDeVehicule'];
    this.userTailleVehicule = map['tailleDeVehicule'];
    this.userDateInscription = map['dateInscription'];
  }
}
