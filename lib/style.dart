import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StyleApp {

  //Стиль рамки
  static final borderContainer = BoxDecoration(
    color: Colors.white,
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

  static final shadowContainer = BoxDecoration(
    color: Color.fromRGBO(118, 106, 2, 1),
    borderRadius: BorderRadius.circular(20),
  );


  //Стиль счетчика
  static final counterBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(116, 106, 18, 1),
        Color.fromRGBO(144, 126, 90, 1)
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      stops: [0.3, 0.6],
    ),
    borderRadius: BorderRadius.circular(28),
    border: Border.all(color: Color.fromRGBO(101, 91, 0, 1), width: 2.0),
  );

  //Отступы
  static const edgeInsets = [
    EdgeInsets.only(top: 8.0, left: 2.0, right: 2.0),
    EdgeInsets.only(top: 0.0),
    EdgeInsets.only(bottom: 2.0),
    EdgeInsets.only(bottom: 6.0),
    EdgeInsets.only(right: 9.5),
    EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
    EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
  ];
}
