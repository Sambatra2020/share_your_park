import 'package:flutter/material.dart';

class Flat extends StatefulWidget {
  final bool isPressed;
  final double size;
  Flat({this.isPressed, this.size});
  @override
  _FlatState createState() => _FlatState();
}

class _FlatState extends State<Flat> {
  bool pressed = false;
  @override
  void initState() {
    pressed = widget.isPressed ?? false;
    super.initState();
  }

  Widget build(BuildContext context) {

    return GestureDetector(
      onTap:  (){
           setState(() {
               pressed = !pressed;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
            border: pressed ? Border.all(width: 2.0, color: Colors.pink)
          ), 
            
            ),
      
    );
  }
}