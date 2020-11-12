/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/controllers/controller.dart';
import 'package:share_your_park/models/parking.dart';
import 'package:share_your_park/views/screens/mapbox/listeParking.dart';

class ScanNFC extends StatefulWidget {
  ScanNFC({Key key}) : super(key: key);
  @override
  _ScanNFCState createState() => _ScanNFCState();
}

class _ScanNFCState extends State<ScanNFC> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
            ),
            child: Align(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: (heigth * 8) / 100, left: (width * 70) / 100),
                      child: FloatingActionButton(
                          backgroundColor: Color(0xFFFF008D),
                          child: Icon(Icons.menu),
                          onPressed: () async {
                            await controller.getListParkingData(
                                '2.339432', '48.862056');
                            List<Parking> listeParking =
                                controller.listeParking;
                            print(
                                "nombre element de la liste est ${listeParking.length}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ListeParking(
                                            listObjetParking: listeParking)));
                          })),
                  Container(
                    margin: EdgeInsets.only(
                        top: (heigth * 8) / 100, left: (width * 20) / 100),
                    child: Image.asset(
                      'assets/images/lecture_nfc.png',
                      height: (heigth * 40) / 100,
                      width: (width * 50) / 100,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (heigth * 5) / 100),
                    child: Text(
                      'Rapprochez votre\ntéléphone de votre\npuce NFC',
                      style: TextStyle(
                        fontSize: (heigth * 5) / 100,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )));
  }

  Future check() async {
    var result = await FlutterNfcReader.checkNFCAvailability();
    print("result check : $result");
  }

  Future stopNfc() async {
    await FlutterNfcReader.stop().then((response) {
      print("stop:${response.status.toString()}");
    });
  }

  Future readNfc() async {
    print("start scan nfc: please wait ...");
    await FlutterNfcReader.read().then((response) {
      print("read nfc: ${response.content}");
    });
  }
}
*/
