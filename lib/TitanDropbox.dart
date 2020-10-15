import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/TitanButton.dart';
import 'package:gestrude_project/TitanStyle.dart';

class TitanDropbox extends StatefulWidget {
  final bool gradient;
  final int countDropbox;
  final List<TitanButton> listparams;
  final TitanButtonStyle style;
  final String headDropbox;
  final bool variable;

  TitanDropbox({
    this.gradient,
    this.countDropbox,
    this.listparams,
    this.style,
    this.headDropbox,
    this.variable,
  });

  @override
  _TitanDropboxState createState() => _TitanDropboxState();
}

class _TitanDropboxState extends State<TitanDropbox> {
  Alignment alignment; //Начало раскрывания контенера
  double _height = 0.0; //Высота раскрывающегося контейнера
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double _paddingVertical =
      0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  int _counter = 0; //Переключатель срабатывания Dropbox
  List<String>
      _sumPadding; //Список всех отступов в получаемом параметре из стилей
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          TitanButton(
            variable:true,
              pressTap: pressTap,
              //pressTapDown:pressTapDown,
              //pressTapUp:pressTapUp,
              headButton: widget.headDropbox,
              arrowDropbox: true,
              style: TitanButtonStyle()),
          InkWell(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: widget.style.duration[0],
              child: AnimatedContainer(
                margin: widget.style.edgeInsets[6],
                alignment: Alignment.topCenter,
                height: _height,
                duration: widget.style.duration[1],
                curve: Curves.fastOutSlowIn,
                child: ListView.builder(
                  padding: widget.style.edgeInsets[11],
                  itemCount: widget.listparams.length,
                  primary: false,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: widget.style.edgeInsets[12],
                      child: widget.listparams[index],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void pressTap() {
    setState(() {
      if (_counter == 0) {
        _sumPadding = ((widget.style.edgeInsets[12]
                    .toString()
                    .replaceAll(RegExp('EdgeInsets'), ''))
                .replaceAll("(", ''))
            .replaceAll(")", '')
            .split(', ')
            .toList();
        for (int i = 0; i < _sumPadding.length; i++) {
          if (_sumPadding[i].length.isOdd) {
            _paddingVertical += double.tryParse(_sumPadding[i]);
          }
        }
        _paddingVertical = (20 + (widget.listparams.length * _paddingVertical));
        _height = _visible
            ? 0.0
            : ((widget.listparams.length * widget.style.heightUp) +
                    _paddingVertical)
                .toDouble();
        _visible = !_visible;
        _paddingVertical = 0;
        _counter += 1;
        print(_counter);
      } else {
        _counter -= 1;
        _visible = !_visible;
        _height = 0;
        alignment = Alignment.topCenter;
        print(_counter);
      }
    });
  }
}
