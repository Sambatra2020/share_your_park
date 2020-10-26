import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share_your_park/screens/views/car.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                            margin: EdgeInsets.only(
                             left: screenWidth * 0.13, top: screenHeight * 0.01),
                           child: Align(
                 
                             child: Image.asset(
                               'assets/images/bien.png',
                                height: screenHeight * 0.4,
                                width: screenWidth * 0.7,

                                alignment: Alignment(0, 1),)
                           ),
                         ),
                       
                         Center(
                           child: Text(
                             "Enregistre-toi !",
                             style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Quicksand')
                           )
                         )
                       ],
                     ),
                     )
                 ),
                 Container( height: screenHeight * 0.02,color: Color(0xFFA3005A),),
                 Column(
                 children: [
                    Padding(
                       padding: const EdgeInsets.only(  left:40,right: 40 ),
                      child: Row(
                              children: [
                                Expanded(
                                  //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                                  child: TextField(
                                      decoration: InputDecoration(
                                  
                                    enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                                    prefixIcon: Icon(FontAwesome.user, color: Color(0xFFFF008D)),
                                    labelText: 'Nom',
                                    labelStyle: TextStyle(color: Color(0xFFFF008D),
                                    
                                    ),
                                    ),
                                        ),
                                ),
                                SizedBox(width: screenWidth * 0.025,),
                                Expanded(
                                  //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                                  child: TextField(
                                      decoration: InputDecoration(
                                  
                                    enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                                    
                                    labelText: 'Prénom',
                                    labelStyle: TextStyle(color: Color(0xFFFF008D),
                                    
                                    ),
                                    ),
                                        ),
                                ),
                              ],
                                ),
                              ),
                Padding(
                       padding: const EdgeInsets.only(left:40.0,right: 40),
                      child: Row(
                 children: [
                   Expanded(
                     //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                     child: TextField(
                        decoration: InputDecoration(
                     
                      enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                      prefixIcon: Icon(FontAwesome.home, color: Color(0xFFFF008D)),
                      labelText: 'Adresse',
                      labelStyle: TextStyle(color: Color(0xFFFF008D),
                       
                      ),
                      ),
                           ),
                   ),
                   SizedBox(width: screenWidth * 0.025,),
                   Expanded(
                     //margin: EdgeInsets.symmetric(vertical:5, horizontal: 130),
                     child: TextField(
                        decoration: InputDecoration(
                     
                      enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                      
                      labelText: 'Code postal',
                      labelStyle: TextStyle(color: Color(0xFFFF008D),
                       
                      ),
                      ),
                           ),
                   ),
                 ],
                ),
              ),
                Container(
                  height: screenHeight * 0.09,
                  width: screenWidth * 0.78,
                     child: TextField(
                  decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                  prefixIcon: Icon(FontAwesome.phone, color: Color(0xFFFF008D)),
                  labelText: 'Numéro de téléphone',
                  labelStyle: TextStyle(color: Color(0xFFFF008D),
                 ),
                ),
               ),
             ),
                              
              Container(
                height: screenHeight * 0.09,
                width: screenWidth * 0.78,
                  child: TextField(
                  decoration: InputDecoration(
                   enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                  prefixIcon: Icon(FontAwesome.envelope, color: Color(0xFFFF008D)),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color(0xFFFF008D),
                 
                  ),
                  ),
                  ),
                   ),
                              
                Container(
                  height: screenHeight * 0.09,
                  width: screenWidth * 0.78,
                     child: TextField(
                 obscureText: true,
                  decoration: InputDecoration(
                                 
                                 enabledBorder: UnderlineInputBorder (borderSide: BorderSide(color:Color(0xFFFF008D) )),
                                 prefixIcon: Icon(FontAwesome.lock, color: Color(0xFFFF008D)),
                                 labelText: 'Mot de passe',
                                 labelStyle: TextStyle(color: Color(0xFFFF008D),
                 
                                 ),
                                 ),
                           ),
                              ),
                              SizedBox(width: screenWidth * 0.015,),
                           Container(
                           //height: 50,width: 240,
                           height: screenHeight * 0.07,
                           width: screenWidth * 0.7,
                           child: FlatButton(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                             color: Color(0xFFFF008D),
                             onPressed: (){
                               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Car())
                  );
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
                            
                         ]       
                   ),
               ]
             ),
             ),
         ),
       ),
    );
  }
}

