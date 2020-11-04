import 'package:flutter/material.dart';

class Notifi extends StatefulWidget {
  @override
  _NotifiState createState() => _NotifiState();
}

class _NotifiState extends State<Notifi> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
 return Card(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[

      ListTile(
        leading: Image.asset('assets/icons/icone.png'),
        title: Text(
          'SYP',
          style: TextStyle(color: Color(0xFF990356)),
        ),
      ),
      ListTile(
        title: Text(
          'Stationnement disponible !',
          style: TextStyle(fontFamily: 'Arial',),
          )
      )
    ]
  )
 );
  }
}
      /*
          Stationnement disponible !

          Une place de stationnement vient de se libérer près
          de ta destination. Fonce pour l’avoir ! 🚀
      */