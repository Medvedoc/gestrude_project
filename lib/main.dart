import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:gestrude_project/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
  var list = [
    Color.fromRGBO(253, 228, 0, 1),
    Color.fromRGBO(254, 229, 0, 1),
    Color.fromRGBO(237, 213, 5, 1),
    Color.fromRGBO(237, 212, 3, 1)
  ];
  var stop = [0.0, 0.5, 0.5, 1.0];

  Animation<Color> animation;
  AnimationController controller;
  bool _lights = false;
  int _counter = 0;
  double x;
  double y;

  @override
  Widget build(BuildContext context) {
    final intoContainer = BoxDecoration(
      gradient: LinearGradient(
        begin: top,
        end: bottom,
        colors: list,
        tileMode: TileMode.clamp,
        stops: stop,
      ),
      border: Border.all(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Button'),
        ),
        body: GestureDetector(
          child: Center(
            child: FlutterShine(
              config: Config(shadowColor: Color.fromRGBO(118, 106, 2, 0.2)),
              light: Light(intensity: 2, position: Point(x, y)),
              builder: (BuildContext context, ShineShadow shineShadow) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: GestureDetector(
                      onTap: pressTap,
                      onTapDown: (value) => pressTapDown(),
                      onTapUp: (value) => pressTapUp(),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: _lights ? 44.0 : 52.0,
                        margin: _lights
                            ? StyleApp.edgeInsets[0]
                            : StyleApp.edgeInsets[1],
                        padding: _lights
                            ? StyleApp.edgeInsets[2]
                            : StyleApp.edgeInsets[3],
                        decoration: StyleApp.shadowContainer,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: StyleApp.borderContainer,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            height: 46.0,
                            margin: EdgeInsets.all(4.0),
                            decoration: intoContainer,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "ДОГОВОРЫ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1.20,
                                      color: Colors.white,
                                      fontFamily: 'Robots',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: _lights ? 2.6 : 3.0,
                                      shadows: shineShadow?.shadows,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                                AnimatedOpacity(
                                  opacity: _counter > 0 ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 300),
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: _lights
                                              ? StyleApp.edgeInsets[4]
                                              : StyleApp.edgeInsets[5],
                                      padding: _counter >= 10
                                          ? (_lights
                                              ? StyleApp.edgeInsets[6]
                                              : StyleApp.edgeInsets[7])
                                          : (_lights
                                              ? StyleApp.edgeInsets[8]
                                              : StyleApp.edgeInsets[9]),
                                      decoration: StyleApp.counterBoxDecoration,
                                      child: Text(
                                        '$_counter',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 0.95,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Robots',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          shadows: shineShadow?.shadows,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void pressTapUp() {
    setState(() {
      _lights = false;
      top = FractionalOffset.topCenter;
      bottom = FractionalOffset.bottomCenter;
      list = [
        Color.fromRGBO(253, 228, 0, 1),
        Color.fromRGBO(254, 229, 0, 1),
        Color.fromRGBO(237, 213, 5, 1),
        Color.fromRGBO(237, 212, 3, 1)
      ];
      stop = [0.0, 0.5, 0.5, 1.0];
    });
  }

  void pressTapDown() {
    setState(() {
      _lights = true;
      top = FractionalOffset.topCenter;
      bottom = FractionalOffset.bottomCenter;
      list = [Color.fromRGBO(237, 213, 5, 1), Color.fromRGBO(237, 212, 3, 1)];
      stop = [0.0, 1.0];
    });
  }

  void pressTap() {
    setState(() {
      _counter++;
    });
  }

  void initState() {
    super.initState();
    x = -12;
    y = -12;
  }
}
