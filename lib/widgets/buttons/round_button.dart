import 'package:flutter/material.dart';

import '../../themedata.dart';

class RoundButton extends StatelessWidget {
  final String buttonLabel;

  final VoidCallback onTap;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? fontcolor;
  final String fontFamily;
  final Color? color;
  const RoundButton({
    Key? key,
    required this.buttonLabel,
    required this.onTap,
    this.fontSize = 18,
    this.fontcolor,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = "Lato",
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            border: Border.all(color: ThemeClass.orangeColor),
            color: color ?? ThemeClass.orangeColor,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            buttonLabel,
            style: TextStyle(
              fontSize: fontSize,
              color: fontcolor ?? ThemeClass.whiteColor,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
