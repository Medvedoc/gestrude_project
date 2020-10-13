import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/TitanButton.dart';
import 'package:gestrude_project/TitanStyle.dart';

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
        body: MenuList(),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 5.0),
          TitanButton(
              headButton: "button1", count: 0, style: TitanButtonStyle(icons: Icons.camera_alt_outlined)),
          SizedBox(height: 5.0),
          TitanButton(
              headButton: "button2", count: 10, style: TitanButtonStyle()),
          SizedBox(height: 5.0),
          TitanButton(
              headButton: "button3", count: 100, style: TitanButtonStyle()),
        ],
      ),
    );
  }
}