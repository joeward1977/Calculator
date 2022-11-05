import 'package:calculator/bottonList.dart';
import 'package:calculator/calculate.dart';
import 'package:calculator/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  // Variable to store
  String _history = '';
  // Variables to store what is pressed by the keys
  String _expression = '';
  Calculate calc = new Calculate();
  ButtonList buttons;

  @override
  void initState() {
    super.initState();
    buttons = new ButtonList(calc: calc, updateGUI: updateGUI);
    buttons.addButtons();
  }

  void updateGUI() {
    setState(() {
      _history = calc.history;
      _expression = calc.expression;
    });
  }

  // Create keypad by making rows and colums of buttons with nested for loops
  Widget getButtons() {
    return SizedBox(
        height: kKeypadSize, // Some height
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          for (var i = 0; i < (((buttons.getSize() - 2) ~/ kRowWidth) + 1); i++)
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  for (var j = 0; j < kRowWidth; j++)
                    Container(
                      child: ((i * kRowWidth + j + 1) < buttons.getSize())
                          ? buttons.getButton(i * kRowWidth + j + 1)
                          : buttons.getButton(0),
                    ),
                ]))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          padding: EdgeInsets.all(kEdgeInset),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Area which holds the history of the calculator
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: kEdgeInset),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: kExpressionHistoryFontSize,
                        color: kExpressionHistoryColor,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),

              // Area which holds the current expression to be calculated
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(kEdgeInset),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: kExpressionFontSize,
                        color: kExpressionColor,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),

              // Area which holds all the buttons
              //SizedBox(height: 40),
              getButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
