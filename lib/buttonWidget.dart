import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:gestrude_project/style.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final int count;
  final style;
  ButtonWidget({this.text, this.count, this.style});

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
  //int _counter = Library.counterWidget;
  double x;
  double y;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: FlutterShine(
          config: Config(shadowColor: widget.style..colors[4]),
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
                    height: _lights ? widget.style.heightDown : widget.style.heightUp,
                    margin: _lights
                        ? widget.style.edgeInsets[0]
                        : widget.style.edgeInsets[1],
                    padding: _lights
                        ? widget.style.edgeInsets[2]
                        : widget.style.edgeInsets[3],
                    decoration: widget.style.shadowContainer,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: widget.style.borderContainer,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: widget.style.heightDown,
                        margin: widget.style.edgeInsets[10],
                        decoration: widget.style.intoContainer,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Container(
                              child: Text(
                                widget.text.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: widget.style.heightText,
                                  color: widget.style.colors[14],
                                  fontFamily: widget.style.fontFamily,
                                  fontSize: widget.style.fontSize18,
                                  fontWeight: widget.style.fontWeight400,
                                  fontStyle: widget.style.fontStyleNormal,
                                  letterSpacing: _lights
                                      ? widget.style.letterSpacingDown
                                      : widget.style.letterSpacingUp,
                                  shadows: shineShadow?.shadows,
                                ),
                              ),
                              alignment: Alignment.center,
                            ),
                            AnimatedOpacity(
                              opacity: widget.count > 0 ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 300),
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: _lights
                                      ? widget.style.edgeInsets[4]
                                      : widget.style.edgeInsets[5],
                                  //padding: _counter >= 10
                                  padding: widget.count >= 10
                                      ? (_lights
                                          ? widget.style.edgeInsets[6]
                                          : widget.style.edgeInsets[7])
                                      : (_lights
                                          ? widget.style.edgeInsets[8]
                                          : widget.style.edgeInsets[9]),
                                  decoration: widget.style.counterBoxDecoration,
                                  child: Text(
                                    //'$_counter',
                                    widget.count.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: widget.style.heightCounter,
                                      color: widget.style.colors[5],
                                      fontFamily: widget.style.fontFamily,
                                      fontSize: widget.style.fontSize14,
                                      fontWeight: widget.style.fontWeight400,
                                      fontStyle: widget.style.fontStyleNormal,
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
        widget.style.colors[0],
        widget.style.colors[1],
        widget.style.colors[2],
        widget.style.colors[3]
      ];
      stop = [0.0, 0.5, 0.5, 1.0];
    });
  }

  void pressTapDown() {
    setState(() {
      _lights = true;
      top = FractionalOffset.topCenter;
      bottom = FractionalOffset.bottomCenter;
      list = [widget.style.colors[2], widget.style.colors[3]];
      stop = [0.0, 1.0];
    });
  }

  void pressTap() {
    setState(() {
      //_counter++;
      //widget.count ++;
    });
  }

  void initState() {
    super.initState();
    x = -12;
    y = -12;
  }
}