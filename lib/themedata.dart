// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ThemeClass {
  ThemeClass();
  static const Color whiteColor = Color(0xFFFFFFFF);
  static final Color whiteColor2 = Color(0xFFFCFCFC);

  static final Color orangeColor = Color(0xFFFE4300);
  static final Color orangeLightColor = Color(0xFFFFF9F6);
  static final Color orangeLightColor1 = Color(0xFFfe9975);

  static final Color redColor = Color(0xFFD70222);
  static final Color redColor1 = Color(0xFFFE0000);

  static final Color greenColor = Color(0xFF0A9200);

  static final Color blackColor = Color(0xFF000000);
  static final Color blackColor1 = Color(0xFF1E1E1E);
  static final Color blackColor2 = Color(0xFF0E0E0E);

  static final Color darkgreyColor = Color(0xFF292929);

  static final Color greyColor = Color(0xFF777777);
  static final Color greyColor1 = Color(0xFF5B5B5B);
  static final Color greyColor2 = Color(0xFFB2B2B2);

  static final greyLightColor = Color(0xffFBFBFB);
  static final greyLightColor1 = Color(0xffE3E3E3);
  static final greyLightColor2 = Color(0xffF4F9F9);

  static final notificationSettingGrey = Color(0xffB8B8B8);

  static final Color blueColor = Color(0xFF19627C);
  static final Color skyblueColor = Color(0xffF3FAFF);

  static final themeData = ThemeData(
      primaryColor: ThemeClass.blueColor,
      fontFamily: 'Lato',
      splashColor: ThemeClass.orangeColor);
}
