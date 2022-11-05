import 'package:math_expressions/math_expressions.dart';

class Calculate {
  // Variable to store the key press history
  String history = '';
  // Variables to store what is pressed by the keys
  String expression = '';

  // If a number or operator is clicked add the value to the expression
  void numClick(String text) {
    expression += text;
  }

  // Clear the screen if the AC button is pressed
  void allClear(String text) {
    history = '';
    expression = '';
  }

  // Clear the current expression if the C buttin is pressed
  void clear(String text) {
    expression = '';
  }

  // Function to evalute the epxression and show result when the "=" sign is pressed
  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();

    history = expression;
    expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    history = history + " = " + expression;
  }
}
