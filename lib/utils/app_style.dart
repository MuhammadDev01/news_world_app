import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';

class AppStyle {
  static TextStyle style18medium(context) {
    return TextStyle(
      fontFamily: kFontOswald,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.5;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  return width / 600;
}
