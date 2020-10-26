import 'package:flutter/material.dart';

import 'package:share_your_park/screens/views/checkbox.dart';

class Validate extends StatefulWidget {
  
  
  @override
  _ValidateState createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  
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
                    height: size.height * 2/3,
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
                          margin: EdgeInsets.only(top: 20, right:85),
                              //color: Colors.amber,
                                child: Image.asset('assets/images/validate.png' )
                             ),
                             SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(margin: EdgeInsets.only(left: 20,right: 10),
                              child: Image.asset('assets/icons/validverrou.png')),
                              Text(
                                  "Vos données personnelles sont \nuniquement utilisées pour adapter \nl'application à vos besoins",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 1,
                                  
                                  )
                                ),
                          
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(margin: EdgeInsets.only(left: 20,right: 10),
                              child: Image.asset('assets/icons/validcheck.png')),
                              Text(
                                  "Nous ne partageons pas à nos tiers \nvos données à des fins commerciales",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 1,
                                  
                                  )
                                ),
                            
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(margin: EdgeInsets.only(left: 20,right: 10),
                              child: Image.asset('assets/icons/validsend.png')),
                              Text(
                                  "Nous utilisons uniquement vos données \npour échanger avec vous syp \nvos données restent privée",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 1,
                                  
                                  )
                                ),
                            
                          ],
                        ),
                        SizedBox(height:30),

                        RichText(
                          text: TextSpan(
                            text:'Lire la politique de confidentialité et les CGV',
                            style: TextStyle(color: Colors.white, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 2,
                            decoration: TextDecoration.underline)
                         ), ),
                      ],
                    ),
                  ),
                  ),
                  Row(
                        
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: <Widget> [
                           Container(
                             margin: EdgeInsets.only(left: 30, right: 15, top: 30),
                             child: CheckBox()),
                           
                        Container(
                          margin: EdgeInsets.only(  top: 30),
                          child: Text(
                            "J'accepte de partager avec syp mes infos \nafin d'établir mon profil de syppeur",
                            style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 2,
                          ),),
                        )
                         ]
                       ),
                        Row(
                        
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: <Widget> [
                           Container(
                             margin: EdgeInsets.only(left: 30, right: 15, top: 20),
                             child: CheckBox()),
                           
                        Container(
                          margin: EdgeInsets.only(  top: 20),
                          child: Text(
                            "J'ai lu et j'accepte les conditions générales \nd'utilisation",
                            style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 2,
                          ),),
                        )
                         ]
                       ),
                  Container(
                            margin: EdgeInsets.only(top:15),
                        width: 140, height: 45,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          color: Color(0xFFFF008D),
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Validate())
                                );
                          }, 
                          child: Text(
                            "Valider",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Quicksand'
                            ),
                          
                          )
                          ),
                      ),
                ]
              ),
            ),
          ),
        ),      
    );
  }
}