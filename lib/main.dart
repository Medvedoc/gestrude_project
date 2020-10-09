import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(),
      body: _MyApp(),
    )));

// ignore: must_be_immutable
class _MyApp extends StatefulWidget {
  bool _lights = false;
  Color _color = Color.fromRGBO(118, 106, 2, 1);
  var _margin = EdgeInsets.only(top: 0.0);
  var _padding = EdgeInsets.only(bottom: 6.0);
  var _heigth = 48.0;

  @override
  _MyAppState createState() => _MyAppState(_lights, _color, _margin, _padding, _heigth);
}

class _MyAppState extends State<_MyApp> {
  bool _lights;
  Color _color;
  var _margin;
  var _padding;
  var _heigth;

  _MyAppState(this._lights, this._color, this._margin, this._padding, this._heigth);

  void pressButton() {
    setState(() {
      _lights = false;
      Future.delayed(const Duration(milliseconds: 250), () {
        setState(() {
          _color = Color.fromRGBO(118, 106, 2, 1);
          _margin = EdgeInsets.only(top: 0.0);
          _padding = EdgeInsets.only(bottom: 6.0);
          _heigth = 48.0;
        });
      });
      //_lights = true;
      _color = Colors.transparent;
     // _margin = EdgeInsets.only(top: 3.0, bottom:0.0);
      //_padding = EdgeInsets.only(bottom: 0.0, top: 3.0);
      _margin = EdgeInsets.only(top: 8.0);
      _padding = EdgeInsets.only(bottom: 2.0);
      _heigth = 44.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final intoContainer = BoxDecoration(
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

    final borderContainer = BoxDecoration(
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

    final shadowContainer = BoxDecoration(
      color: _lights==true ? _color : Color.fromRGBO(118, 106, 2, 1),
      borderRadius: BorderRadius.circular(20),
    );

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        child: GestureDetector(
          onTap: pressButton,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 50),
            height: _heigth,
            margin: _margin,
            padding: _padding,
            decoration: shadowContainer,
            child: Container(
              padding: EdgeInsets.all(3.5),
              width: MediaQuery.of(context).size.width,
              decoration: borderContainer,
              child: Container(
                height: 44.0,
                decoration: intoContainer,
                child: Text(
                  "ДОГОВОРЫ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.65,
                    color: Color.fromRGBO(33, 32, 30, 1),
                    fontFamily: 'Robots',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}