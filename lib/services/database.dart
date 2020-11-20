import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:share_your_park/models/parking.dart';
import 'package:share_your_park/models/user.dart' as userModel;

import '../models/trajet.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //instance database reference
  final dBref = FirebaseDatabase.instance.reference();
  final firebase_storage.Reference storageReference =
      firebase_storage.FirebaseStorage.instance.ref();
  //utilisateur et formation dans firestore

  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('utilisateur');

  //creer un nouveau collection
  Future updateUserData(userModel.UserInformation userInformation) async {
    return await userCollection.doc(uid).set({
      'uid': uid,
      'firstName': userInformation.firstName,
      'lastName': userInformation.lastName,
      'email': userInformation.email,
      'numeroPhone': userInformation.numeroPhone,
      'dateDeNaissance': userInformation.dateDeNaissance,
      'typeVehicule': userInformation.typeDeVehicule,
      'tailleVehicule': userInformation.tailleDeVehicule,
      'firstSign':userInformation.firstSign,
      'dateInscription': DateTime.now()
    });
  }
    Future updateFirstUserSign(var first) async {
    return await userCollection.doc(uid).set({
      'firstSign': first,
    });
  }

  // list utilisateur from snapshot
  List<userModel.UserInformation> _listUtilisateurFromSnapshot(
      QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return userModel.UserInformation(
          userId: doc.get('uid') ?? '',
          userFirstName: doc.get('lastName') ?? '',
          userLastName: doc.get('sugars') ?? '',
          userEmail: doc.get('email') ?? '',
          userNumeroPhone: doc.get('numeroPhone') ?? '',
          userDateDeNaissance: doc.get('dateDeNaissance') ?? DateTime.now(),
          userTypeVehicule: doc.get('typeVehicule') ?? '',
          userTailleVehicule: doc.get('tailleVehicule') ?? '',
          userFirstSign: doc.get('firstSign') ?? '',
          userDateInscription: doc.get('dateInscription') ?? DateTime.now());
    }).toList();
  }

  //userData from snapshot
  userModel.UserInformation _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return userModel.UserInformation(
        userId: uid,
        userFirstName: snapshot.get('lastName'),
        userLastName: snapshot.get('sugars'),
        userEmail: snapshot.get('email'),
        userNumeroPhone: snapshot.get('numeroPhone'),
        userDateDeNaissance: snapshot.get('dateDeNaissance'),
        userTypeVehicule: snapshot.get('typeVehicule'),
        userTailleVehicule: snapshot.get('tailleVehicule'),
        userFirstSign: snapshot.get('firstSign'),
        userDateInscription: snapshot.get('dateInscription'));
  }

  //recuper  stream  utilisateurs
  Stream<List<userModel.UserInformation>> get utilisateurs {
    return userCollection.snapshots().map(_listUtilisateurFromSnapshot);
  }

  //get user doc stream
  Stream<userModel.UserInformation> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  Future getUserData() async {
    return userCollection.doc(uid).get();
  }

  //parking dans firebase database

  //ecriture data trajet  dans firebase database
  void addDataTrajet(Trajet trajet) {
    dBref
        .child("BDD Trajet")
        .child(uid)
        .child(trajet.idTrajet.toString())
        .set(trajet.toMap());
  }

  //store an image to firebase
  void addScreenShootTrajet(Uint8List uint8list) async {
    await storageReference
        .child(uid)
        .child("IMG_${DateTime.now().millisecondsSinceEpoch}.png")
        .putData(uint8list);
  }

  //import an image from firebase

  //recuperer data trajet dans firebase database et convertir en liste de Trajet Objet
  Future<int> idTrajet() async {
    int id = 0;
    await dBref
        .child("BDD Trajet")
        .child(uid)
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.value != null) {
        id = dataSnapshot.value.length;
      }
    });
    return id;
  }

  Future<List<Trajet>> readDatatrajet() async {
    List<Trajet> listeTrajet = [];
    //recuperation data dans realtime database
    await dBref
        .child("BDD Trajet")
        .child(uid)
        .once()
        .then((DataSnapshot dataSnapshot) {
      List<Trajet> listeTrajetUtilisateur = [];
      var key = dataSnapshot.value.length;
      var data = dataSnapshot.value;
      //iteration des donnes Trajet de l'utilisateur
      for (int i = 0; i < key; i++) {
        List<List<double>> coo = [];

        //recuperation des coordonnes et conversion en liste de liste de double
        for (int j = 0; j < data[i]['coords'].length; j++) {
          double xj = data[i]['coords'][j][0].toDouble();
          double yj = data[i]['coords'][j][1].toDouble();
          coo.add([xj, yj]);
        }

        //recuperation coordonnees position de depart et conversion en liste de double
        List<double> positionDepart = [
          data[i]['positionDepart'][0].toDouble(),
          data[i]['positionDepart'][1].toDouble()
        ];

        //recuperation coordonnees position de d arriver et conversion en liste de double
        List<double> positionArriver = [
          data[i]['positionArriver'][0].toDouble(),
          data[i]['positionArriver'][1].toDouble()
        ];

        //recuperation de la duree et la distance de trajet et conversion en double
        double duration = data[i]['duration'].toDouble();
        double distance = data[i]['distance'].toDouble();

        //recuperation date du trajet
        String date = data[i]['date'];

        //instanciation liste de trajet d'un utilisateur
        listeTrajetUtilisateur.add(new Trajet(
            tId: i,
            uId: uid,
            pDepart: positionDepart,
            pArriver: positionArriver,
            coords: coo,
            duration: duration,
            distance: distance,
            date: date));
      }
      listeTrajet = listeTrajetUtilisateur;
    });
    return listeTrajet;
  }

  //ecriture data Parking  dans firebase database
  void addDataParking(Parking parking) {
    dBref
        .child("Parking SYP")
        .child(parking.pId.toString())
        .set(parking.toMap());
  }

  //update a status parking
  void updateStatusParking(int parkingId, int status) {
    dBref
        .child("Parking SYP")
        .child(parkingId.toString())
        .update({'status': status});
  }

  //suprimer un instance parking dans firebase
  void supprimerParking(int parkingId) {
    dBref.child("Parking SYP").child(parkingId.toString()).remove();
  }

  //recuperer data Parking dans firebase database et convertir en liste de Trajet Objet

  List<Parking> readDataParking(String childCle) {
    List<Parking> listeParkingSyp = [];

    //recuperation data dans realtime database
    dBref.child(childCle).once().then((DataSnapshot dataSnapshot) {
      var key = dataSnapshot.value.length;
      var data = dataSnapshot.value;
      //iteration des donnes Trajet de l'utilisateur
      for (int i = 1; i < key; i++) {
        if (data[i]['status'] == 0) {
          listeParkingSyp.add(Parking.fromMapObject(data[i]));
        }
      }
    });
    return listeParkingSyp;
  }
}
