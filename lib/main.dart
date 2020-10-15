import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/TitanButton.dart';
import 'package:gestrude_project/TitanDropbox.dart';
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
        body: ListView(
          children: <Widget>[
            SizedBox(height: 30.0),
            TitanButtonWidget(),
            SizedBox(height: 30.0),
            TitanDropboxWidget(),
            Text('sdfsdfdsfg'),
          ],
        ),
      ),
    );
  }
}

class TitanButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titanButtonStandart = TitanButtonStyle();
    titanButtonStandart.colors[14] = Colors.black;
    titanButtonStandart.colors[15] = Colors.black;
    titanButtonStandart.textShadowx = 0;
    titanButtonStandart.textShadowy = 0;
    titanButtonStandart.intensity = 0;
    titanButtonStandart.showShadow = false;

    var titanButtonStandart2 = TitanButtonStyle();
    //titanButtonStandart2.colors[14] = Colors.black;
    titanButtonStandart2.colors[14] = Colors.black.withOpacity(0.5);
    titanButtonStandart2.colors[15] = Colors.black;
    titanButtonStandart2.textShadowx = -12;
    titanButtonStandart2.textShadowy = -12;
    titanButtonStandart2.intensity = 3;
    titanButtonStandart2.showShadow = true;

    //print(MediaQuery.of(context).size.width);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          TitanButton(
              //icon: Icons.camera_alt_outlined,
              icon: Icons.ac_unit,
              headButton: "Titan 01",
              style: TitanButtonStyle()),
          SizedBox(height: 5.0),
          TitanButton(
              icon: Icons.camera_alt_outlined,
              count: 100,
              style: TitanButtonStyle()),
          SizedBox(height: 5.0),
          TitanButton(
              headButton: "Titan 02", count: 10, style: titanButtonStandart2),
          SizedBox(height: 5.0),
          TitanButton(
              gradient: true,
              headButton: "Titan 03",
              style: TitanButtonStyle()),
          SizedBox(height: 5.0),
          TitanButton(
              icon: Icons.image_outlined,
              headButton: "Titan 04",
              count: 100,
              style: titanButtonStandart),
          SizedBox(height: 5.0),
          Container(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TitanButton(
                      icon: Icons.camera_alt_outlined,
                      headButton: "фото",
                      style: TitanButtonStyle()),
                ),
                Expanded(
                  flex: 1,
                  child: TitanButton(
                      icon: Icons.image_outlined,
                      headButton: "галерея",
                      style: TitanButtonStyle()),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TitanButton(
                      icon: Icons.camera_alt_outlined,
                      headButton: "фото",
                      style: titanButtonStandart),
                ),
                Expanded(
                  flex: 1,
                  child: TitanButton(
                      icon: Icons.image_outlined,
                      headButton: "галерея",
                      count: 10,
                      style: titanButtonStandart),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitanDropboxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitanDropbox(
            headDropbox: 'Dropbox',
            style: TitanButtonStyle(),
            listparams: [
              TitanButton(
                  headButton: "button1", count: 0, style: TitanButtonStyle()),
              TitanButton(
                  headButton: "button2", count: 0, style: TitanButtonStyle()),
              TitanButton(
                  headButton: "button1", count: 0, style: TitanButtonStyle()),
              TitanButton(
                  headButton: "button2", count: 0, style: TitanButtonStyle()),
              TitanButton(
                  headButton: "button1", count: 0, style: TitanButtonStyle()),
              TitanButton(
                  headButton: "button2", count: 0, style: TitanButtonStyle()),
              TitanButton(
                  headButton: "button1", count: 0, style: TitanButtonStyle()),
              TitanButton(
                  headButton: "button2", count: 0, style: TitanButtonStyle()),
            ]),
      ],
    );
  }
}
