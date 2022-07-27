import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/authentication/user_controller.dart';
import 'package:oyo_labs/screens/home/Homepage%20Services/dashboard_services.dart';
import 'package:oyo_labs/services/product_category/product_category_service.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';
import '../../../widgets/textfield/textfield_with_suffix.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key,this.isFromBooking}) : super(key: key);

  bool? isFromBooking;

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

  final _formKey = GlobalKey<FormState>();

  UserController userController = Get.put(UserController());

  final DashboardController dashboardController =
      Get.put(DashboardController());

  final ProductCategoryController _categoryController =
      Get.put(ProductCategoryController());

  @override
  void initState() {
    _categoryController.getProductCategory();
    super.initState();
  }

  _clearTextFields() {
    _emailOrPhoneController.clear();
    _passwordController.clear();
  }

  _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      var mapData = <String, dynamic>{};
      mapData['username'] = _emailOrPhoneController.text.trim();
      mapData['password'] = _passwordController.text.trim();
      mapData['device_token'] = "0";
      mapData['device_type'] = Platform.isAndroid ? "android" : "ios";

      try {
        EasyLoading.show();
        await userController.loginServices(mapData,widget.isFromBooking);
      
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        EasyLoading.dismiss();
      }
      _clearTextFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    validation = Validation();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height * 0.20,
                width: width * 0.62,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              ContainerWithInnerShadow(
                width: width,
                height: height * 0.67,
                child: Column(
                  children: [
                    _buildLoginTitle(),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildEmailField(),
                            const SizedBox(height: 20),
                            _buildPasswordField(),
                            const SizedBox(height: 10),
                            _buildForgotPassword(),
                            SizedBox(
                              height: height / 8,
                            ),
                            _buildLoginButton(),
                            const SizedBox(height: 20),
                            _buildKeyNewHere()
                          ],
                        ),
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

  Text _buildLoginTitle() {
    return Text(
      'key_login_title'.tr,
      style: TextStyle(
          color: ThemeClass.orangeColor,
          fontSize: 24,
          fontWeight: FontWeight.w700),
    );
  }

  RoundButton _buildLoginButton() {
    return RoundButton(
      buttonLabel: 'key_login_btn'.tr,
      onTap: () async {
        _onSubmit();
        await dashboardController.getDashboardData();
      },
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }

  Padding _buildKeyNewHere() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'key_new_here'.tr,
            style: TextStyle(
                fontSize: 16,
                color: ThemeClass.greyColor1,
                fontWeight: FontWeight.w400),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.signupScreen),
            child: Text(
              'key_create_account'.tr,
              style: TextStyle(
                  fontSize: 16,
                  color: ThemeClass.orangeColor,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
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
      hintText: 'key_phone_email'.tr,
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
      hintText: 'key_password'.tr,
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
        'key_forgot_password'.tr,
        style: TextStyle(
            color: ThemeClass.orangeColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
