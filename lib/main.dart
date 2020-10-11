import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/customButton.dart';
import 'package:gestrude_project/style/customStyle.dart';

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
          CustomButtonWidget(
              text: "button1", count: 0, style: CustomButtonStyle(mediaQuery: 0.50)),
          SizedBox(height: 5.0),
          CustomButtonWidget(
              text: "button2", count: 10, style: CustomButtonStyle(mediaQuery: 0.60)),
          SizedBox(height: 5.0),
          CustomButtonWidget(
              text: "button3", count: 100, style: CustomButtonStyle(mediaQuery: 0.70)),
        ],
      ),
    );
  }
}
