import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:share_your_park/auth.dart';
import 'package:share_your_park/screens/views/acceuil.dart';
import 'dart:io';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      title: 'SYP Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Acceuil(),
    );
  }
}

class MainPage extends StatelessWidget {

  const MainPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot) {
        if ( snapshot.connectionState == ConnectionState.waiting ) {
          return Container(
            child: Text("Loading"),
          );
        }
        if ( snapshot.data == null || !snapshot.hasData ) {
          return Acceuil();
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children : <Widget>[
                FlatButton(onPressed: () async {
                    AuthService().logOut();
                  },
                  color: Colors.pink,
                  child: Text("disconnect")
                )

              ]
            ),
          )
        );
      }
    );
  }
}
