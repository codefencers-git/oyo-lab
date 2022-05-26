import 'package:flutter/material.dart';
import '../../themedata.dart';

class RoundButtonWithIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  const RoundButtonWithIcon(
      {Key? key, required this.onTap, required this.label})
      : super(key: key);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: ThemeClass.whiteColor),
              ),
              Icon(Icons.arrow_forward_sharp,
                  size: 22, color: ThemeClass.whiteColor),
            ],
          ),
        ),
      ),
    );
  }
}
