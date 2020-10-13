import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/TitanStyle.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:icon_shadow/icon_shadow.dart';

class TitanButton extends StatefulWidget {
  final String headButton;
  final int count;
  final TitanButtonStyle style;
  TitanButton({this.headButton, this.count, this.style});

  @override
  _TitanButtonState createState() => _TitanButtonState();
}

class _TitanButtonState extends State<TitanButton> {
  bool _click = false; //Событие на клик по кнопке
  double _x; //Смещение тени надписи кнопки по оси Х
  double _y; //Смещение тени надписи кнопки по оси Y
  Color color;
  List<Color> colors;
  List<double> stops;
  Alignment begin;
  Alignment end;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: FlutterShine(
          config: Config(shadowColor: widget.style.colors[4]),
          light:
              Light(intensity: widget.style.intensity, position: Point(_x, _y)),
          builder: (BuildContext context, ShineShadow shineShadow) {
            return Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: MediaQuery.of(context).size.width *
                    widget.style.coefficientButton,
                child: GestureDetector(
                  onTap: pressTap,
                  onTapDown: (value) => pressTapDown(),
                  onTapUp: (value) => pressTapUp(),
                  //Тень кнопки
                  child: AnimatedContainer(
                    duration: widget.style.duration[2],
                    height: _click
                        ? widget.style.heightDown
                        : widget.style.heightUp,
                    margin: _click
                        ? widget.style.edgeInsets[0]
                        : widget.style.edgeInsets[1],
                    padding: _click
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
                        duration: widget.style.duration[3],
                        height: widget.style.heightDown,
                        margin: widget.style.edgeInsets[10],
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: begin,
                            end: end,
                            colors: colors,
                            tileMode: TileMode.clamp,
                            stops: stops,
                          ),
                          //border: Border.all(color: Colors.transparent),
                          borderRadius: widget.style.radiusBorder[2],
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            //Надпись кнопки
                            Container(
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        height: widget.style.heightText,
                                        color: widget.style.colors[14],
                                        fontFamily: widget.style.fontFamily,
                                        fontSize: widget.style.fontSize18,
                                        fontWeight: widget.style.fontWeight400,
                                        fontStyle: widget.style.fontStyleNormal,
                                        letterSpacing: _click
                                            ? widget.style.letterSpacingDown
                                            : widget.style.letterSpacingUp,
                                        shadows: shineShadow?.shadows,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: IconShadowWidget(
                                            Icon(
                                              widget.style.icons,
                                              //Icons.camera_alt_outlined,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            shadowColor:
                                                widget.style.colors[15],
                                          ),
                                        ),
                                        TextSpan(
                                          text: " " +
                                              widget.headButton.toUpperCase() +
                                              " ",
                                          style: TextStyle(
                                            height: widget.style.heightText,
                                            color: widget.style.colors[14],
                                            fontFamily: widget.style.fontFamily,
                                            fontSize: widget.style.fontSize18,
                                            fontWeight:
                                                widget.style.fontWeight400,
                                            fontStyle:
                                                widget.style.fontStyleNormal,
                                            letterSpacing: _click
                                                ? widget.style.letterSpacingDown
                                                : widget.style.letterSpacingUp,
                                            shadows: shineShadow?.shadows,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Счетчик
                            AnimatedOpacity(
                              opacity: widget.count > 0 ? 1.0 : 0.0,
                              duration: widget.style.duration[4],
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  margin: _click
                                      ? widget.style.edgeInsets[4]
                                      : widget.style.edgeInsets[5],
                                  padding: widget.count >= 10
                                      ? (_click
                                          ? widget.style.edgeInsets[6]
                                          : widget.style.edgeInsets[7])
                                      : (_click
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
      _click = false;
      begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
      stops = widget.style.stopGradient[0];
      colors = [
        widget.style.colors[0],
        widget.style.colors[1],
        widget.style.colors[2],
        widget.style.colors[3]
      ];
    });
  }

  void pressTapDown() {
    setState(() {
      _click = true;
      begin = Alignment.bottomCenter;
      end = Alignment.topCenter;
      colors = [
        widget.style.colors[3],
        widget.style.colors[2],
        widget.style.colors[1],
        widget.style.colors[0]
      ];
      stops = widget.style.stopGradient[0];
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
    _x = widget.style.x;
    _y = widget.style.y;
    begin = Alignment.topCenter;
    end = Alignment.bottomCenter;
    stops = widget.style.stopGradient[0];
    colors = [
      widget.style.colors[0],
      widget.style.colors[1],
      widget.style.colors[2],
      widget.style.colors[3]
    ];
  }
}
