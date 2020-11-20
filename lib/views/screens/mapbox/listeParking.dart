import 'dart:typed_data';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/controllers/controller.dart';
import 'package:share_your_park/models/parking.dart';
import 'package:share_your_park/models/trajet.dart';
import 'package:share_your_park/services/database.dart';
import 'package:share_your_park/views/screens/mapbox/je_me_gare.dart';
import 'package:share_your_park/views/screens/mapbox/slideListParking.dart';
import 'package:share_your_park/views/screens/menu/menu_principal.dart';
import 'dart:ui' as ui;

class ListeParking extends StatefulWidget {
  final List<Parking> listObjetParking;
  final int current;
  ListeParking({this.listObjetParking, this.current});
  @override
  _ListeParkingState createState() =>
      _ListeParkingState(listObjetParking, current);
}

class _ListeParkingState extends State<ListeParking> {
  List<Parking> listObjetParking;
  Uint8List capture;
  int current;
  _ListeParkingState(this.listObjetParking, this.current);

  Controller controller = Controller();

  String latDepart = '48.849519';
  String lngDepart = '2.293370';
  String latParking;
  String lngParking;
  bool showdetail = false;
  List<String> centreCamera = [];
  List<Parking> listeParking = [];
  String duration = '', distance = '';
  List<double> positionDepart = [], positionArriver = [];
  MapController _mapCtrl = MapController();
  GlobalKey _key = GlobalKey();
  List<LatLng> points = [];
  Map<String, dynamic> mapS = {};
  final FirebaseMessaging messaging = FirebaseMessaging();
  DatabaseService databaseService = DatabaseService(uid: "onja");
  @override
  void initState() {
    super.initState();
    controller.getListParkingData(lngDepart, latDepart);
    listeParking = controller.listeParking;
    messaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    messaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    positionDepart = [double.parse(latDepart), double.parse(lngDepart)];
    if (listObjetParking == null) {
      listObjetParking = listeParking;
      current = 0;
    }
    if (latParking == null) {
      setState(() {
        latParking = this.listObjetParking[current].lng.toString();
        lngParking = this.listObjetParking[current].lat.toString();
        positionArriver = [double.parse(latParking), double.parse(lngParking)];
        centreCamera = [latParking, lngParking];

        Future<List<LatLng>> result = controller.getListLatLng(
            latDepart, lngDepart, latParking, lngParking);
        result.then((value) {
          setState(() {
            points = value;
            duration = controller.duration;
            distance = controller.distance;
          });
        });
      });
    } else {
      mapS = controller.calculCentreEtDistance2LatLng(
          double.parse(latDepart),
          double.parse(lngDepart),
          double.parse(latParking),
          double.parse(lngParking));

      controller.moveCamAndZoomAuto(mapS, distance, _mapCtrl);
    }

    return Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(top: 15),
          child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(50),
                      topEnd: Radius.circular(50),
                      bottomStart: Radius.circular(50),
                      bottomEnd: Radius.zero)),
              backgroundColor: Color(0xFFFF008D),
              child: Icon(
                Entypo.menu,
                color: Color(0xFFFFFFFF),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MenuPrincipal()));
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Stack(children: [
          RepaintBoundary(
            key: _key,
            child: Container(
              child: FlutterMap(
                mapController: _mapCtrl,
                options: MapOptions(
                  center: mapS['centre'],
                  // LatLng(double.parse(latDepart), double.parse(lngDepart)),
                  zoom: 20.0,
                ),
                layers: [
                  tileLayerOptions,
                  PolylineLayerOptions(
                    polylines: [
                      Polyline(
                          points: points,
                          color: Color(0xFFFF008D),
                          strokeWidth: 6.0)
                    ],
                  ),
                  MarkerLayerOptions(markers: [
                    Marker(
                        width: 40.0,
                        height: 40.0,
                        point: LatLng(
                            double.parse(latDepart), double.parse(lngDepart)),
                        builder: (context) => Container(
                            child: Image.asset(
                                "assets/images/positionDepart.png"))),
                    Marker(
                        width: 40.0,
                        height: 40.0,
                        point: LatLng(
                            double.parse(latParking), double.parse(lngParking)),
                        builder: (context) => Container(
                            child:
                                Image.asset("assets/images/positionVert.png"))),
                  ]),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.9, -0.85),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              width: 130,
              height: 54,
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 49.0,
                    lineWidth: 5.0,
                    percent: 0.6,
                    center: Image.asset("assets/images/positionDepart.png"),
                    backgroundColor: Colors.white,
                    progressColor: Color(0xFFFF008D),
                  ),
                  Text(
                    ' 12 720XP',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.9, 0.5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: 20,
              //padding: EdgeInsets.all(10),
              color: Color(0xFFFF008D),
              child: Icon(Icons.search, color: Color(0xFFFFFFFF)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SlideListParking(
                            listObjetParking: this.listObjetParking)));
              },
            ),
          ),
          Align(
            alignment: Alignment(0.9, 0.5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: 20,
              //padding: EdgeInsets.all(10),
              color: Color(0xFFFF008D),
              child: Icon(FontAwesome.rss, color: Color(0xFFFFFFFF)),
              onPressed: () {
                print("======================");

                Future<List<Trajet>> listeTrajet =
                    databaseService.readDatatrajet();
                listeTrajet.then((value) {
                  print(value.length);
                  for (int i = 0; i < value.length; i++) {
                    print(value[i].time);
                  }
                });
              },
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              minWidth: 150,
              //padding: EdgeInsets.all(10),
              color: Color(0xFFFF008D),
              child:
                  Text("j'y vais", style: TextStyle(color: Color(0xFFFFFFFF))),
              onPressed: () async {
                //creation trajet d'un utilisateur
                int idTrajet;
                await databaseService.idTrajet().then((value) {
                  setState(() {
                    idTrajet = value;
                  });
                });

                Future<Uint8List> result = convertWidgetToImage();
                result.then((value) {
                  setState(() {
                    capture = value;
                    print(capture);
                    databaseService.addScreenShootTrajet(capture);
                  });
                });

                Trajet trajet = Trajet();
                trajet.setidTrajetId(idTrajet);
                trajet.setdureeTrajet(double.parse(duration));
                trajet.setdistanceTrajet(double.parse(distance));
                trajet.settrajetCoords(
                    controller.convertionLatLngToListdouble(points));
                trajet.setpositionDepart(positionDepart);
                trajet.setpositionArriver(positionArriver);
                trajet.setDate(DateTime.now().toString());

                //insertion du trajet dans firebase

                databaseService.addDataTrajet(trajet);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Garer(
                              centreCamera: centreCamera,
                            )));
              },
            ),
          ),
        ]));
  }

  Future<Uint8List> convertWidgetToImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        _key.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData.buffer.asUint8List();
    return uint8list;
  }
}
