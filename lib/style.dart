import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StyleApp {
  static var top = FractionalOffset.topCenter;
  static var bottom = FractionalOffset.bottomCenter;
  static var list = [
    StyleApp.colors[0],
    StyleApp.colors[1],
    StyleApp.colors[2],
    StyleApp.colors[3],
  ];
  static var stop = [0.0, 0.5, 0.5, 1.0];

  //Стиль рамки
  static final borderContainer = BoxDecoration(
    color: Colors.white,
    gradient: LinearGradient(
      colors: [
        StyleApp.colors[7],
        StyleApp.colors[8],
        StyleApp.colors[9],
        StyleApp.colors[10]
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      stops: [0.1, 0.5, 0.5, 1.0],
    ),
    borderRadius: BorderRadius.circular(12),
  );

  //Стиль тени кнопки
  static final shadowContainer = BoxDecoration(
    color: StyleApp.colors[6],
    borderRadius: BorderRadius.circular(20),
  );

  //Стиль счетчика
  static final counterBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        StyleApp.colors[11],
        StyleApp.colors[12],
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      stops: [0.3, 0.6],
    ),
    borderRadius: BorderRadius.circular(28),
    border: Border.all(color: StyleApp.colors[13], width: 2.0),
  );

  static final intoContainer = BoxDecoration(
    gradient: LinearGradient(
      begin: top,
      end: bottom,
      colors: list,
      tileMode: TileMode.clamp,
      stops: stop,
    ),
    border: Border.all(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10),
  );

  static var heightUp = 52.0;
  static var heightDown = 44.0;
  static var letterSpacingUp = 3.0;
  static var letterSpacingDown = 2.8;
  static var heightCounter = 0.95;
  static var heightText = 1.20;
  static double fontSize14 = 14.0;
  static double fontSize18 = 20.0;
  static String fontFamily = "Robots";
  static var fontWeight400 = FontWeight.bold;
  static var fontStyleNormal = FontStyle.normal;

  //Отступы
  static const edgeInsets = [
    EdgeInsets.only(
        top: 8.0,
        left: 2.0,
        right: 2.0), //Отступ счетчика сверху и по-бокам при onTapDown [0]
    EdgeInsets.only(top: 0.0), //Отступ счетчика сверху [1]
    EdgeInsets.only(bottom: 2.0), //Отступ счетчика снизу при onTapDown [2]
    EdgeInsets.only(bottom: 6.0), //Отступ счетчика снизу [3]
    EdgeInsets.only(right: 8.5), //Отступ счетчика справа при onTapDown [4]
    EdgeInsets.only(right: 9.5), //Отступ счетчика справа [5]
    EdgeInsets.symmetric(
        horizontal: 6.5, vertical: 6.5), //Конечная позиция счетчика >10 [6]
    EdgeInsets.symmetric(
        horizontal: 6.0, vertical: 7.0), //Начальная позиция счетчика >10 [7]
    EdgeInsets.symmetric(
        horizontal: 10.5, vertical: 6.5), //Конечная позиция счетчика <10 [8]
    EdgeInsets.symmetric(
        horizontal: 10.0, vertical: 7.0), //Начальная позиция счетчика <10 [9]
    EdgeInsets.all(4.0) // Отступы рамки [10]
  ];

  //Цвета
  static const colors = [
    Color.fromRGBO(253, 228, 0, 1), //Цвет 1 градиента кнопки [0]
    Color.fromRGBO(254, 229, 0, 1), //Цвет 2 градиента кнопки [1]
    Color.fromRGBO(237, 213, 5,
        1), //Цвет 3 градиента кнопки и Цвет 1 градиента кнопки при onTapUp[2]
    Color.fromRGBO(237, 212, 3,
        1), //Цвет 4 градиента кнопки и Цвет 2 градиента кнопки при onTapUp [3]
    Color.fromRGBO(118, 106, 2, 0.2), //[4]
    Color.fromRGBO(255, 255, 255, 1), //[5]
    Color.fromRGBO(118, 106, 2, 1), //Цвет тени кнопки снизу [6]
    Color.fromRGBO(112, 112, 112, 1), //Цвет 1 градиента обводки кнопки [7]
    Color.fromRGBO(243, 243, 243, 1), //Цвет 2 градиента обводки кнопки [8]
    Color.fromRGBO(89, 89, 89, 1), //Цвет 2 градиента обводки кнопки [9]
    Color.fromRGBO(193, 193, 193, 1), //Цвет 4 градиента обводки кнопки [10]
    Color.fromRGBO(116, 106, 18, 1), //Цвет 1 градиента обводки счетчика [11]
    Color.fromRGBO(144, 126, 90, 1), //Цвет 2 градиента обводки счетчика [12]
    Color.fromRGBO(101, 91, 0, 1), //Цвет рамки счетчика [13]
    Color.fromRGBO(255, 255, 255, 1), //Цвет текста [14]
  ];
}
