// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';
import 'package:oyo_labs/widgets/textfield/textfield_with_suffix.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Validation? validation;
    final TextEditingController _phoneNumberController =
        TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    validation = Validation();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: width * 0.62,
                height: height * 0.55,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              ContainerWithInnerShadow(
                width: width,
                height: height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              color: ThemeClass.orangeColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          width: width * 0.7,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Text(
                            "Please enter your registered phone number for received OTP code.",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ThemeClass.greyColor1,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFieldWithSuffixIcon(
                        textController: _phoneNumberController,
                        isReadOnly: false,
                        isObscureText: false,
                        keyboardType: TextInputType.number,
                        validator: validation.phoneNumverValidation,
                        hintText: "Phone Number",
                        iconData: "assets/icons/icon-phone.png",
                        onIconTap: () {},
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: RoundButton(
                   
                        buttonLabel: 'Get Code',
                        onTap: () {
                          Get.toNamed(Routes.mobileVerificationScreen,
                              arguments: 'forgotPasswordScreen');
                        },
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
