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
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                TitanButtonWidget(),
                //TitanDropboxWidget(),
                SizedBox(height: 30.0),
                TitanDropboxWidgetWork(),
                SizedBox(height: 30.0),
                Text('fkfdgfhgfghgfhghg')
              ],
            ),
          ),
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
    titanButtonStandart.x = 0;
    titanButtonStandart.y = 0;
    titanButtonStandart.intensity = 0;
    titanButtonStandart.showShadow = false;

    return Container(
      width: 380.0,
      child: Column(
        children: <Widget>[
          SizedBox(height: 5.0),
          TitanButton(
              icon: Icons.camera_alt_outlined,
              headButton: "Titan 01",
              count: 0,
              style: TitanButtonStyle()),
          SizedBox(height: 5.0),
          TitanButton(
              headButton: "Titan 02",
              count: 10,
              style: TitanButtonStyle()),
          SizedBox(height: 5.0),
          TitanButton(
              headButton: "Titan 03", count: 0, style: TitanButtonStyle()),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TitanButton(
                      icon: Icons.camera_alt_outlined,
                      headButton: "фото",
                      count: 0,
                      style: TitanButtonStyle()),
                ),
                Expanded(
                  flex: 1,
                  child: TitanButton(
                      icon: Icons.image_outlined,
                      headButton: "галерея",
                      count: 0,
                      style: TitanButtonStyle()),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TitanButton(
                      icon: Icons.camera_alt_outlined,
                      headButton: "фото",
                      count: 0,
                      style: titanButtonStandart),
                ),
                Expanded(
                  flex: 1,
                  child: TitanButton(
                      icon: Icons.image_outlined,
                      headButton: "галерея",
                      count: 0,
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
        CustomDropboxWidget(style: TitanButtonStyle(), listparams: [
          TitanButton(
              headButton: "button1", count: 0, style: TitanButtonStyle()),
          TitanButton(
              headButton: "button2", count: 0, style: TitanButtonStyle()),
        ]),
      ],
    );
  }
}

class TitanDropboxWidgetWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomDropboxWidget(
            headDropbox: 'Dropbox',
            style: TitanButtonStyle(),
            countDropbox: 300,
            listparams: [
              TitanButton(
                  headButton: "button1", count: 0, style: TitanButtonStyle()),
              TitanButton(
                  headButton: "button2", count: 0, style: TitanButtonStyle()),
            ]),
      ],
    );
  }
}
