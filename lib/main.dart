import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNum = 6;
  int rightNum = 5;
  var randomGenerator = Random();

  void changeValues() {
    setState(() {
      leftNum = randomGenerator.nextInt(6) + 1;
      rightNum = randomGenerator.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {changeValues();},
              child: Image(
                  image:
                  AssetImage("images/dice" + leftNum.toString() + ".png"))
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                changeValues();
              },
              child: Image(
                  image:
                      AssetImage("images/dice" + rightNum.toString() + ".png")),
            ),
          )
        ],
      ),
    ));
  }
}
