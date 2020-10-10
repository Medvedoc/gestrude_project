import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:gestrude_project/style.dart';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  var top;
  var bottom;
  var list;
  var stop;

  Animation<Color> animation;
  AnimationController controller;
  bool _lights = false;
  int _counter = 0;
  double x;
  double y;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: FlutterShine(
          config: Config(shadowColor: StyleApp.colors[4]),
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
                    height: _lights ? StyleApp.heightDown : StyleApp.heightUp,
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
                        height: StyleApp.heightDown,
                        margin: StyleApp.edgeInsets[10],
                        decoration: StyleApp.intoContainer,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "ДОГОВОРЫ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: StyleApp.heightText,
                                  color: StyleApp.colors[14],
                                  fontFamily: StyleApp.fontFamily,
                                  fontSize: StyleApp.fontSize18,
                                  fontWeight: StyleApp.fontWeight400,
                                  fontStyle: StyleApp.fontStyleNormal,
                                  letterSpacing: _lights
                                      ? StyleApp.letterSpacingDown
                                      : StyleApp.letterSpacingUp,
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
                                      height: StyleApp.heightCounter,
                                      color: StyleApp.colors[5],
                                      fontFamily: StyleApp.fontFamily,
                                      fontSize: StyleApp.fontSize14,
                                      fontWeight: StyleApp.fontWeight400,
                                      fontStyle: StyleApp.fontStyleNormal,
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
    );
  }

  void pressTapUp() {
    setState(() {
      _lights = false;
      top = FractionalOffset.topCenter;
      bottom = FractionalOffset.bottomCenter;
      list = [
        StyleApp.colors[0],
        StyleApp.colors[1],
        StyleApp.colors[2],
        StyleApp.colors[3]
      ];
      stop = [0.0, 0.5, 0.5, 1.0];
    });
  }

  void pressTapDown() {
    setState(() {
      _lights = true;
      top = FractionalOffset.topCenter;
      bottom = FractionalOffset.bottomCenter;
      list = [StyleApp.colors[2], StyleApp.colors[3]];
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
