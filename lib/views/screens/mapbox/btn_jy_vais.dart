import 'package:flutter/material.dart';
import 'package:share_your_park/controllers/controller.dart';
import 'package:share_your_park/models/user.dart' as userModel;
import 'package:provider/provider.dart';
import 'package:share_your_park/position_actuelle.dart';

class BodyJyVais extends StatefulWidget {
  @override
  _BodyJyVaisState createState() => _BodyJyVaisState();
}

class _BodyJyVaisState extends State<BodyJyVais> {
  LocationServices locationServices = LocationServices();
  Controller _controller = Controller();
  List<List<double>> coords;
  List<double> positionDepart;
  String idUtilisateur;
  int idTrajet;
  List<double> actualPosition;
  List<double> positionArriver;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userModel.User>(context);
    print("User Connecté:");
    print(user.userId);
    idUtilisateur = user.userId;
    positionDepart = actualPosition;

    return FutureBuilder(
      future: _fetch(),
      builder: (context, snapshot) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                onPressed: () async {
                  print(positionDepart);
                },
                child: Text("J'y vais"))
          ],
        ));
      },
    );
  }

  _fetch() async {
    locationServices.positionActuelle().then((value) {
      actualPosition = value;
    });
  }
}
