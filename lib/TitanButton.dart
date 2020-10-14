import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/TitanStyle.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:icon_shadow/icon_shadow.dart';

class TitanButton extends StatefulWidget {
  final Function() pressTap;
  final Function() pressTapDown;
  final Function() pressTapUp;
  final String headButton;
  final int count;
  final TitanButtonStyle style;
  final IconData icon;
  final double coefButton;
  final bool gradient;

  TitanButton({
    this.headButton,
    this.count,
    this.style,
    this.pressTap,
    this.pressTapDown,
    this.pressTapUp,
    this.icon,
    this.coefButton,
    this.gradient,
  });

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
  String headButton;

  double _heightButton;
  EdgeInsets _margin;
  EdgeInsets _padding;
  int counter = 0;
  int _quarterTurns;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FlutterShine(
        config: Config(shadowColor: widget.style.colors[4]),
        light:
            Light(intensity: widget.style.intensity, position: Point(_x, _y)),
        builder: (BuildContext context, ShineShadow shineShadow) {
          return AnimatedContainer(
            height: widget.style.heightUp +
                (widget.style.heightUp - widget.style.heightDown),
            duration: Duration(seconds: 1),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: pressTap,
              onTapDown: (value) => pressTapDown(),
              onTapUp: (value) => pressTapUp(),
              //Тень кнопки
              child: AnimatedContainer(
                duration: widget.style.duration[2],
                height: _heightButton,
                margin: _margin,
                padding: _padding,
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
                      borderRadius: widget.style.radiusBorder[2],
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RichText(
                                textAlign: TextAlign.center,
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
                                    widget.icon.runtimeType != Null
                                        ? WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: IconShadowWidget(
                                              Icon(
                                                widget.icon,
                                                color: widget.style.colors[14],
                                                size: 24.0,
                                              ),
                                              shadowColor:
                                                  widget.style.colors[15],
                                              showShadow:
                                                  widget.style.showShadow,
                                            ),
                                          )
                                        : WidgetSpan(child: SizedBox()),
                                    TextSpan(
                                      text: (widget.headButton != null
                                          ? " " +
                                              widget.headButton.toUpperCase() +
                                              " "
                                          : ""),
                                      /*text: " " +
                                          widget.headButton.toUpperCase() +
                                          " ",*/
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[



                              RotatedBox(
                                quarterTurns: _quarterTurns,child:
                                Container(
                                  padding: _click
                                                  ? widget.style.edgeInsets[6]
                                                  : widget.style.edgeInsets[7],
                                child: IconShadowWidget(
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: widget.style.colors[14],
                                                size: 28.0,
                                              ),
                                              shadowColor:
                                                  widget.style.colors[15],
                                              showShadow:
                                                  widget.style.showShadow,
                                            

                                ))),
















                              widget.count != null
                                  ? AnimatedOpacity(
                                      opacity: (widget.count != null
                                                  ? widget.count
                                                  : 0) >
                                              0
                                          ? 1.0
                                          : 0.0,
                                      duration: widget.style.duration[4],
                                        child: Container(
                                          margin: _click
                                              ? widget.style.edgeInsets[4]
                                              : widget.style.edgeInsets[5],
                                          padding: (widget.count != null
                                                      ? widget.count
                                                      : 0) >=
                                                  10
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
                                              stops:
                                                  widget.style.stopGradient[1],
                                            ),
                                            borderRadius:
                                                widget.style.radiusBorder[3],
                                            border: Border.all(
                                              color: widget.style.colors[13],
                                              width:
                                                  widget.style.borderWidthCount,
                                            ),
                                          ),
                                          child: Text(
                                            widget.count.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              height:
                                                  widget.style.heightCounter,
                                              color: widget.style.colors[5],
                                              fontFamily:
                                                  widget.style.fontFamily,
                                              fontSize: widget.style.fontSize14,
                                              fontWeight:
                                                  widget.style.fontWeight400,
                                              fontStyle:
                                                  widget.style.fontStyleNormal,
                                              shadows: shineShadow?.shadows,
                                            ),
                                          ),
                                        ),
                                      
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        //Счетчик
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void pressTapUp() {
    if (widget.pressTapUp != null) {
      widget.pressTapUp();
    }
    setState(() {
      _click = false;
      begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
      stops = widget.style.stopGradient[0];

      colors = widget.gradient == true
          ? widget.style.gradientButton[2]
          : widget.style.gradientButton[0];
      _heightButton = widget.style.heightUp;
      _margin = widget.style.edgeInsets[1];
      _padding = widget.style.edgeInsets[3];
    });
  }

  void pressTapDown() {
    if (widget.pressTapDown != null) {
      widget.pressTapDown();
    }
    setState(() {
      _click = true;
      begin = Alignment.bottomCenter;
      end = Alignment.topCenter;
      colors = widget.gradient == true
          ? widget.style.gradientButton[3]
          : widget.style.gradientButton[1];
      stops = widget.style.stopGradient[0];
      _heightButton = widget.style.heightUp;
      _margin = widget.style.edgeInsets[0];
      _padding = widget.style.edgeInsets[2];
    });
  }

  void pressTap() {
    if (widget.pressTap != null) {
      widget.pressTap();
      if (counter == 0) {
        _click = false;
        print(_click);
        //pressTapDown();
        begin = Alignment.bottomCenter;
        end = Alignment.topCenter;
        colors = widget.gradient == true
            ? widget.style.gradientButton[3]
            : widget.style.gradientButton[1];
        stops = widget.style.stopGradient[0];
        _heightButton = widget.style.heightUp;
        _margin = widget.style.edgeInsets[0];
        _padding = widget.style.edgeInsets[2];
_quarterTurns = 2;
        counter += 1;
      } else {
        _click = true;
        print(_click);
        //pressTapDown();
        begin = Alignment.topCenter;
        end = Alignment.bottomCenter;
        stops = widget.style.stopGradient[0];

        colors = widget.gradient == true
            ? widget.style.gradientButton[2]
            : widget.style.gradientButton[0];
        _heightButton = widget.style.heightUp;
        _margin = widget.style.edgeInsets[1];
        _padding = widget.style.edgeInsets[3];
_quarterTurns = 0;
        counter -= 1;
      }
    }
  }

  void initState() {
    super.initState();
    _click = false;
    _x = widget.style.x;
    _y = widget.style.y;
    begin = Alignment.topCenter;
    end = Alignment.bottomCenter;
    stops = widget.style.stopGradient[0];
    colors = widget.gradient == true
        ? widget.style.gradientButton[2]
        : widget.style.gradientButton[0];
    _heightButton = widget.style.heightUp;
    _margin = widget.style.edgeInsets[1];
    _padding = widget.style.edgeInsets[3];
    _quarterTurns = 0;
  }
}
