import 'package:flutter/material.dart';

import '../Models/operator_model.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double num1 = 0;
  double num2 = 0;
  double result = 0;
  bool firstOrSecond = true;
  late String text = '';
  int operatorIndex = -1;
  bool isTextEnabled = false;

  final List<Operatorr> operators = [
    Adding(),
    Subtraction(),
    Multiplying(),
    Division(),
    Mod()
  ];

  final List<int> column1 = [1, 2, 3];
  final List<int> column2 = [4, 5, 6];
  final List<int> column3 = [7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 30),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Visibility(
                  visible: isTextEnabled,
                  child: Text(
                    result.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 20.0, bottom: 8.0, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: column1
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(24),
                            ),
                            onPressed: () {
                              setState(() {
                                if (firstOrSecond) {
                                  num1 = num1 * 10 + e;
                                } else {
                                  isTextEnabled = true;
                                  num2 = num2 * 10 + e;
                                  result = operators[operatorIndex]
                                      .operating(num1, num2);
                                  num1 = result;
                                }
                                text += e.toString();
                              });
                            },
                            child: Text(
                              e.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 20.0, bottom: 8.0, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: column2
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(24),
                            ),
                            onPressed: () {
                              setState(() {
                                if (firstOrSecond) {
                                  num1 = num1 * 10 + e;
                                } else {
                                  isTextEnabled = true;
                                  num2 = num2 * 10 + e;
                                  result = operators[operatorIndex]
                                      .operating(num1, num2);
                                  num1 = result;
                                }
                                text += e.toString();
                              });
                            },
                            child: Text(
                              e.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 20.0, bottom: 8.0, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                      onPressed: () {
                        setState(() {
                          operatorIndex = 4;
                          firstOrSecond = false;
                          num2 = 0;

                          if (text.isNotEmpty &&
                              (text.endsWith('+') ||
                                  text.endsWith('-') ||
                                  text.endsWith('×') ||
                                  text.endsWith('÷') ||
                                  text.endsWith('%'))) {
                            text = text.substring(0, text.length - 1) +
                                Mod().symbol +
                                ' ';
                          } else {
                            text += ' ' + Mod().symbol + ' ';
                          }
                        });
                      },
                      child: Text(
                        Mod().symbol,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ...column3
                        .map((e) => Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(24),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (firstOrSecond) {
                                      num1 = num1 * 10 + e;
                                    } else {
                                      isTextEnabled = true;
                                      num2 = num2 * 10 + e;
                                      result = operators[operatorIndex]
                                          .operating(num1, num2);
                                      num1 = result;
                                    }
                                    text += e.toString();
                                  });
                                },
                                child: Text(
                                  e.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {},
                      child: Text(
                        '.',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 20.0, bottom: 8.0, top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ...operators
                          .sublist(0,
                              operators.length - 1) // Exclude the last element
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(24),
                                ),
                                onPressed: () {
                                  setState(() {
                                    operatorIndex = operators.indexOf(e);
                                    firstOrSecond = false;
                                    num2 = 0;

                                    if (text.isNotEmpty &&
                                        (text.endsWith('+') ||
                                            text.endsWith('-') ||
                                            text.endsWith('×') ||
                                            text.endsWith('÷') ||
                                            text.endsWith('%'))) {
                                      text =
                                          text.substring(0, text.length - 1) +
                                              e.symbol;
                                    } else {
                                      // Add the new operator to the text
                                      text += ' ' + e.symbol;
                                    }
                                  });
                                },
                                child: Text(
                                  e.symbol,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(24),
                        ),
                        onPressed: () {
                          setState(() {
                            text = result.toString();
                            isTextEnabled = false;
                          });
                        },
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
