import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestrude_project/TitanButton.dart';
import 'package:gestrude_project/TitanStyle.dart';

class CustomDropboxWidget extends StatefulWidget {
  final TitanButtonStyle style;
  final String headDropbox;
  final int countDropbox;
  final List<TitanButton> listparams;
  final bool gradient;

  CustomDropboxWidget(
      {this.headDropbox, this.style, this.countDropbox, this.listparams, this.gradient});

  @override
  _CustomDropboxWidgetState createState() => _CustomDropboxWidgetState();
}

class _CustomDropboxWidgetState extends State<CustomDropboxWidget> {
  bool _click; //Событие на клик по кнопке
  Color color;
  List<Color> colors;
  List<double> stops;
  Alignment begin;
  Alignment end;
  int counter = 0;
  double _paddingVertical =
      0.0; //Начльное значение отступа раскрывающегося контейнера в Dropbox
  List<String>
      _sumPadding; //Список всех отступов в получаемом параметре из стилей
  bool _visible = false; //Раскрывающийся контейнер по умолчанию скрыт
  double _height = 0.0; //Высота раскрывающегося контейнера
  Alignment alignment; //Начало раскрывания контенера

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          TitanButton(
              pressTap: pressTap,
              pressTapDown: pressTapDown,
              pressTapUp: pressTapUp,
              headButton: widget.headDropbox,
              count: widget.countDropbox != null ? widget.countDropbox : 0,
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

  void pressTapUp() {
    setState(() {
      // _click = false;
      /* begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
      stops = widget.style.stopGradient[0];
      colors = [
        widget.style.colors[0],
        widget.style.colors[1],
        widget.style.colors[2],
        widget.style.colors[3]
      ];*/
    });
  }

  void pressTapDown() {
    setState(() {
      //_click = true;
      /* begin = Alignment.bottomCenter;
      end = Alignment.topCenter;
      colors = [
        widget.style.colors[3],
        widget.style.colors[2],
        widget.style.colors[1],
        widget.style.colors[0]
      ];
      stops = widget.style.stopGradient[0];*/
    });
  }

  void pressTap() {
    setState(() {
      if (counter == 0) {
        _click = true;
        pressTapDown();
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
        counter += 1;
      } else {
        _click = false;
        pressTapUp();
        counter -= 1;
        _visible = !_visible;
        _height = 0;
        alignment = Alignment.topCenter;
      }
    });
  }

  void initState() {
    super.initState();
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

class Serb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }),
    );
  }
}
/*void pressTap() {
    setState(() {
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

        counter -= 1;
      }
    });
  }*/