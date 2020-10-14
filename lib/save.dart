import 'package:flutter/material.dart';
import 'package:gestrude_project/TitanButton.dart';
import 'package:gestrude_project/TitanStyle.dart';

class CustomDropboxWidgetWork extends StatefulWidget {
  final String head;
  final List<TitanButton> listparams;
  final TitanButtonStyle style;
  CustomDropboxWidgetWork({this.listparams, this.style, this.head});
  @override
  _CustomDropboxWidgetWorkState createState() => _CustomDropboxWidgetWorkState();
}

class _CustomDropboxWidgetWorkState extends State<CustomDropboxWidgetWork> {
  double _paddingVertical =
      0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  List<String>
      _sumPadding; //Список всех отступов в получаемом параметре из стилей
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double _height; //Высота раскрывающегося контейнера
  Alignment alignment; //Начало раскрывания контенера

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          //onTap: pressTap,
          //onTapDown: (value) => pressTapDown(),
          onTap: pressTap,
          child: Text(widget.head),
        ),
        AnimatedOpacity(
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
            child: ListView.builder(
              padding: widget.style.edgeInsets[11],
              itemCount: widget.listparams.length,
              primary: false,
              itemBuilder: (BuildContext context, int index) {
                print(widget.listparams.length);
                return Container(
                  padding: widget.style.edgeInsets[12],
                  child: widget.listparams[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void pressTap() {
    setState(() {
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
      _paddingVertical=0;
      alignment = Alignment.topCenter;
    });
  }

  void initState() {
    super.initState();
    _paddingVertical = 0;
    _height = 0.0;
    _visible = false;
    alignment = Alignment.topCenter;
  }
}