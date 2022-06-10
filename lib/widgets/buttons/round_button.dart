import 'package:flutter/material.dart';

import '../../themedata.dart';

class RoundButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onTap;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final double verticalPadding;
  const RoundButton({
    Key? key,
    required this.buttonLabel,
    required this.onTap,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = "Lato",
    this.verticalPadding = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 5),
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
