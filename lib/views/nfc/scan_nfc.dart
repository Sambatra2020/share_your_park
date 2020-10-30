import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:share_your_park/const.dart';

class ScanNFC extends StatefulWidget {
  ScanNFC({Key key}) : super(key: key);
  @override
  _ScanNFCState createState() => _ScanNFCState();
}

class _ScanNFCState extends State<ScanNFC> {
  MethodChannel _channel = MethodChannel('flutter_nfc_reader');
  EventChannel stream =
      EventChannel('it.matteocrippa.flutternfcreader.flutter_nfc_reader');
  @override
  initState() {
    super.initState();
    FlutterNfcReader.onTagDiscovered().listen((onData) {
      print(onData.id);
      print(onData.content);
    });
  }

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
                            var result = enableReaderMode();
                            print(result);
                            var r = read();
                            print(r);
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

  Future<NfcData> enableReaderMode() async {
    final Map data = await _channel.invokeMethod('NfcEnableReaderMode');
    final NfcData result = NfcData.fromMap(data);

    return result;
  }

  Future<NfcData> read({String instruction}) async {
    final Map data = await _callRead(instruction: instruction);
    final NfcData result = NfcData.fromMap(data);
    return result;
  }

  Future<Map> _callRead({instruction: String}) async {
    return await _channel
        .invokeMethod('NfcRead', <String, dynamic>{"instruction": instruction});
  }

  Future<NFCAvailability> checkNFCAvailability() async {
    var availability =
        "NFCAvailability.${await _channel.invokeMethod<String>("NfcAvailable")}";
    return NFCAvailability.values
        .firstWhere((item) => item.toString() == availability);
  }
}
