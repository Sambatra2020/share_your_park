import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class InfoEdit extends StatefulWidget {
  @override
  _InfoEditState createState() => _InfoEditState();
}

class _InfoEditState extends State<InfoEdit> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController tailleController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    phoneController.text = 'x xx xx xx xx';
    adresseController.text = 'exemple@gmail.com';
    typeController.text ='Eléctrique/Thermique';
    tailleController.text ='Medium/Small/Large';
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Container(
           decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 2,
                  colors: [Color(0xFFFF008D), Color(0xFFAD206E)],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1),
                child: ListView(
                  children: [
                    Row( 
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.15, bottom: screenHeight * 0.03),
                          child: Icon(FontAwesome.user, color: Colors.white,),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.03, bottom: screenHeight * 0.03),
                          child: Text(
                            'Mes \ninformations',
                            style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (140 / screenHeight) * 100, 

                                ),

                            )
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01,),
                      
                        
                  Container( 
                        width: screenWidth * 0.75,
                        height: screenHeight * 0.7,
                        decoration: BoxDecoration(
                      boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              //spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0.0, 0.75), // changes position of shadow
                            ),
                          ],
                          color: Color(0xFFDB1B8D),
                           borderRadius: BorderRadius.circular(25),
                      ),
                      child: Form(
                        child: Column(
                          children: [
                             Container(
                                //color: Colors.yellow,
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                                /*height: screenHeight * 0.09,
                                width: screenWidth * 0.78,*/
                                child: TextFormField(
                                  controller: phoneController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xFFC8C8C8))),
                                    
                                    labelText: 'Numéro de téléphone',labelStyle: TextStyle(
                                      color: Color(0xFFC8C8C8),
                                      fontSize: 15,
                                    ),
                                  ),
                                  
                                ),
                              ),
                            
                            Container(
                                //color: Colors.yellow,
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                                /*height: screenHeight * 0.09,
                                width: screenWidth * 0.78,*/
                                child: TextFormField(
                                  controller: adresseController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xFFC8C8C8))),
                                    
                                    labelText: 'Adresse Email',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFC8C8C8),
                                      fontSize: 15,
                                    ),
                                  ),
                                  
                                ),
                              ),
                             Container(
                                //color: Colors.yellow,
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                                /*height: screenHeight * 0.09,
                                width: screenWidth * 0.78,*/
                                child: TextFormField(
                                  controller: typeController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xFFC8C8C8))),
                                    
                                    labelText: 'Type de véhicule',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFC8C8C8),
                                      fontSize: 15,
                                    ),
                                  ),
                                  
                                ),
                              ),
                              Container(
                                
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                               
                                child: TextFormField(
                                  controller: tailleController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xFFC8C8C8))),
                                    
                                    labelText: 'Taille de voiture',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFC8C8C8),
                                      fontSize: 15,
                                    ),
                                  ),
                                 
                                  
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: screenHeight * 0.1),
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.08,
                                  child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25)),
                                      color: Colors.white,
                                      onPressed: () {},
                                      child: Text(
                                        "Valider",
                                        style: TextStyle(
                                            color: Color(0xFFFF008D),
                                            fontSize: screenHeight * 0.03,
                                            fontFamily: 'Quicksand'),
                                      )),
                                ),
                          ]
                        )
                        )
                    ),
                    
                   ],
                )
              ),
          ),
      ),
      floatingActionButton: Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.15,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
              fillColor: Color(0xFFFF008D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              elevation: 8.0,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop
    );
  }
}
 