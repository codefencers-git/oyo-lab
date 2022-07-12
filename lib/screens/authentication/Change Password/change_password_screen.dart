import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';
import '../../../widgets/textfield/textfield_with_suffix.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

        var changePasswordController = Get.put(ChangePasswordController());

  bool isObs = true;
  bool isConfirmPwdObs = true;

  toggleObs() {
    setState(() {
      isObs = !isObs;
    });
  }

  confirmPwdToggleObs() {
    setState(() {
      isConfirmPwdObs = !isConfirmPwdObs;
    });
  }

    final _formKey = GlobalKey<FormState>();

  Validation? validation;
  @override
  Widget build(BuildContext context) {
    validation = Validation();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.55,
                padding: const EdgeInsets.symmetric(vertical: 148),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              ContainerWithInnerShadow(
                width: width,
                height: height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            'key_change_password'.tr,
                            style: TextStyle(
                                color: ThemeClass.orangeColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: width * 0.7,
                            child: Text(
                              'key_change_password_description'.tr,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: ThemeClass.greyColor1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          _buildPasswordField(),
                          const SizedBox(height: 15),
                          _buildConfirmPasswordField()
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 30, right: 30),
                      child: RoundButton(
                        buttonLabel: 'key_change_password'.tr,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            var mapData = <String, dynamic>{};
                                mapData['otp'] = Get.arguments[0]['userName'];
                            mapData['username'] =Get.arguments[1]['otp'];
                            mapData['new_password'] = _passwordController.text;
                            mapData['confirm_password'] =
                                _confirmPasswordController.text;
                                changePasswordController.changePasswordService(mapData);
                          }
                          
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

  TextFieldWithSuffixIcon _buildPasswordField() {
    return TextFieldWithSuffixIcon(
      textController: _passwordController,
      isReadOnly: false,
      keyboardType: TextInputType.visiblePassword,
      validator: validation!.passwordValidation,
      hintText: 'key_password'.tr,
      iconData: isObs
          ? "assets/icons/icon-password.png"
          : "assets/icons/icon-view-password.png",
      isObscureText: isObs,
      onIconTap: () => toggleObs(),
    );
  }

  TextFieldWithSuffixIcon _buildConfirmPasswordField() {
    return TextFieldWithSuffixIcon(
      textController: _confirmPasswordController,
      isReadOnly: false,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return GlobalMessages.emptyMessage + 'password field';
        } else if (value.length < 6) {
          return GlobalMessages.passwordshoudbeatleat;
        } else if (value != _passwordController.text) {
          return GlobalMessages.incorrectConfirmPassword;
        }
        return null;
      },
      hintText: 'key_confirm_password'.tr,
      iconData: isConfirmPwdObs
          ? "assets/icons/icon-password.png"
          : "assets/icons/icon-view-password.png",
      isObscureText: isConfirmPwdObs,
      onIconTap: () => confirmPwdToggleObs(),
    );
  }
}
