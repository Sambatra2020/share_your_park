import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';

class Car extends StatefulWidget {
  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  //List <bool>_selections = List.generate(2, (index) => false);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: size.height/2,
                  
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                         colors: [
                      Color(0xFFFF008D),
                      Color(0xFFFF6EBE),
                    ])
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.amber,
                          margin:  EdgeInsets.only(left:25, top: 20),
                          child: Align(
                
                            child: Image.asset('assets/images/car.png', height: 300, width: 280,alignment: Alignment(0, 1),)
                          ),
                        ),
                      ]
                    ),
                    
                  ),
              ),
              Container(
                      height: 10.0,
                      color: Color(0xFFA3005A),
                      ),
                      SizedBox(
                        height: 10,
                      ),
              
              Column(
                children: [
                  Align(
                    alignment: Alignment(-0.5, 0),
                    //color: Colors.orange,
                    child: Text(
                     "Type de véhicule",
                      style: TextStyle(color: Color(0xFFFF008D), fontFamily: 'Arial', fontSize: 18, ),
                      textAlign: TextAlign.left,
                      ),
                  ),

                 

                  
                ],
              ),
              ],
              
          ),
        ),
      ),
      ),
    );
  }
}