import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/controllers/controller.dart';

class Garer extends StatefulWidget {
  final List<String> centreCamera;
  Garer({this.centreCamera});
  @override
  _GarerState createState() => _GarerState(centreCamera);
}

class _GarerState extends State<Garer> {
  List<String> centreCamera;
  _GarerState(this.centreCamera);

  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    double lat = double.parse(centreCamera[0]);
    double lng = double.parse(centreCamera[1]);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Stack(
        children: <Widget>[
          Container(
            child: FlutterMap(
              options:
                  MapOptions(center: LatLng(lat, lng), zoom: 18, maxZoom: 48),
              layers: [
                tileLayerOptions,
                MarkerLayerOptions(markers: [
                  Marker(
                      width: 40.0,
                      height: 40.0,
                      point: LatLng(lat, lng),
                      builder: (context) => Container(
                          child: Image.asset("assets/icons/taxirouge.png"))),
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
                    center: Image.asset("assets/images/Ellipse.png"),
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
              color: Color(0xFFFF008D),
              child: Icon(Icons.search, color: Color(0xFFFFFFFF)),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment(0.9, 0.5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: 20,
              color: Color(0xFFFF008D),
              child: Icon(Icons.rss_feed, color: Color(0xFFFFFFFF)),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              minWidth: 150,
              color: Color(0xFFFF008D),
              child: Text("Je me gare",
                  style: TextStyle(color: kTextColor, fontSize: 12)),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
