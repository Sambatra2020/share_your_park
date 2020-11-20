import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_your_park/models/user.dart';
import 'package:share_your_park/services/database.dart';


class JyVais extends StatefulWidget {
  
  @override
  _JyVaisState createState() => _JyVaisState();
}

class _JyVaisState extends State<JyVais> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('utilisateur');
    final user = Provider.of<User>(context);
    print(user.userId);
    DatabaseService databaseService = DatabaseService(uid: user.userId);
    return FutureBuilder<DocumentSnapshot>(
      future: userCollection.doc(user.userId).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          // data['firstSign'] = false;
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Full Name: ${data['firstSign']}"),
                  RaisedButton(
                    onPressed: () async {
                      await databaseService.updateFirstUserSign(!data['firstSign']);
                    },
                    child: Text("update"),
                  )
                ],
              ),
            ),
          );
        }
        return Text("loading");
      },
    );
  }
}