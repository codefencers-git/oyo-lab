import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';

class ContainerWithInnerShadow extends StatelessWidget {
  const ContainerWithInnerShadow({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(70),
        ),
        boxShadow: [
          BoxShadow(
            color: ThemeClass.greyColor.withOpacity(0.3),
          ),
          BoxShadow(
            color: ThemeClass.greyColor.withOpacity(0.3),
            spreadRadius: -12,
            blurRadius: 12,
          ),
        ],
      ),
      child: Container(
        width: width,
        // height: height,
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(70),
          ),
          boxShadow: [
            BoxShadow(
              color: ThemeClass.greyColor.withOpacity(0.3),
            ),
            BoxShadow(
              color: ThemeClass.orangeLightColor,
              spreadRadius: -1,
              blurRadius: 10,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
