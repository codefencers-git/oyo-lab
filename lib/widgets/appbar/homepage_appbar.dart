// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';

import '../../routes.dart';

class HomePageAppBar extends StatelessWidget {
  HomePageAppBar({Key? key, required this.onTap}) : super(key: key);

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeClass.orangeColor,
      toolbarHeight: 70,
      elevation: 0,
      // leading: GestureDetector(
      //   onTap: onTap,
      //   child: const Padding(
      //     padding: EdgeInsets.symmetric(vertical: 13.0),
      //     child: ImageIcon(
      //       AssetImage("assets/icons/icon-hamberger.png"),
      //     ),
      //   ),
      // ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo_oyo_lab.png',
            height: 40,
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.loginScreen);
            },
            child: const Text(
              "Login",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeClass.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
