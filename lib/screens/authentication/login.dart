import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';

import '../../widgets/textfield/textfield_with_suffix.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObs = true;

  toggleObs() {
    setState(() {
      isObs = !isObs;
    });
  }

  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Validation? validation;

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 75, bottom: 60),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            ContainerWithInnerShadow(
                width: width,
                height: height * 0.65,
                child: Column(
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                          color: ThemeClass.orangeColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildEmailField(),
                          const SizedBox(height: 20),
                          _buildPasswordField(),
                          const SizedBox(height: 10),
                          _buildForgotPassword(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 60),
                            child: RoundButton(
                              buttonLabel: 'Login',
                              onTap: () {
                                Get.toNamed(Routes.homeScreen);
                              },
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "New Here?  ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ThemeClass.greyColor1,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () => Get.toNamed(Routes.signupScreen),
                                  child: Text(
                                    "Create an account",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ThemeClass.orangeColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        )),
      ),
    );
  }

  TextFieldWithSuffixIcon _buildEmailField() {
    return TextFieldWithSuffixIcon(
      textController: _emailOrPhoneController,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.text,
      validator: validation!.emailValidation,
      hintText: "Phone Number or Email",
      iconData: "assets/icons/icon-user.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildPasswordField() {
    return TextFieldWithSuffixIcon(
      textController: _passwordController,
      isReadOnly: false,
      keyboardType: TextInputType.visiblePassword,
      validator: validation!.passwordValidation,
      hintText: "Password",
      iconData: isObs
          ? "assets/icons/icon-password.png"
          : "assets/icons/icon-view-password.png",
      isObscureText: isObs,
      onIconTap: () => toggleObs(),
    );
  }

  GestureDetector _buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.forgotPasswordScreen);
      },
      child: Text(
        "Forgot Password ?",
        style: TextStyle(
            color: ThemeClass.orangeColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}