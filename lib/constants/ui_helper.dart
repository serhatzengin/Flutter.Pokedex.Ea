import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
    // cihaz eğer yataysa ekranın yüzde 15i eğer yataysa yüzde 15 i ni kapsasın
  }

  static EdgeInsets getDefaultPadding() {
    return ScreenUtil().orientation == Orientation.portrait
        ? EdgeInsets.all(12.h)
        : EdgeInsets.all(8.w);
  }
}
