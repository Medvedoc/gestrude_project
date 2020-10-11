import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:gestrude_project/style/customStyle.dart';

class CustomButtonWidget extends StatefulWidget {
  final String text;
  final int count;
  final CustomButtonStyle style;
  CustomButtonWidget({this.text, this.count, this.style});

  @override
  _CustomButtonWidgetState createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  Animation<Color> animation;
  AnimationController controller;
  bool _lights = false;
  double x;
  double y;
  double borderWidthCount;
  FractionalOffset top;
  FractionalOffset bottom;
  List<Color> list;
  List<double> stop;

  @override
  Widget build(BuildContext context) {
    top = FractionalOffset.topCenter;
    bottom = FractionalOffset.bottomCenter;
    list = [
      widget.style.colors[0],
      widget.style.colors[1],
      widget.style.colors[2],
      widget.style.colors[3],
    ];
    stop = widget.style.stopGradient[0];

    return GestureDetector(
      child: Center(
        child: FlutterShine(
          config: Config(shadowColor: widget.style.colors[4]),
          light:
              Light(intensity: widget.style.intensity, position: Point(x, y)),
          builder: (BuildContext context, ShineShadow shineShadow) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width *
                    widget.style.mediaQuery,
                child: GestureDetector(
                  onTap: pressTap,
                  onTapDown: (value) => pressTapDown(),
                  onTapUp: (value) => pressTapUp(),
                  //Тень кнопки
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    height: _lights
                        ? widget.style.heightDown
                        : widget.style.heightUp,
                    margin: _lights
                        ? widget.style.edgeInsets[0]
                        : widget.style.edgeInsets[1],
                    padding: _lights
                        ? widget.style.edgeInsets[2]
                        : widget.style.edgeInsets[3],
                    decoration: BoxDecoration(
                      color: widget.style.colors[6],
                      borderRadius: widget.style.radiusBorder[0],
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: widget.style.colors[14],
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.clamp,
                          colors: [
                            widget.style.colors[7],
                            widget.style.colors[8],
                            widget.style.colors[9],
                            widget.style.colors[10]
                          ],
                          stops: widget.style.stopGradient[0],
                        ),
                        borderRadius: widget.style.radiusBorder[1],
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        height: widget.style.heightDown,
                        margin: widget.style.edgeInsets[10],
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: top,
                            end: bottom,
                            colors: list,
                            tileMode: TileMode.clamp,
                            stops: stop,
                          ),
                          //border: Border.all(color: Colors.transparent),
                          borderRadius: widget.style.radiusBorder[2],
                        ),
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
                                  padding: widget.count >= 10
                                      ? (_lights
                                          ? widget.style.edgeInsets[6]
                                          : widget.style.edgeInsets[7])
                                      : (_lights
                                          ? widget.style.edgeInsets[8]
                                          : widget.style.edgeInsets[9]),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      tileMode: TileMode.clamp,
                                      colors: [
                                        widget.style.colors[11],
                                        widget.style.colors[12],
                                      ],
                                      stops: widget.style.stopGradient[1],
                                    ),
                                    borderRadius: widget.style.radiusBorder[3],
                                    border: Border.all(
                                      color: widget.style.colors[13],
                                      width: widget.style.borderWidthCount,
                                    ),
                                  ),
                                  child: Text(
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
        widget.style.colors[3],
      ];
      stop = widget.style.stopGradient[0];
    });
  }

  void pressTapDown() {
    setState(() {
      _lights = true;
      top = FractionalOffset.topCenter;
      bottom = FractionalOffset.bottomCenter;
      stop = widget.style.stopGradient[2];
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
    x = widget.style.x;
    y = widget.style.y;
  }
}
