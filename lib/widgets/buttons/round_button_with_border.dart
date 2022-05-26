import 'package:flutter/material.dart';

import '../../themedata.dart';

class BorderRoundButton extends StatelessWidget {
  final Widget buttonLabel;
  final VoidCallback onTap;
  const BorderRoundButton(
      {Key? key, required this.buttonLabel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            border: Border.all(color: ThemeClass.orangeColor, width: 1),
            borderRadius: BorderRadius.circular(30)),
        child: Center(child: buttonLabel),
      ),
    );
  }
}
