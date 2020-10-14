import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitanButtonStyle {
  double textShadowx = -12.0; //смещение тени текста кнопки по оси х
  double textShadowy = -12.0; //смещение тени текста кнопки по оси y
  IconData icon; //Иконка кнопки
  double intensity = 2.0; //Интенсивность тени текста кнопки
  double borderWidthCount = 2.0; //Толщина рамки счетчика
  double heightUp = 52.0;
  double heightDown = 44.0;
  double sizeIcon = 24.0;
  double sizeArrow = 26.0;
  double letterSpacingUp = 3.0;
  double letterSpacingDown = 2.8;
  double heightCounter = 0.95; //Высота inline шрифта счетчика
  double heightText = 1.20; //Высота inline шрифта названия кнопки
  double fontSize14 = 14.0;
  double fontSize18 = 18.0;
  String fontFamily = "Robots";
  FontWeight fontWeight400 = FontWeight.bold;
  FontStyle fontStyleNormal = FontStyle.normal;
  bool showShadow = true; //Тень иконки кнопки рядом с текстом

  //Отступы
  List<EdgeInsets> edgeInsets = [
    EdgeInsets.only(
        top: 8.0,
        left: 1.5,
        right: 1.5), //Отступ счетчика сверху и по-бокам при onTapDown [0]
    EdgeInsets.only(top: 0.0), //Отступ счетчика сверху [1]
    EdgeInsets.only(bottom: 0.0), //Отступ счетчика снизу при onTapDown [2]
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
    EdgeInsets.all(4.0), // Отступы рамки [10]
    EdgeInsets.symmetric(horizontal: 18.0), //Отступы внутри Dropbox [11]
    EdgeInsets.symmetric(
        vertical:
            6.0), //Отступы между кнопками внутри Dropbox [12] //!Не менять, т.к. значение участвует в расчете отступов раскрывающегося контейнера

    EdgeInsets.only(
        top: 8.0), //Отступ счетчика сверху и по-бокам при onTap Dropbox [13]
  ];

  //Цвета
  List<Color> colors = [
    Color.fromRGBO(253, 228, 0, 1), //Цвет 1 градиента кнопки [0]
    Color.fromRGBO(254, 229, 0, 1), //Цвет 2 градиента кнопки [1]
    Color.fromRGBO(237, 213, 5,
        1), //Цвет 3 градиента кнопки и Цвет 1 градиента кнопки при onTapUp[2]
    Color.fromRGBO(237, 212, 3,
        1), //Цвет 4 градиента кнопки и Цвет 2 градиента кнопки при onTapUp [3]
    Color.fromRGBO(118, 106, 2, 0.2), //[4]
    Color.fromRGBO(255, 255, 255, 1), //[5]
    Color.fromRGBO(118, 106, 2, 1), //Цвет тени обычной кнопки снизу [6]
    Color.fromRGBO(112, 112, 112, 1), //Цвет 1 градиента обводки кнопки [7]
    Color.fromRGBO(243, 243, 243, 1), //Цвет 2 градиента обводки кнопки [8]
    Color.fromRGBO(89, 89, 89, 1), //Цвет 2 градиента обводки кнопки [9]
    Color.fromRGBO(193, 193, 193, 1), //Цвет 4 градиента обводки кнопки [10]
    Color.fromRGBO(116, 106, 18, 1), //Цвет 1 градиента обводки счетчика [11]
    Color.fromRGBO(144, 126, 90, 1), //Цвет 2 градиента обводки счетчика [12]
    Color.fromRGBO(101, 91, 0, 1), //Цвет рамки счетчика [13]
    Color.fromRGBO(255, 255, 255, 1), //Цвет текста [14]
    Colors.grey.shade900, //Цвет иконки с тенью [15]
    Colors.grey.shade500, //Цвет иконки раскрывающегося списка [16]
    Color.fromRGBO(143, 0, 0, 1), //Цвет тени красной кнопки снизу [17]
  ];

  List<List<Color>> gradientButton = [
    [
      //Градиент неактивной обычной кнопки
      Color.fromRGBO(253, 228, 0, 1),
      Color.fromRGBO(254, 229, 0, 1),
      Color.fromRGBO(237, 213, 5, 1),
      Color.fromRGBO(237, 212, 3, 1),
    ],
    [
      //Градиент активной обычной кнопки
      Color.fromRGBO(237, 212, 3, 1),
      Color.fromRGBO(237, 213, 5, 1),
      Color.fromRGBO(254, 229, 0, 1),
      Color.fromRGBO(253, 228, 0, 1),
    ],
    [
      //Градиент неактивной красной кнопки
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(255, 0, 0, 1),
      Color.fromRGBO(208, 5, 5, 1),
      Color.fromRGBO(208, 5, 5, 1),
    ],
    [
      //Градиент активной красной кнопки
      Color.fromRGBO(209, 0, 0, 1),
      Color.fromRGBO(209, 0, 0, 1),
      Color.fromRGBO(208, 5, 5, 1),
      Color.fromRGBO(208, 5, 5, 1),
    ],
    [
      //Градиент рамки кнопки
      Color.fromRGBO(112, 112, 112, 1),
      Color.fromRGBO(243, 243, 243, 1),
      Color.fromRGBO(89, 89, 89, 1),
      Color.fromRGBO(193, 193, 193, 1),
    ],
  ];

  //Границы градиента
  List<List<double>> stopGradient = [
    [0.0, 0.5, 0.5, 1.0],
    [0.3, 0.6],
    [0.0, 1.0],
  ];

  //Размер радиуса рамки
  List<BorderRadius> radiusBorder = [
    BorderRadius.circular(20), //Радиус тени кнопки
    BorderRadius.circular(12), //Радиус обводки кнопки
    BorderRadius.circular(10), //Радиус внутреннего контейнера с градиентом
    BorderRadius.circular(28)
  ];

  //Задержка анимации
  List<Duration> duration = [
    Duration(
        milliseconds: 200), //[0] задержка появления элемента AnimatedOpacity
    Duration(
        milliseconds: 200), //[1] задержка раскрытия элемента AnimatedContainer
    Duration(
        milliseconds:
            100), //[2] задержка анимации контейнера AnimatedContainer тени кнопки
    Duration(
        milliseconds:
            200), //[3] задержка анимации AnimatedContainer градиента подложки с текстом кнопки
    Duration(
        milliseconds: 300), //[4] задержка анимации AnimatedContainer счетчика
  ];
}
