// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';

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
        children: [
          const ImageIcon(AssetImage("assets/icons/icon-location.png")),
          const SizedBox(width: 10),
          Text(
            " Ahmedabad, Gujarat",
            style: TextStyle(
                fontSize: 14,
                color: ThemeClass.whiteColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
