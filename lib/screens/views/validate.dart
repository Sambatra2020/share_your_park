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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
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
                          margin: EdgeInsets.only(
                            //top: 20, right:85
                            top: screenHeight * 0.02,
                            right: screenWidth * 0.3
                            ),
                              //color: Colors.amber,
                                child: Image.asset('assets/images/validate.png' )
                             ),
                             SizedBox(height: screenHeight * 0.01,),
                        Row(
                          children: [
                            Container(margin: EdgeInsets.only(
                              
                              left: screenWidth * 0.06, right: screenWidth * 0.02,
                              ),
                              child: Image.asset('assets/icons/validverrou.png')),
                              Text(
                                  "Vos données personnelles sont \nuniquement utilisées pour adapter \nl'application à vos besoins",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize: (40 / screenWidth) * 100, wordSpacing: 1,
                                  
                                  )
                                ),
                          
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01,),
                        Row(
                          children: [
                            Container(margin: EdgeInsets.only(
                              left: screenWidth * 0.06, right: screenWidth * 0.02,
                            ),
                              child: Image.asset('assets/icons/validcheck.png')),
                              Text(
                                  "Nous ne partageons pas à nos \ntiers vos données à des fins \ncommerciales",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:(40 / screenWidth) * 100, wordSpacing: 1,
                                  
                                  )
                                ),
                            
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01,),
                        Row(
                          children: [
                            Container(margin: EdgeInsets.only(
                              left: screenWidth * 0.06, right: screenWidth * 0.02,
                            ),
                              child: Image.asset('assets/icons/validsend.png')),
                              Text(
                                  "Nous utilisons uniquement vos \ndonnées pour échanger avec vous\nsyp vos données restent privée",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:(40 / screenWidth) * 100, wordSpacing: 1,
                                  
                                  )
                                ),
                            
                          ],
                        ),
                        SizedBox(height:screenHeight * 0.02,),

                        RichText(
                          text: TextSpan(
                            text:'Lire la politique de confidentialité et les CGV',
                            style: TextStyle(color: Colors.white, fontFamily: 'Quicksand', fontSize:(36 / screenWidth) * 100, wordSpacing: 2,
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
                             margin: EdgeInsets.only(
                               //left: 30, right: 15, top: 30
                               left: screenWidth * 0.1,
                               right: screenWidth * 0.01,
                               top: screenWidth * 0.07,
                               ),
                             child: CheckBox()),
                           
                        Container(
                          margin: EdgeInsets.only(  top: screenWidth * 0.07),
                          child: Text(
                            "J'accepte de partager avec syp mes \ninfos afin d'établir mon profil de syppeur",
                            style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:(36 / screenWidth) * 100, wordSpacing: 2,
                          ),),
                        )
                         ]
                       ),
                        Row(
                        
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: <Widget> [
                           Container(
                             margin: EdgeInsets.only(
                               left: screenWidth * 0.1,
                               right: screenWidth * 0.01,
                               top: screenWidth * 0.06,
                             ),
                             child: CheckBox()),
                           
                        Container(
                          margin: EdgeInsets.only(   top: screenWidth * 0.06),
                          child: Text(
                            "J'ai lu et j'accepte les conditions \ngénérales d'utilisation",
                            style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:(36 / screenWidth) * 100, wordSpacing: 2,
                          ),),
                        )
                         ]
                       ),
                  Container(
                            margin: EdgeInsets.only(top:screenHeight * 0.02),
                        width: screenWidth * 0.45, height: screenHeight * 0.08,
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
                              fontSize:(90 / screenHeight) * 100,
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