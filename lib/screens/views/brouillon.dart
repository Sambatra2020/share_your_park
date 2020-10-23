import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';

class Brouillon extends StatefulWidget {
  @override
  _BrouillonState createState() => _BrouillonState();
}

class _BrouillonState extends State<Brouillon> {
  
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
                          margin:  EdgeInsets.only(left:25, top: 15),
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

                  //taille de voiture
                  Align(
                    alignment: Alignment(-0.7, 0),
                    //color: Colors.orange,
                    child: Text(
                     "Type de véhicule",
                      style: TextStyle(color: Color(0xFFFF008D), fontFamily: 'Arial', fontSize: 16, ),
                      textAlign: TextAlign.left,
                      ),
                  ),
                  Container(
                    height: 70,
                    //color: Colors.lime,
                    child: Align(
                      child: Row(
                        children: [
                          
                          Container(
                            margin: EdgeInsets.only(left:50),
                            height: 45,
                            child: FloatingActionButton(
                              onPressed: () {  }, 
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Image.asset('assets/images/taxijaune.png', alignment: Alignment.center,),
                                  Text('Electrique', style: TextStyle(color: Colors.black, fontSize: 8),)
                                ]
                              ),
                                ),
                          ),
                          
                              Container(
                                margin: EdgeInsets.only(left:10),
                                height: 45,
                                child: FloatingActionButton(
                                onPressed: () {  },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                backgroundColor: Colors.white,
                                child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Icon(FontAwesome.car, color: Colors.grey,),
                                  Text('Thermique', style: TextStyle(color: Colors.black, fontSize: 8),)
                                ]
                              ),
                                ),
                              ),
                          
                        ]
                      ),
                    ),
                  ),
       //taille de voiture
                Align(
                    alignment: Alignment(-0.7, 0),
                    //color: Colors.orange,
                    child: Text(
                     "Type de véhicule",
                      style: TextStyle(color: Color(0xFFFF008D), fontFamily: 'Arial', fontSize: 16, ),
                      textAlign: TextAlign.left,
                      ),
                  ),
                  Container(
                    height: 70,
                    //color: Colors.lime,
                    child: Align(
                      child: Row(
                        children: [
                          
                          Container(
                            margin: EdgeInsets.only(left:50),
                            height: 45, width: 45,
                            child: FloatingActionButton(
                              onPressed: () {  }, 
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.white,
                                ),
                          ),
                          
                              Container(
                                margin: EdgeInsets.only(left:10),
                                height: 45, width: 45,
                                child: FloatingActionButton(
                                onPressed: () {  },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                backgroundColor: Colors.white,
                                ),
                              ),

                              Container(
                            margin: EdgeInsets.only(left:10),
                            height: 45, width: 45,
                            child: FloatingActionButton(
                              onPressed: () {  }, 
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.white,
                                ),
                          ),

                         ]
                      ),
                    ),
                  ),

                  
                  //bouton inscription
                          Container(
                        width: 240,
                        height: 40,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          color: Color(0xFFFF008D),
                          onPressed: (){
                           
                          }, 
                          child: Text(
                            "S'inscrire",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Quicksand'
                            ),
                          
                          )
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
