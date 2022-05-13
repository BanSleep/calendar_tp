import 'package:calendar_tp/project_utils/pj_const.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PjColors {
  static Color white = GetStorage().read(PjConst.THEME) == false ? Color.fromRGBO(255, 255, 255, 1) : Color.fromRGBO(39, 39, 39, 1);
  static Color black = GetStorage().read(PjConst.THEME) == false ? Color.fromRGBO(0, 0, 0, 1) : Color.fromRGBO(255, 255, 255, 1.0);
  //EN
  //Add others colors
  //RU
  //Добавляйте другие цвета
  static Color grey = GetStorage().read(PjConst.THEME) == false ? Color.fromRGBO(242, 242, 242, 1.0) : Color.fromRGBO(0, 0, 0, 1.0);
  static const Color wrongPass = Color.fromRGBO(255, 188, 188, 1.0);
  static const Color blue = Color.fromRGBO(71, 166, 246, 1.0);
  static const Color red = Color.fromRGBO(249, 62, 62, 1.0);
  static const Color contGrey = Color.fromRGBO(242, 242, 242, 1.0);
  static const Color selectedItem = Color.fromRGBO(70, 185, 192, 1.0);
  static const Color navBarGrey = Color.fromRGBO(101, 101, 101, 1.0);
  static const Color editGrey = Color.fromRGBO(196, 196, 196, 1.0);
  static const Color grey227 = Color.fromRGBO(227, 227, 227, 1.0);
}