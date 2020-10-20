import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:share_your_park/models/user.dart' as userModel;

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
  Future updateUserData(
      String firstName,
      String lastName,
      String email,
      String numeroPhone,
      DateTime dateDeNaissance,
      String typeVehicule,
      String tailleVehicule) async {
    return await userCollection.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'numeroPhone': numeroPhone,
      'dateDeNaissance': dateDeNaissance,
      'typeVehicule': typeVehicule,
      'tailleVehicule': tailleVehicule,
      'dateInscription': DateTime.now()
    });
  }

  // list utilisateur from snapshot
  List<userModel.User> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return userModel.User(
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
  userModel.User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return userModel.User.withId(
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
  Stream<List<userModel.User>> get utilisateurs {
    return userCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream
  Stream<userModel.User> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  //parking dans firebase database

  //in
}
