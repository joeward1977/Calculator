import 'package:calculator/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color fillColor = kButtonColor;
  final Color textColor = kButtonTextColor;
  final double textSize = kButtonTextSize;
  final String operation;
  final Function callback;
  final Function callback2;

  CalcButton({
    Key key,
    this.text,
    this.operation,
    this.callback,
    this.callback2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kEdgeInset),
      child: SizedBox(
        width: kButtonSize,
        height: kButtonSize,
        child: ElevatedButton(
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(fontSize: textSize, color: textColor),
            ),
          ),
          onPressed: () {
            callback(operation ?? text);
            callback2();
            print(text);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(kButtonSize * .9, kButtonSize * .9),
            shape: const CircleBorder(),
            primary: fillColor != null ? fillColor : null,
          ),
        ),
      ),
    );
  }
}
