import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/controllers/controller.dart';
import 'package:share_your_park/models/parking.dart';
import 'package:share_your_park/views/screens/mapbox/listeParking.dart';
import 'package:share_your_park/views/screens/menu/menu_principal.dart';

class SlideListParking extends StatefulWidget {
  final List<Parking> listObjetParking;
  SlideListParking({this.listObjetParking});
  @override
  _SlideListParkingState createState() =>
      _SlideListParkingState(listObjetParking);
}

class _SlideListParkingState extends State<SlideListParking> {
  List<Parking> listObjetParking;
  _SlideListParkingState(this.listObjetParking);
  String latDepart = '48.849519';
  String lngDepart = '2.293370';
  String latParking, lngParking;
  String latParking1, lngParking1;
  int current = 0, current1 = 0;
  Controller controller = Controller();
  MapController _mapCtrl = MapController();
  List<LatLng> points = [];
  String duration = '', distance = '';
  String taille;
  List<Parking> listeParking = [];
  Map<String, dynamic> mapS = {};
  bool checkControl = false;

  @override
  Widget build(BuildContext context) {
    if (listObjetParking == null) {
      controller.getListParkingData(lngDepart, latDepart);
      listeParking = controller.listeParking;
      listObjetParking = listeParking;
      current = 0;
    }
    if (latParking == null) {
      latParking = this.listObjetParking[current].lng.toString();
      lngParking = this.listObjetParking[current].lat.toString();
    }

    Future<List<LatLng>> result =
        controller.getListLatLng(latDepart, lngDepart, latParking, lngParking);
    result.then((value) {
      setState(() {
        points = value;
        duration = controller.duration;
        distance = controller.distance;
      });
    });
    mapS = controller.calculCentreEtDistance2LatLng(
        double.parse(latDepart),
        double.parse(lngDepart),
        double.parse(latParking),
        double.parse(lngParking));

    if (checkControl == true) {
      controller.moveCamAndZoomAuto(mapS, distance, _mapCtrl);
    }

    return Scaffold(
        extendBody: true,
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
          Container(
            child: FlutterMap(
              mapController: _mapCtrl,
              options: MapOptions(
                center: mapS['centre'],
                zoom: 20,
                maxZoom: 32,
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
                      width: 35.0,
                      height: 50.0,
                      point: LatLng(
                          double.parse(latDepart), double.parse(lngDepart)),
                      builder: (context) => Container(
                          child:
                              Image.asset("assets/images/positionDepart.png"))),
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
            alignment: Alignment(0, 0.9),
            child: CarouselSlider(
              height: 150,
              initialPage: 0,
              onPageChanged: (index) async {
                setState(() {
                  current = index;
                  latParking = listObjetParking[current].lng.toString();
                  lngParking = listObjetParking[current].lat.toString();
                  checkControl = true;
                });
              },
              items: listObjetParking.map((parking) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFFF008D),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20),
                      child: Column(
                        children: [
                          Row(children: [
                            Image.asset("assets/icons/position_path.png"),
                            Text(
                              checkNomEtNumRue(parking.nomRue, parking.numRue),
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 12),
                              textAlign: TextAlign.justify,
                            ),
                          ]),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 10, right: 5),
                                  child: Image.asset(
                                      "assets/icons/Time_Circle.png")),
                              Container(
                                child: Text(
                                  duration + " min",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Prix: ' + parking.tarif,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child:
                                      Image.asset("assets/icons/Filter.png")),
                              Container(
                                child: Text(
                                  "Taille " +
                                      checkTailleParking(parking.surface),
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            minWidth: 150,
                            //padding: EdgeInsets.all(10),
                            color: Color(0xFFFFFFFF),
                            child: Text("Go",
                                style: TextStyle(color: Color(0xFFFF008D))),
                            onPressed: () {
                              print("current : $current");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ListeParking(
                                            listObjetParking:
                                                this.listObjetParking,
                                            current: current,
                                          )));
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
          ),
        ]));
  }

  String checkTailleParking(double surface) {
    if (surface <= 6) {
      return 'S';
    } else if (surface > 6 && surface < 10) {
      return 'M';
    } else {
      return 'L';
    }
  }

  String checkNomEtNumRue(String nomRue, int numRue) {
    if (nomRue != null && numRue != null) {
      return numRue.toString() + ' Rue ' + nomRue;
    } else if (nomRue != null && numRue == null) {
      return ' Rue ' + nomRue;
    } else {
      return 'Rue Sans Nom';
    }
  }
}
