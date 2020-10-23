import 'package:flutter/material.dart';

class Validate extends StatefulWidget {
  @override
  _ValidateState createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  bool checked = true;
    void change(bool isChecked){
      setState(() {
       checked = isChecked;
      });
    }
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
                           /* Column(
                               children: [
                                Text(
                                  "Vos données personnelles sont",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 3.5,
                                  
                                  )
                                ),
                                Text(
                                  "uniquement utilisées pour adapter",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 2)
                                ),
                                 Text(
                                  "l'application à vos besoins",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 3.5)
                                ),
                              ]
                            )*/
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
                            /*Column(
                               children: [
                                Text(
                                  "Nous ne partageons pas à nos tiers",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 1,
                                  
                                  )
                                ),
                                Text(
                                  "vos données à des fins commerciales",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 2)
                                ),
                              ]
                            )*/
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
                            /*Column(
                               children: [
                                Text(
                                  "Nous utilisons uniquement vos données",
                                  textAlign: TextAlign.left,
                                   style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 1,
                                  
                                  )
                                ),
                                Text(
                                  "pour échanger avec vous syp",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 2)
                                ),
                                Text(
                                  "vos données restent privée",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize:14, wordSpacing: 2)
                                ),
                              ]
                            )*/
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
                           Checkbox(
                              value: checked, 
                              onChanged: change
                        ),
                        Text('Se souvenir de moi'),
                         ]
                       ),
                  Container(
                            margin: EdgeInsets.only(top:10),
                        width: 170, height: 40,
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