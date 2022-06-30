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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo_oyo_lab.png',
                height: 40,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivered To',
                    style: TextStyle(
                      color: ThemeClass.whiteColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '350001 Ahmedabad',
                    style: TextStyle(
                      color: ThemeClass.whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                    height: 25,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        print('object');
                      },
                      icon: Icon(Icons.expand_more),
                    ),
                  ),
                ],
              )
            ],
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
