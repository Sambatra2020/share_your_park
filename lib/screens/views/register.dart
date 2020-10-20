import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      //colors: [Color(0xFF008D), Color(0xFF8DCC)
      colors: [Color(0xFFFF008D), Color(0xFFFF41AA),])
       //color: Colors.pink
        ),
        child: Align(
          alignment: Alignment.topCenter,
           child: Column(
              children: [
              
              SizedBox(height: 45),
              Center(
                child: Image.asset(
                  'assets/bon.png',
                  width: 200, height: 200,
                  alignment: Alignment.center,
                  //alignment: Alignment.bottomCenter
                 ),
              ),
               SizedBox(height: 25),
              //Text("Enregistre-toi!", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'Quicksand' ))
             // ignore: missing_required_param
             FlatButton(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
               color: Colors.black,
               onPressed: (){},  
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Icon(FlutterIcons.apple_mco, color: Colors.white),
                   SizedBox(height: 10,),
                    Text(
                    'Connecter avec Apple',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Roboto'),
                   ),
                 ],
               ),
               ),
               
               FlatButton(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
               color: Color(0xFF5071C3),
               onPressed: (){},  
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Image.asset('assets/fb 1.png', width: 16, height: 16,),
                  Text(
                    'Connecter avec Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Roboto'),
                   ),
                 ],
               ),
               ),
               //SizedBox(height:10),
               FlatButton(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
               color: Colors.white,
               onPressed: (){},  
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Image.asset('assets/google.png', width: 16, height: 16,),
                    Text(
                    'Connecter avec google',
                    style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Roboto'),
                   ),
                 ],
               ),
               ),
                //SizedBox(height:10),
               FlatButton(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
               color: Colors.white,
               onPressed: (){},  
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                  Image.asset('assets/Message.png', width: 22, height: 22,),
                  Text(
                    'Connecter avec Email',
                    style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Roboto'),
                   ),
                 ],
               ),
               ),

               SizedBox(height: 20),
               Text('On partagera jamais rien sans', style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 10),),
               Text('ta permission', style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 10),),
               FloatingActionButton(
                 onPressed: (){},
                 backgroundColor: Color(0xFFFF008D),
               ),
          ],
           )
               
  ),
      )
    );
  }
}