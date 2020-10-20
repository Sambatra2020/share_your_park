class User {
  String userId;
  String userFirstName;
  String userLastName;
  String userEmail;
  String userTypeVehicule;
  String userTailleVehicule;
  String userNumeroPhone;
  DateTime userDateDeNaissance;
  DateTime userDateInscription;

  User(
      {this.userFirstName,
      this.userLastName,
      this.userEmail,
      this.userNumeroPhone,
      this.userDateDeNaissance,
      this.userTypeVehicule,
      this.userTailleVehicule,
      this.userDateInscription});
  User.withId(
      {this.userId,
      this.userFirstName,
      this.userLastName,
      this.userEmail,
      this.userNumeroPhone,
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
  DateTime get dateDeNaissance => userDateDeNaissance;
  String get typeDeVehicule => userTypeVehicule;
  String get tailleDeVehicule => userTailleVehicule;
  DateTime get dateInscription => userDateInscription;

  //setter
  set firstName(String newfirstName) {
    if (newfirstName.length < 50) {
      this.userFirstName = newfirstName;
    }
  }

  set lastName(String newlastName) {
    if (newlastName.length < 50) {
      this.userLastName = newlastName;
    }
  }

  set email(String newemail) {
    if (newemail.length < 50) {
      this.userEmail = newemail;
    }
  }

  set numeroPhone(String newnumeroPhone) {
    if (newnumeroPhone.length < 15) {
      this.userNumeroPhone = newnumeroPhone;
    }
  }

  set dateDeNaissance(DateTime newdateDeNaissance) {
    this.userDateDeNaissance = newdateDeNaissance;
  }

  set typeDeVehicule(String newTypeDeVehicule) {
    if (newTypeDeVehicule.length < 11) {
      this.userTypeVehicule = newTypeDeVehicule;
    }
  }

  set tailleDeVehicule(String newTailleDeVehicule) {
    if (newTailleDeVehicule.length < 7) {
      this.userTailleVehicule = newTailleDeVehicule;
    }
  }

  set dateInscription(DateTime newdateInscription) {
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
    map['dateDeNaissance'] = userDateDeNaissance;
    map['typeDeVehicule'] = userTypeVehicule;
    map['tailleDeVehicule'] = userTailleVehicule;
    map['dateInscription'] = userDateInscription;

    return map;
  }

  //extract a Dev object from a Map object
  User.fromMapObject(Map<String, dynamic> map) {
    this.userId = map['id'];
    this.userFirstName = map['firstName'];
    this.userLastName = map['lastName'];
    this.userEmail = map['email'];
    this.userNumeroPhone = map['numeroPhone'];
    this.userDateDeNaissance = map['dateDeNaissance'];
    this.userTypeVehicule = map['typeDeVehicule'];
    this.userTailleVehicule = map['tailleDeVehicule'];
    this.userDateInscription = map['dateInscription'];
  }
}
