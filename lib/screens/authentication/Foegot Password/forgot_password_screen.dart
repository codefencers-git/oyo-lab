// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';
import 'package:oyo_labs/widgets/textfield/textfield_with_suffix.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  Validation? validation;
  final TextEditingController _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    validation = Validation();
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: width * 0.62,
              height: height * 0.45,
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
                  _buildTitleNdescription(width),
                  _buildTextField(
                      _formKey, _phoneNumberController, validation!),
                  _buildButton(_formKey),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildButton(GlobalKey<FormState> _formKey) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: RoundButton(
        buttonLabel: 'key_get_code'.tr,
        onTap: () {
          // if (_formKey.currentState!.validate()) {}

          // Get.toNamed(Routes.mobileVerificationScreen,
          //     arguments: 'forgotPasswordScreen');
        },
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
    );
  }

  Form _buildTextField(GlobalKey<FormState> _formKey,
      TextEditingController _phoneNumberController, Validation validation) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFieldWithSuffixIcon(
          textController: _phoneNumberController,
          isReadOnly: false,
          isObscureText: false,
          keyboardType: TextInputType.number,
          validator: validation.phoneNumverValidation,
          hintText: 'key_phone_number'.tr,
          iconData: "assets/icons/icon-phone.png",
          onIconTap: () {},
        ),
      ),
    );
  }

  Column _buildTitleNdescription(double width) {
    return Column(
      children: [
        Text(
          'key_forgot_password'.tr,
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
            'key_forgot_password_description'.tr,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ThemeClass.greyColor1,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  bool isLoading = false;
  _sendOTP() {
    isLoading = true;
    try {
      var mapData = Map<String, dynamic>();

      mapData['phone_number'] = _phoneNumberController.text.trim();
       var url = 'recover-password';
    } catch (e) {
      if (e is SocketException) {
        showToast(GlobalMessages.socketExceptionMessage);
      } else if (e is TimeoutException) {
        showToast(GlobalMessages.timeoutExceptionMessage);
      } else {
        showToast(e.toString());
      }
    } finally {
      isLoading = false;
    }
  }
}
