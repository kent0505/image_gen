import 'package:flutter/material.dart';

// если в проекте имеется ночная/светлая тема то использую ThemeExtension
abstract final class AppColors {
  static const Color accent = Colors.greenAccent;
  static const Color bg = Color(0xffF5F5F1);
  static const Color overScroll = Color(0xffd5d5d5);
  static const Color hintColor = Color(0xff707883);
}

abstract final class AppFonts {
  static const String w400 = 'w400';
  static const String w500 = 'w500';
  static const String w600 = 'w600';
  static const String w700 = 'w700';
}

abstract final class Constants {
  static const double appBarHeight = 60;
  static const double padding = 16;
  static const double radius = 10;
}

abstract final class Assets {
  static const String back = 'assets/back.svg';
}

abstract final class Keys {
  static const String onboard = 'onboard';
}
