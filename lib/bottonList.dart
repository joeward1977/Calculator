import 'package:calculator/calculate.dart';
import 'package:calculator/widgets/CalcButton.dart';

class ButtonList {
  final Calculate calc;
  final Function updateGUI;
  List<CalcButton> buttons = [];

  ButtonList({this.calc, this.updateGUI});

  CalcButton getButton(int index) {
    return buttons[index];
  }

  int getSize() {
    return buttons.length;
  }

  void addButtons() {
    buttons.add(new CalcButton(text: ''));
    buttons.add(new CalcButton(
        text: 'AC', callback: calc.allClear, callback2: updateGUI));
    buttons.add(
        new CalcButton(text: 'C', callback: calc.clear, callback2: updateGUI));
    buttons.add(new CalcButton(
      text: '√',
      operation: 'sqrt(',
      callback: calc.numClick,
      callback2: updateGUI,
    ));
    buttons.add(new CalcButton(
        text: '/', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '7', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '8', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '9', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '*', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '4', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '5', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '6', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '-', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '1', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '2', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '3', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '+', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '.', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '00', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '0', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '=', callback: calc.evaluate, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: '(', callback: calc.numClick, callback2: updateGUI));
    buttons.add(new CalcButton(
        text: ')', callback: calc.numClick, callback2: updateGUI));
  }
}
