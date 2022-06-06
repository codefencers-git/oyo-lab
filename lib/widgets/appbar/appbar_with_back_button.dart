import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';

class AppbarWithBackButton extends StatelessWidget {
  AppbarWithBackButton({
    Key? key,
    required this.appbarTitle,
  }) : super(key: key);
  String appbarTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 70,
      backgroundColor: ThemeClass.orangeColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ImageIcon(AssetImage("assets/icons/icon-back.png")),
        ),
      ),
      title: Text(
        appbarTitle,
        style: TextStyle(
            fontSize: 14,
            color: ThemeClass.whiteColor,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}