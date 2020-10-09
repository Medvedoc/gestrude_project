import 'package:flutter/material.dart';

final kInnerDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(254, 229, 0, 1),
      Color.fromRGBO(237, 213, 5, 1),
      Color.fromRGBO(237, 212, 3, 1)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp,
    stops: [0.0, 0.5, 0.5, 1.0],
  ),
  border: Border.all(color: Colors.transparent),
  borderRadius: BorderRadius.circular(10),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromRGBO(112, 112, 112, 1),
      Color.fromRGBO(243, 243, 243, 1),
      Color.fromRGBO(89, 89, 89, 1),
      Color.fromRGBO(193, 193, 193, 1)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp,
    stops: [0.1, 0.5, 0.5, 1.0],
  ),
  borderRadius: BorderRadius.circular(12),
);

void main() => runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(),
      body: _MyApp(),
    )));

// ignore: must_be_immutable
class _MyApp extends StatefulWidget {
  bool _lights = false;
  Color _color;
  String _margin;

  @override
  _MyAppState createState() => _MyAppState(_lights, _color, _margin);
}

class _MyAppState extends State<_MyApp> {
  bool _lights;
  Color _color;
  var _margin;

  _MyAppState(this._lights, this._color, this._margin);

  void pressButton() {
    setState(() {
        _lights = true;
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            _color = Color.fromRGBO(118, 106, 2, 1);
            _margin = EdgeInsets.only(top: 0.0);
          });
        });
      _color = Colors.transparent;
      _margin = EdgeInsets.only(top: 5.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        child: GestureDetector(
          onTap: pressButton,
          child: Container(
            height: 42.0,
            margin: _margin,
            padding: EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
              color: _lights?_color: Color.fromRGBO(118, 106, 2, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 38.0,
                      padding: EdgeInsets.all(0.0),
                      margin: EdgeInsets.all(0.0),
                      child: Text(
                        "ДОГОВОРЫ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.65,
                          color: Color.fromRGBO(33, 32, 30, 1),
                          //fontFamily: 'Roboto',
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      decoration: kInnerDecoration,
                    ),
                  ),
                  decoration: kGradientBoxDecoration,
                ),
              ),
            ),
          ),
          /*Text(
            "примерный текст",
            style: TextStyle(color: _lights ? Colors.pink : _color),
          ),*/
        ),
      ),
    );
  }
}
