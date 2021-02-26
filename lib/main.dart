import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.teal.shade600,
      body: Calculator(),
    ),
  ));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  void equalPressed() {
    String finalQue = myQuestion;
    finalQue = finalQue.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQue);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    myAnswers = eval.toString();
  }

  var myQuestion = '';
  var myAnswers = '';
  final List<String> buttons = [
    'c',
    'del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ans',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 179,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      myQuestion,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      myAnswers,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0,
          width: 420,
          child: Divider(
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.builder(
            itemCount: buttons.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      myQuestion = '';
                    });
                  },
                  buttotext: buttons[index],
                  color: Colors.white,
                  textcolor: Colors.black,
                );
              } else if (index == 1) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      myQuestion =
                          myQuestion.substring(0, myQuestion.length - 1);
                    });
                  },
                  buttotext: buttons[index],
                  color: Colors.white,
                  textcolor: Colors.black,
                );
              } else if (index == buttons.length - 1) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      equalPressed();
                    });
                  },
                  buttotext: buttons[index],
                  color: Colors.white,
                  textcolor: Colors.black,
                );
              } else {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      myQuestion += buttons[index];
                    });
                  },
                  buttotext: buttons[index],
                  color: Colors.white,
                  textcolor: Colors.black,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
