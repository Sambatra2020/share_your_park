import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_your_park/controllers/controller.dart';
import 'package:share_your_park/models/parking.dart';

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
  String latParking = '48.866029';
  String lngParking = '2.340308';
  int current = 0;

  @override
  Widget build(BuildContext context) {
    MapboxMapController mapController;
    Controller controller = new Controller(mapController: mapController);
    print("parking");
    print(latParking);
    print(lngParking);

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
              onPressed: () {}),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Stack(children: [
          Container(
            child: controller.creationCarteMapBox(
                latDepart, lngDepart, latParking, lngParking),
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
              onPageChanged: (index) {
                setState(() {
                  current = index;
                  latParking = listObjetParking[current].lat.toString();
                  lngParking = listObjetParking[current].lng.toString();
                  print(current);
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
                              style: TextStyle(color: Color(0xFFFFFFFF)),
                              textAlign: TextAlign.justify,
                            ),
                          ]),
                          Row(),
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
