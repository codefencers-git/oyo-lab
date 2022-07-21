// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';

class AppbarWithBackButton extends StatelessWidget {
  AppbarWithBackButton({
    Key? key,
    required this.appbarTitle,
    this.onIconPress,
    this.isShowSearch = false,
    this.elevation = 0,
  }) : super(key: key);
  String appbarTitle;
  bool isShowSearch;
  double elevation;
  Function? onIconPress;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      shadowColor: const Color(0x0000001a).withOpacity(0.3),
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
      actions: [
        isShowSearch
            ? IconButton(
                onPressed: () {
                  onIconPress!();
                },
                icon: const Icon(Icons.search))
            : const SizedBox()
      ],
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appbarTitle,
            style: const TextStyle(
                fontSize: 14,
                color: ThemeClass.whiteColor,
                fontWeight: FontWeight.w400),
          ),
          Image.asset(
            'assets/images/logo_oyo_lab.png',
            height: 30,
          ),
        ],
      ),
    );
  }
}
