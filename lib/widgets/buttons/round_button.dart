import 'package:flutter/material.dart';

import '../../themedata.dart';

class RoundButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onTap;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  const RoundButton({
    Key? key,
    required this.buttonLabel,
    required this.onTap,
    this.fontSize = 16,
    this.fontWeight=FontWeight.w600,
    this.fontFamily='Lato',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: ThemeClass.orangeColor,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            buttonLabel,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                color: ThemeClass.whiteColor),
          ),
        ),
      ),
    );
  }
}
