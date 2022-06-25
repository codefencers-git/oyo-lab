// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../widgets/buttons/round_button.dart';
import '../../widgets/container_with_inner_shadow.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({Key? key}) : super(key: key);

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

final _formKey = GlobalKey<FormState>();

StreamController<ErrorAnimationType>? errorController;

final TextEditingController textEditingController = TextEditingController();

class _MobileVerificationState extends State<MobileVerification> {
  bool isShowResend = false;
  Timer? periodicTimer;

  stopTimer() {
    periodicTimer!.cancel();
    setState(() {
      isShowResend = true;
    });
  }

  int timerValue = 30;
  @override
  void initState() {
    periodicTimer = Timer.periodic(
      const Duration(seconds: 01),
      (timer) {
        setState(() {
          if (timerValue == 0) {
            stopTimer();
          } else {
            timerValue--;
          }
        });
        // Update user about remaining time
      },
    );
    super.initState();
  }

  startTimer() {
    setState(() {
      timerValue = 60;
      isShowResend = false;
    });

    periodicTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (timerValue == 1) {
            stopTimer();
          } else {
            timerValue--;
          }
        });
        // Update user about remaining time
      },
    );
  }

  @override
  void dispose() {
    periodicTimer!.cancel();

    super.dispose();
  }

  var screenName = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(screenName);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.62,
                padding: const EdgeInsets.symmetric(vertical: 113),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              ContainerWithInnerShadow(
                width: width,
                height: height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Verify Mobile Number",
                      style: TextStyle(
                          color: ThemeClass.orangeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text.rich(
                        TextSpan(
                            text:
                                "A 6 digit code has been sent on your mobile number ",
                            style: TextStyle(
                                fontSize: 14, color: ThemeClass.greyColor1),
                            children: [
                              TextSpan(
                                text: '8200092056',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ThemeClass.orangeColor),
                              )
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Column(
                      children: [
                        Text(
                          "Enter the verification code here",
                          style: TextStyle(
                              color: ThemeClass.greyColor1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        _buildOtpTextBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't get the code?",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ThemeClass.greyColor1,
                                  fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                " Resend in 00:${timerValue}.",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ThemeClass.orangeColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RoundButton(
                        buttonLabel:
                            screenName == 'signupScreen' ? 'Login' : 'Submit',
                        onTap: () {
                          screenName == 'signupScreen'
                              ? Get.toNamed(Routes.homeScreen)
                              : Get.toNamed(Routes.changePasswordScreen);
                        },
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildOtpTextBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: ThemeClass.orangeColor,
          fontWeight: FontWeight.bold,
        ),
        length: 6,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: (v) {
          if (v!.length < 3) {
            return GlobalMessages.pleasEenterVaildOTP;
          } else {
            return null;
          }
        },
        errorTextSpace: 30,
        textStyle: TextStyle(
            fontSize: 30,
            color: ThemeClass.orangeColor,
            fontWeight: FontWeight.w700),
        pinTheme: PinTheme(
          fieldOuterPadding: EdgeInsets.zero,
          shape: PinCodeFieldShape.circle,
          fieldHeight: 53,
          fieldWidth: 53,
          selectedFillColor: ThemeClass.whiteColor,
          inactiveFillColor: ThemeClass.whiteColor,
          activeFillColor: ThemeClass.whiteColor,
          activeColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          selectedColor: ThemeClass.orangeColor.withOpacity(0.2),
        ),
        cursorColor: ThemeClass.orangeColor,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {},
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
