import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFFFF008D), Color(0xFFFF6EBE)],
);
const kfontFamily = "Quicksand-Light";
const kTextColor = Color(0xFFFFFFFF);
const kAnimationDuration = Duration(milliseconds: 200);
const kbordercolor = Color(0xFFFF008D);
const kinputdeco =
    UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF008D)));
final tileLayerOptions = TileLayerOptions(
    urlTemplate:
        'https://api.mapbox.com/styles/v1/sambatra/ckgbwa2x706vs1ap3n6qcaptj/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA',
    subdomains: [
      'a',
      'b',
      'c'
    ],
    additionalOptions: {
      'accessToken':
          'pk.eyJ1Ijoic2FtYmF0cmEiLCJhIjoiY2tmeHhicGs0MXMzOTJyczh4eGp5aGltcSJ9.Tf6Svlf_iXkHzOF9-9rARA',
      'id': 'mapbox.mapbox-streets-v7'
    });
