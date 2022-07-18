// ignore_for_file: avoid_print, must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../widgets/buttons/round_button.dart';
import '../../../widgets/container_with_inner_shadow.dart';
import 'mobile_verification_controller.dart';

class MobileVerification extends StatefulWidget {
  MobileVerification({
    Key? key,
    required this.fromScreen,
    required this.userNameorPhoneNumber,
  }) : super(key: key);

  String fromScreen;
  String userNameorPhoneNumber;

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  StreamController<ErrorAnimationType>? errorController;

  final TextEditingController _otpController = TextEditingController();
  bool isShowResend = false;
  Timer? periodicTimer;
  dynamic argumentData = Get.arguments;

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

  MobileVerificationController mobileVerificationControllerController =
      Get.put(MobileVerificationController());
  @override
  Widget build(BuildContext context) {
    print(widget.fromScreen);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        body: SingleChildScrollView(
          child: Container(
            height: height * 0.97,
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
                        'key_verify_mobile_number'.tr,
                        style: TextStyle(
                            color: ThemeClass.orangeColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Text.rich(
                          TextSpan(
                              text: 'key_code_sent_on_mobile'.tr,
                              style: TextStyle(
                                  fontSize: 14, color: ThemeClass.greyColor1),
                              children: [
                                TextSpan(
                                  text: widget.userNameorPhoneNumber,
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
                            'key_enter_code_here'.tr,
                            style: TextStyle(
                                color: ThemeClass.greyColor1,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 20),
                          _buildOtpTextBox(),
                          _buildResendRow(),
                          const SizedBox(height: 20),
                        ],
                      ),
                      _buildButtonWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildResendRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'key_didnt_get_code'.tr,
          style: TextStyle(
              fontSize: 16,
              color: ThemeClass.greyColor1,
              fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'key_resend_in'.tr + '$timerValue.',
            style: TextStyle(
                fontSize: 16,
                color: ThemeClass.orangeColor,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Padding _buildButtonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RoundButton(
        buttonLabel: widget.fromScreen == 'forgotPasswordScreen'
            ? 'key_submit_btn'.tr
            : 'key_login_btn'.tr,
        onTap: () {
          widget.fromScreen == 'forgotPasswordScreen'
              ? mobileVerificationControllerController
                  .checkOtpForChangePassword(
                      widget.userNameorPhoneNumber, _otpController.text)
              : mobileVerificationControllerController.checkOtp(
                  widget.userNameorPhoneNumber, _otpController.text);
        },
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
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
        controller: _otpController,
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
