import 'package:flutter/material.dart';

import '../../themedata.dart';

class RoundButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback onTap;
  const RoundButton({Key? key, required this.buttonLabel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 5),
        decoration: BoxDecoration(
            color: ThemeClass.orangeColor,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            buttonLabel,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: ThemeClass.whiteColor),
          ),
        ),
      ),
    );
  }
}
