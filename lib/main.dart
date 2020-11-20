import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_your_park/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:share_your_park/views/nfc/scan_nfc.dart';
import 'package:share_your_park/views/nfc/testNfc.dart';
import 'package:share_your_park/views/screens/baseCarteMap.dart';
import 'package:share_your_park/views/screens/mapbox/listeParking.dart';
import 'package:share_your_park/views/screens/mapbox/slideListParking.dart';
import 'package:share_your_park/views/screens/register.dart';
import 'package:share_your_park/views/screens/signup.dart';
import 'models/user.dart' as userModel;
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value( 
       value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(),
        home: Signup(),
        debugShowCheckedModeBanner: false
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CollectionReference userCollection = FirebaseFirestore.instance.collection('utilisateur');
    final user = Provider.of<userModel.User>(context);

    print(user);
    if (user == null) {
      return Register();
    } else {
      return FutureBuilder<DocumentSnapshot>(
        future: userCollection.doc(user.userId).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            if ( data['firstSign']){
              print("C'EST PARTI");
              print(data['firstSign']);
              return ScanNFC();
            } else {
              print("JE DOIT ME RENSEIGNER");
              print(data['firstSign']);
              return Signup();
            }
          }
          return Scaffold(
            body: Center(
              child: Text("Loading")
            )
          );
        },
      );
    }
  }
}
