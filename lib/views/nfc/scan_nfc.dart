import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:share_your_park/const.dart';

class ScanNFC extends StatefulWidget {
  ScanNFC({Key key}) : super(key: key);
  @override
  _ScanNFCState createState() => _ScanNFCState();
}

class _ScanNFCState extends State<ScanNFC> {
  NfcData _nfcData = NfcData();
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
                          await startNFC();
                          print("scan terminer");
                        }),
                  ),
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

  Future startNFC() async {
    setState(() {
      _nfcData.status = NFCStatus.reading;
    });

    print('NFC: Scan started');

    var response = await FlutterNfcReader.read();
    setState(() {
      _nfcData = response;
    });
    print(_nfcData);
  }
}
