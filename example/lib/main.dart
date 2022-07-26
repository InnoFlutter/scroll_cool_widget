import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scroll_cool_widget/button_position.dart';
import 'package:scroll_cool_widget/scroll_cool_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: ScrollCoolWidget(
        countOfCache: 1,
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        scrollDirection: Axis.vertical,
        buttonPosition: ButtonPosition.topLeft,
        buttonColor: Colors.blueAccent,
        buttonIconColor: Colors.white,
        createWidget: (index, width, height) {
          return Container(
            width: width,
            height: height,
            color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
            child: Center(
              child: Text('${index + 1}',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

