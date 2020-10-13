/*import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:gestrude_project/style/customStyle.dart';
import 'package:icon_shadow/icon_shadow.dart';

class CustomDropboxWidget extends StatefulWidget {
  final CustomStyle style;
  final String headDropbox;
  final int countDropbox;

  CustomDropboxWidget({this.headDropbox, this.style, this.countDropbox});

  @override
  _CustomDropboxWidgetState createState() => _CustomDropboxWidgetState();
}

class _CustomDropboxWidgetState extends State<CustomDropboxWidget> {
  bool _click = false; //Событие на клик по кнопке
  double _x; //Смещение тени надписи кнопки по оси Х
  double _y; //Смещение тени надписи кнопки по оси Y
  Color color;
  List<Color> colors;
  List<double> stops;
  Alignment begin;
  Alignment end;
  int counter = 0;
  //double _paddingVertical =
  //    0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  //List<String>
  //    _sumPadding; //Список всех отступов в получаемом параметре из стилей
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double _height = 600.0; //Высота раскрывающегося контейнера
  Alignment alignment; //Начало раскрывания контенера

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
              child: Column(
                children: <Widget>[
                  AnimatedContainer(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
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
                                          children: [
                                            WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              child: IconShadowWidget(
                                                Icon(
                                                  widget.style.icons,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                                shadowColor:
                                                    widget.style.colors[15],
                                              ),
                                            ),
                                            TextSpan(
                                              text: " " +
                                                  widget.headDropbox
                                                      .toUpperCase() +
                                                  " ",
                                              style: TextStyle(
                                                height: widget.style.heightText,
                                                color: widget.style.colors[14],
                                                fontFamily:
                                                    widget.style.fontFamily,
                                                fontSize:
                                                    widget.style.fontSize18,
                                                fontWeight:
                                                    widget.style.fontWeight400,
                                                fontStyle: widget
                                                    .style.fontStyleNormal,
                                                letterSpacing: _click
                                                    ? widget
                                                        .style.letterSpacingDown
                                                    : widget
                                                        .style.letterSpacingUp,
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
                                  opacity: widget.countDropbox > 0 ? 1.0 : 0.0,
                                  duration: widget.style.duration[4],
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: _click
                                          ? widget.style.edgeInsets[4]
                                          : widget.style.edgeInsets[5],
                                      padding: widget.countDropbox >= 10
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
                                        borderRadius:
                                            widget.style.radiusBorder[3],
                                        border: Border.all(
                                          color: widget.style.colors[13],
                                          width: widget.style.borderWidthCount,
                                        ),
                                      ),
                                      child: Text(
                                        widget.countDropbox.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: widget.style.heightCounter,
                                          color: widget.style.colors[5],
                                          fontFamily: widget.style.fontFamily,
                                          fontSize: widget.style.fontSize14,
                                          fontWeight:
                                              widget.style.fontWeight400,
                                          fontStyle:
                                              widget.style.fontStyleNormal,
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
                  /*
                  Container(
                    child: AnimatedOpacity(
                      opacity: _visible ? 1.0 : 0.3,
                      duration: widget.style.duration[0],
                      child: AnimatedContainer(
                          color: Colors.red,
                          margin: widget.style.edgeInsets[6],
                          width: MediaQuery.of(context).size.width *
                              widget.style.coefficientDropbox,
                          alignment: Alignment.topCenter,
                          height: _height,
                          duration: widget.style.duration[1],
                          curve: Curves.fastOutSlowIn,
                          child: Expanded(
                              child: new ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return new Text('wedwe');
                                  }),),),
                    ),
                  ),*/
                  Text('dfff'),
                  
                ],
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
      setState(() {
        if (counter == 0) {
          _click = true;
          print(_click);
          pressTapDown();
          /* _sumPadding = ((widget.style.edgeInsets[12]
                                      .toString()
                                      .replaceAll(RegExp('EdgeInsets'), ''))
                                  .replaceAll("(", ''))
                              .replaceAll(")", '')
                              .split(', ')
                              .toList();
                          for (int i = 0; i < _sumPadding.length; i++) {
                            if (_sumPadding[i].length.isOdd) {
                              _paddingVertical +=
                                  double.tryParse(_sumPadding[i]);
                            }
                          }
                          _paddingVertical = (20 +
                              (widget.listparams.length * _paddingVertical));
                          _height = _visible
                              ? 0.0
                              : ((widget.listparams.length *
                                          widget.style.heightUp) +
                                      _paddingVertical)
                                  .toDouble();
                          _visible = !_visible;
                          _paddingVertical = 0;
                          alignment = Alignment.topCenter;
*/
          counter += 1;
        } else {
          _click = false;
          print(_click);
          pressTapUp();
          counter -= 1;
        }
      });
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
/*
class Serb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
                  final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
    return Container(child:
      
                  
ListView.builder(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  }
),
    );
  }
}*/
*/