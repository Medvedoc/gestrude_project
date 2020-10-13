import 'package:flutter/material.dart';

abstract class PageState {
  bool isBusy = false;
  int subState = 0;
}

abstract class MainEvent {}

class MainPageEvent extends MainEvent {
  int tabIndex;

  MainPageEvent(this.tabIndex) : super();
}

class MainState extends PageState {
  static const int button1 = 0;
  static const int button2 = 1;
  static const int button3 = 2;
  static var words = [
    "Кнопка 1",
    "Кнопка 2",
    "Кнопка 3",
  ];

  String getPageName(BuildContext context) {
    switch (subState) {
      case button1:
        return "ффф1";
      case button2:
        return "ффф2";
      case button3:
        return "ффф3";
    }
    return "";
  }
}
