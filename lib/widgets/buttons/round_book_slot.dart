import 'package:flutter/material.dart';
import '../../themedata.dart';

class RoundButtonBookSlot extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  const RoundButtonBookSlot(
      {Key? key, required this.onTap, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
        child: Container(
          width: double.infinity,
          height: 20,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: ThemeClass.orangeColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Group 2600.png'),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                      color: ThemeClass.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
