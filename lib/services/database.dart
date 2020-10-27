import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:share_your_park/models/user.dart' as userModel;

import '../models/trajet.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //instance database reference
  final dBref = FirebaseDatabase.instance.reference();

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
      'dateInscription': DateTime.now()
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

  //parking dans firebase database

  //ecriture data trajet  dans firebase database
  void addDataTrajet(Trajet trajet) {
    dBref
        .child(trajet.uId)
        .child(trajet.idTrajet.toString())
        .set(trajet.toMap());
  }

  //recuperer data trajet dans firebase database et convertir en liste de Trajet Objet

  List<Trajet> readDatatrajet(String userId) {
    List<Trajet> listeTrajetUtilisateur = [];

    //recuperation data dans realtime database
    dBref.child(userId).once().then((DataSnapshot dataSnapshot) {
      var key = dataSnapshot.value.length;
      var data = dataSnapshot.value;
      //iteration des donnes Trajet de l'utilisateur
      for (int i = 1; i < key; i++) {
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

        //instanciation liste de trajet d'un utilisateur
        listeTrajetUtilisateur.add(new Trajet(
            tId: i,
            uId: userId,
            pDepart: positionDepart,
            pArriver: positionArriver,
            coords: coo,
            duration: duration,
            distance: distance));
      }
    });
    return listeTrajetUtilisateur;
  }
}
