import 'package:flutter/material.dart';
import '../../themedata.dart';

class TextFieldWithSuffixIcon extends StatelessWidget {
   TextFieldWithSuffixIcon({
    Key? key,
    required this.textController,
    required this.isReadOnly,
    required this.isObscureText,
    this.keyboardType =  TextInputType.text,
    this.validator,
    required this.hintText,
    required this.iconData,
    required this.onIconTap,
  }) : super(key: key);

  final TextEditingController textController;
  final bool isReadOnly;
  final bool isObscureText;
  TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String hintText;
  final String iconData;
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeClass.whiteColor,
          borderRadius: BorderRadius.circular(25)),
      child: TextFormField(
        controller: textController,
        readOnly: isReadOnly,
        obscureText: isObscureText,
        keyboardType: keyboardType,
        validator: validator,
        cursorColor: ThemeClass.orangeColor,
        style: TextStyle(
            color: ThemeClass.blackColor1,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
          hintText: hintText,
          hintStyle: TextStyle(
              color: ThemeClass.blackColor1,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          suffixIcon: InkWell(
            onTap: onIconTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(iconData),
                  ),
                ),
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: ThemeClass.greyLightColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: ThemeClass.greyLightColor,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
