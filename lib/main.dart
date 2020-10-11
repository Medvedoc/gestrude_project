import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/buttonWidget.dart';
import 'package:gestrude_project/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyWork"),
        ),
        body: ExtendedMenuWidget(),
        //ButtonWidget(),
      ),
    );
  }
}

class ExtendedMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 5.0),
          ButtonWidget(text: "button1", count: 113, style: StyleApp),
          SizedBox(height: 5.0),
          ButtonWidget(text: "button2", count: 213),
          SizedBox(height: 5.0),
          ButtonWidget(text: "button3", count: 313),
        ],
      ),
    );
  }
}
