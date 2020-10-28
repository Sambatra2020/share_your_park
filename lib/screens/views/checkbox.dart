import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CheckBox extends StatefulWidget {
  final bool isChecked;
  final double size;
  CheckBox({this.isChecked, this.size});

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool checked = false;
  @override
  void initState() {
    checked = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            checked = !checked;
          });
        },
        child: AnimatedContainer(
          height: widget.size ?? 30,
          width: widget.size ?? 30,
          decoration: BoxDecoration(
              color: checked ? Colors.grey[300] : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border:
                  checked ? null : Border.all(color: Colors.grey, width: 2.0)),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          child: checked
              ? Icon(
                  Entypo.check,
                  color: Colors.black,
                )
              : null,
        ));
  }
}
