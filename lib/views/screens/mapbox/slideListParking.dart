import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/controllers/controller.dart';
import 'package:share_your_park/models/parking.dart';
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

  String latDepart = '48.862056';
  String lngDepart = '2.339432';
  String latParking;
  String lngParking;
  int current = 0;
  Controller controller = Controller();
  List<LatLng> points = [];

  @override
  Widget build(BuildContext context) {
    if (latParking == null) {
      latParking = this.listObjetParking[current].lng.toString();
      lngParking = this.listObjetParking[current].lat.toString();
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
          Container(
            child: FlutterMap(
              options: MapOptions(
                  center: LatLng(48.862056, 2.339432), zoom: 18, maxZoom: 48),
              layers: [
                tileLayerOptions,
                MarkerLayerOptions(markers: [
                  Marker(
                      width: 35.0,
                      height: 35.0,
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
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                        points: points,
                        color: Color(0xFFFF008D),
                        strokeWidth: 6.0)
                  ],
                )
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
                });
                Future<List<LatLng>> result = controller.getListLatLng(
                    latDepart, lngDepart, latParking, lngParking);
                result.then((value) {
                  setState(() {
                    points = value;
                  });
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
                              parking.nomRue != null
                                  ? parking.numRue.toString() +
                                      ' rue ' +
                                      parking.nomRue
                                  : 'sans nom voie',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 12),
                              textAlign: TextAlign.justify,
                            ),
                          ]),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Image.asset(
                                      "assets/icons/Time_Circle.png")),
                              Container(
                                child: Text(
                                  'duree',
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  'prix: ' + parking.tarif,
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
                                  'taille M',
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            minWidth: 150,
                            //padding: EdgeInsets.all(10),
                            color: Color(0xFFFFFFFF),
                            child: Text("Go",
                                style: TextStyle(color: Color(0xFFFF008D))),
                            onPressed: () {},
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
}
