import 'package:flutter/material.dart';
import 'dart:math';

//Main method executed to run the app
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          //Standard Appbar
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: DicePage(), //Create a stateFUL widget for the main page
      ),
    ),
  );
}

//Declare anything that could change as a stateful widget
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

//Updates the Widget's state
class _DicePageState extends State<DicePage> {
  int leftNum = 6;
  int rightNum = 5;
  var randomGenerator = Random();

  //Void function to change the values of the numbers
  void changeValues() {
    setState(() {
      leftNum = randomGenerator.nextInt(6) + 1;
      rightNum = randomGenerator.nextInt(6) + 1;
    });
  }

  //This is the bit that builds the visible elements
  @override
  Widget build(BuildContext context) {
    return Center( //Centre on page
      child: Row( //Row for two dice
        children: <Widget>[//Create two buttons that cover half the screen each
          Expanded(//Expand so the buttons cover the screen
            child: FlatButton(
                onPressed: () {
                  changeValues();//Refers to earlier defined function
                },
                child: Image(//Cover invisible button with dice image
                    image: AssetImage(//Variable/string concatenation could be better
                        "images/dice" + leftNum.toString() + ".png"))),
          ),
          Expanded(  //Same again here
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
    );
  }
}
