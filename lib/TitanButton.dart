import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/TitanStyle.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:icon_shadow/icon_shadow.dart';

class TitanButton extends StatefulWidget {
  final bool arrowDropbox;
  final bool gradient;
  final Function() pressTap;
  final Function() pressTapDown;
  final Function() pressTapUp;
  final int count;
  final IconData icon;
  final List<TitanButton> listparams;
  final String headButton;
  final bool variable;
  final TitanButtonStyle style;

  TitanButton({
    this.arrowDropbox,
    this.gradient,
    this.pressTap,
    this.pressTapDown,
    this.pressTapUp,
    this.count,
    this.icon,
    this.headButton,
    this.style,
    this.listparams,
    this.variable,
  });

  @override
  _TitanButtonState createState() => _TitanButtonState();
}

class _TitanButtonState extends State<TitanButton> {
  final GlobalKey _cardKey = GlobalKey();
  double cardSizewidth;
  Alignment _begin; //Начало градиенто
  Alignment _end; //Окончание градиента
  bool _click; //Событие на клик по кнопке
  double _heightButton; //Высота контейнера кнопки
  double _textshadowx; //Смещение тени надписи кнопки по оси Х
  double _textshadowy; //Смещение тени надписи кнопки по оси Y
  Color _shadow; //Тень кнопки
  EdgeInsets _margin; //Наружные отступы анимации кнопки
  EdgeInsets _padding; //Внутренние отступы анимации кнопки
  IconData _arrow; //Иконка выбранного режима Dropbox
  int _counter; //Переключатель срабатывания Dropbox
  List<Color> _colors; //Цвета градиента
  List<double> _stops; //Точки расположения градиента

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FlutterShine(
        //Задаем тень и обводку тексту названия кнопки
        config: Config(shadowColor: widget.style.colors[4]),
        light: Light(
            intensity: widget.style.intensity,
            position: Point(_textshadowx, _textshadowy)),
        builder: (BuildContext context, ShineShadow shineShadow) {
          return Container(
            alignment: Alignment.center,
            key: _cardKey,
            width: cardSizewidth,
            padding: widget.style.edgeInsets[14],
            child: AnimatedContainer(
              height: widget.style.heightUp +
                  (widget.style.heightUp - widget.style.heightDown),
              duration: Duration(milliseconds: 100),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: pressTap,
                onTapDown: (value) => pressTapDown(),
                onTapUp: (value) => pressTapUp(),
                //Задаем эффект тени контейнеру кнопки
                child: AnimatedContainer(
                  duration: widget.style.duration[2],
                  height: _heightButton,
                  margin: _margin,
                  padding: _padding,
                  decoration: BoxDecoration(
                    color: _shadow,
                    borderRadius: widget.style.radiusBorder[0],
                  ),
                  //Задаем градиент рамки кнопки
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: widget.style.colors[14],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.clamp,
                        colors: widget.style.gradientButton[4],
                        stops: widget.style.stopGradient[0],
                      ),
                      borderRadius: widget.style.radiusBorder[1],
                    ),
                    //Задаем градиент подложки надписи текста кнопки
                    child: AnimatedContainer(
                      duration: widget.style.duration[3],
                      height: widget.style.heightDown,
                      margin: widget.style.edgeInsets[10],
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: _begin,
                          end: _end,
                          colors: _colors,
                          tileMode: TileMode.clamp,
                          stops: _stops,
                        ),
                        borderRadius: widget.style.radiusBorder[2],
                      ),
                      //Добавляем содержимое кнопки
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //Добавляем иконку и надпись текста кнопки
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
                                                  color:
                                                      widget.style.colors[14],
                                                  size: widget.style.sizeIcon,
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
                                                widget.headButton
                                                    .toUpperCase() +
                                                " "
                                            : ""),
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
                          Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                //Добавляем стрелку для Dropbox
                                widget.arrowDropbox == true
                                    ? Container(
                                        padding: _click
                                            ? widget.style.edgeInsets[6]
                                            : widget.style.edgeInsets[7],
                                        child: IconShadowWidget(
                                          Icon(
                                            _arrow,
                                            color: widget.style.colors[14],
                                            size: widget.style.sizeArrow,
                                          ),
                                          shadowColor: widget.style.colors[16],
                                          showShadow: widget.style.showShadow,
                                        ))
                                    : SizedBox(),
                                //Добавляем счетчик
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
    );
  }

  void pressTapUp() {
    if (widget.pressTapUp != null) {
      widget.pressTapUp();
    }

    if (widget.variable == true) {
      print('yes');
      setState(() {
        _click = false;
        _begin = Alignment.topCenter;
        _end = Alignment.bottomCenter;
        _stops = widget.style.stopGradient[0];
        _colors = widget.gradient == true
            ? widget.style.gradientButton[2]
            : widget.style.gradientButton[0];
        _heightButton = widget.style.heightUp;
        _margin = widget.style.edgeInsets[1];
        _padding = widget.style.edgeInsets[3];
      });
    } else {
      print('no');
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _click = false;
          _begin = Alignment.topCenter;
          _end = Alignment.bottomCenter;
          _stops = widget.style.stopGradient[0];
          _colors = widget.gradient == true
              ? widget.style.gradientButton[2]
              : widget.style.gradientButton[0];
          _heightButton = widget.style.heightUp;
          _margin = widget.style.edgeInsets[1];
          _padding = widget.style.edgeInsets[3];
          //_counter -= 1;
          //print(_counter);
        });
      });
    }
  }

  void pressTapDown() {
    if (widget.pressTapDown != null) {
      widget.pressTapDown();
    }
    setState(() {
      _click = true;
      _begin = Alignment.bottomCenter;
      _end = Alignment.topCenter;
      _colors = widget.gradient == true
          ? widget.style.gradientButton[3]
          : widget.style.gradientButton[1];
      _stops = widget.style.stopGradient[0];
      _heightButton = widget.style.heightUp;
      _margin = widget.style.edgeInsets[0];
      _padding = widget.style.edgeInsets[2];
      // _counter += 1;
      //  print(_counter);
    });
  }

  void pressTap() {
    if (widget.pressTap != null) {
      widget.pressTap();
      if (_counter == 0) {
        _click = false;
        _begin = Alignment.bottomCenter;
        _end = Alignment.topCenter;
        _colors = widget.gradient == true
            ? widget.style.gradientButton[3]
            : widget.style.gradientButton[1];
        _stops = widget.style.stopGradient[0];
        _heightButton = widget.style.heightUp;
        _margin = widget.style.edgeInsets[0];
        _padding = widget.style.edgeInsets[2];
        _arrow = Icons.arrow_drop_up;
        _counter += 1;
        print(_counter);
      } else {
        _click = !_click;
        _begin = Alignment.topCenter;
        _end = Alignment.bottomCenter;
        _stops = widget.style.stopGradient[0];
        _colors = widget.gradient == true
            ? widget.style.gradientButton[2]
            : widget.style.gradientButton[0];
        _heightButton = widget.style.heightUp;
        _margin = widget.style.edgeInsets[1];
        _padding = widget.style.edgeInsets[3];
        _arrow = Icons.arrow_drop_down;
        _counter -= 1;
        print(_counter);
      }
    }
  }

  void initState() {
    super.initState();
    _click = false;
    _counter = 0;
    _textshadowx = widget.style.textShadowx;
    _textshadowy = widget.style.textShadowy;
    _begin = Alignment.topCenter;
    _end = Alignment.bottomCenter;
    _stops = widget.style.stopGradient[0];
    _shadow = widget.gradient == true
        ? widget.style.colors[17]
        : widget.style.colors[6];
    _colors = widget.gradient == true
        ? widget.style.gradientButton[2]
        : widget.style.gradientButton[0];
    _heightButton = widget.style.heightUp;
    _margin = widget.style.edgeInsets[1];
    _padding = widget.style.edgeInsets[3];
    _arrow = Icons.arrow_drop_down;

    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    RenderBox _cardBox = _cardKey.currentContext.findRenderObject();
    cardSizewidth = _cardBox.size.width;
  }
}
