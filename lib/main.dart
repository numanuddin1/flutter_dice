// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Dice',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int leftDiceNumber = 1;
  int righDiceNumber = 1;
  int totalNumber = 0;
  String result = '';

  void changeDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      righDiceNumber = Random().nextInt(6) + 1;
      totalNumber = leftDiceNumber + righDiceNumber;
      if (totalNumber == 12) {
        result = 'Great!!';
      } else if (totalNumber == 2) {
        result = 'Bad Luck';
      } else {
        result = 'Good';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child:
                          Image.asset('assets/images/dice$leftDiceNumber.png')),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset('assets/images/dice$righDiceNumber.png'),
                ))
              ],
            ),
            Icon(totalNumber == 12 ? Icons.tag_faces : null),
            Text('Total number: $totalNumber'),
            SizedBox(
              height: 20,
            ),
            Text(
              result,
              style: TextStyle(
                  fontSize: 18,
                  color: result == 'Great!!'
                      ? Colors.green
                      : result == 'Bad Luck'
                          ? Colors.red
                          : Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () => changeDice(),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Roll Dice'),
                ))
          ],
        ),
      ),
    );
  }
}
