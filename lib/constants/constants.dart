import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constans {
  Constans._();
  //bu sınıftan nesne üretilmemesi için bu kodu yazdık.

  static const String title = "Pokedex";

  static TextStyle getTitleTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFonstSize(48));
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFonstSize(22));
  }

  static TextStyle getTypeChipTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFonstSize(20),
    );
  }

  static _calculateFonstSize(int size) {
    return ScreenUtil().orientation == Orientation.portrait
        ? size.sp
        : (size * 1.5).sp;
  }
  //telefonda kulalnılan font boyutuna göre hesaplama yapılıyor
}
