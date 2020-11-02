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
    return Center(
      child: Card(
        margin: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Image.asset('assets/icons/notifigps.png'),
            ),
            const ListTile(
              //leading: Icon(Icons.album),
              title: Text('Syp'),
              subtitle: Text('L’appli’ qui t’aide à trouver ton stationnement'),
            ),
            
                          ],
                        ),
                      ),
                    );
                  }
                }
                
      