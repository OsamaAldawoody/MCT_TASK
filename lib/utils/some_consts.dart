import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SomeConsts {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static double get _pixelRatio => ui.window.devicePixelRatio;
  static Size get _size => ui.window.physicalSize / _pixelRatio;

  static _AppColors get colors => _AppColors();
  static _AppAssets get assets => _AppAssets();
  static _ConstsTexts get constTexts => _ConstsTexts();
  static BuildContext get context => navigatorKey.currentContext!;
  static _PopUps get popUps => _PopUps();
  static double get width => _size.width;
  static double get height => _size.height;
}

class _AppColors {
  final mainColor = Color(0xff4F0091);
  final lightGreyColor = Color(0xff8C8C8C);
  final darkGreyColor = Color(0xff3A4759);
  final greenColor = Color(0xff009877);
}

class _AppAssets {
  final logo = 'assets/images/logo.png';
}

class _ConstsTexts {
  final baseRoute = 'http://207.244.243.120:9031/api';
}

class _PopUps {
  void showSnackBar(String content) {
    ScaffoldMessenger.of(SomeConsts.context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
