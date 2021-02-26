import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttotext;
  final buttonTapped;

  MyButton({this.color, this.textcolor, this.buttotext, this.buttonTapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipOval(
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttotext,
                style: TextStyle(
                  color: textcolor,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
