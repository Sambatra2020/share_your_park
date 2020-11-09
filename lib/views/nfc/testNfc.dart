import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class TestNFC extends StatefulWidget {
  @override
  _TestNFCState createState() => _TestNFCState();
}

class _TestNFCState extends State<TestNFC> {
  TextEditingController writerController = TextEditingController();
  @override
  initState() {
    super.initState();
    writerController.text = 'Flutter NFC Scan';
    FlutterNfcReader.onTagDiscovered().listen((onData) {
      print(onData.id);
      print(onData.content);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    writerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            controller: writerController,
          ),
          RaisedButton(
            onPressed: () async{
              print("start reading NFC");
              await FlutterNfcReader.read(instruction: "It's reading");
              print("read ok");
            },
            child: Text("Read"),
          ),
          RaisedButton(
            onPressed: () async {
              print("start writing NFC");
              await FlutterNfcReader.write(" ", writerController.text).then((value) {
                print(value.content);
              });
              print("write ok");
            },
            child: Text("Write"),
          )
        ],
      ),
    );
  }
}
