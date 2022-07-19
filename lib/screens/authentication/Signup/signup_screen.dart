import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_enum_class.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';
import 'package:oyo_labs/widgets/textfield/textfield_with_suffix.dart';
import '../user_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  enumForMF _radioMF = enumForMF.Male;
  bool check = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  bool isObs = true;

  toggleObs() {
    setState(() {
      isObs = !isObs;
    });
  }

  Validation? validation;

  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    validation = Validation();
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1950),
        lastDate: currentDate);
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

        _dobController.text = formattedDate;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    validation = Validation();
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildLogoWidget(width, height),
            ContainerWithInnerShadow(
              width: width,
              height: height / 0.1,
              child: Column(
                children: [
                  _buildRegisterTitle(),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, bottom: 15, left: 20, right: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFullNameWidget(),
                          const SizedBox(height: 15),
                          _buildEmailWidget(),
                          const SizedBox(height: 15),
                          _buildPhoneNumberWidget(),
                          const SizedBox(height: 15),
                          _buildPasswordField(),
                          const SizedBox(height: 15),
                          _buildGenderWidget(),
                          const SizedBox(height: 10),
                          _buildDoBWidget(context),
                          const SizedBox(height: 15),
                          _buildReferralCodeWidget(),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Transform.scale(
                                    scale: 0.9,
                                    child: Checkbox(
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                            width: 1.0,
                                            color: ThemeClass.orangeColor),
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: ThemeClass.orangeColor,
                                      value: check,
                                      onChanged: (b) {
                                        setState(
                                          () {
                                            check = !check;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text: 'Accept',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        TextSpan(
                                            text: 'Terms',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: ThemeClass.orangeColor)),
                                        const TextSpan(
                                            text: '& ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        TextSpan(
                                            text: 'Condition',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: ThemeClass.orangeColor)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _buildRegisterWidget(),
                          const SizedBox(height: 15),
                          _buildAlreadyExistWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _buildRegisterTitle() {
    return Text(
      'key_register_title'.tr,
      style: TextStyle(
          color: ThemeClass.orangeColor,
          fontSize: 24,
          fontWeight: FontWeight.w700),
    );
  }

  Container _buildLogoWidget(double width, double height) {
    return Container(
      width: width * 0.45,
      height: height * 0.2,
      child: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Padding _buildTemsNconditionWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 15,
            width: 15,
            child: Transform.scale(
              scale: 0.9,
              child: Checkbox(
                side: MaterialStateBorderSide.resolveWith(
                  (states) =>
                      BorderSide(width: 1.0, color: ThemeClass.orangeColor),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: ThemeClass.orangeColor,
                value: check,
                onChanged: (b) {
                  setState(() {
                    check = !check;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Accept ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  TextSpan(
                      text: 'Terms ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ThemeClass.orangeColor)),
                  const TextSpan(
                      text: '& ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  TextSpan(
                      text: 'Condition',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ThemeClass.orangeColor)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextFieldWithSuffixIcon _buildReferralCodeWidget() {
    return TextFieldWithSuffixIcon(
      textController: _referralCodeController,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.text,
      hintText: 'key_referral_code'.tr,
      iconData: "assets/icons/referral-code-icon.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildDoBWidget(BuildContext context) {
    return TextFieldWithSuffixIcon(
        textController: _dobController,
        isReadOnly: true,
        isObscureText: false,
        hintText: 'key_date_of_birth'.tr,
        iconData: 'assets/icons/icon-calender.png',
        onIconTap: () {
          _selectDate(context);
        });
  }

  Padding _buildRegisterWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: RoundButton(
        buttonLabel: 'key_register'.tr,
        onTap: () {
          if (_formKey.currentState!.validate()) {
            if (check == false) {
              showToast('key_accept_terms_msg'.tr);
              var mapData = <String, dynamic>{};

              mapData['name'] = _nameController.text.trim();
              mapData['email'] = _emailController.text.trim();
              mapData['country_code'] = "+91";
              mapData['phone_number'] = _phoneNumberController.text.trim();
              mapData['password'] = _passwordController.text.trim();
              mapData['gender'] = _radioMF.name.trim();
              mapData['dob'] = _dobController.text.trim();

              userController.signupServices(mapData);
            }
          }
        },
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
    );
  }

  Row _buildAlreadyExistWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'key_already_exists'.tr,
          style: TextStyle(
              fontSize: 16,
              color: ThemeClass.greyColor1,
              fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.loginScreen),
          child: Text(
            'key_login_appbar'.tr,
            style: TextStyle(
                fontSize: 16,
                color: ThemeClass.orangeColor,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  Column _buildGenderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'key_select_gender'.tr,
          style: TextStyle(
              color: ThemeClass.greyColor1,
              fontWeight: FontWeight.w400,
              fontSize: 10),
        ),
        Row(
          children: [
            Radio(
              value: enumForMF.Male,
              activeColor: ThemeClass.orangeColor,
              fillColor: MaterialStateProperty.all(ThemeClass.orangeColor),
              groupValue: _radioMF,
              onChanged: (enumForMF? value) {
                setState(() {
                  _radioMF = value!;
                });
              },
            ),
            Text('key_male'.tr),
            const SizedBox(width: 30),
            Radio(
              value: enumForMF.Female,
              activeColor: ThemeClass.orangeColor,
              fillColor: MaterialStateProperty.all(ThemeClass.orangeColor),
              groupValue: _radioMF,
              onChanged: (enumForMF? value) {
                setState(() {
                  _radioMF = value!;
                });
              },
            ),
            Text('key_female'.tr),
          ],
        )
      ],
    );
  }

  TextFieldWithSuffixIcon _buildFullNameWidget() {
    return TextFieldWithSuffixIcon(
      textController: _nameController,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.text,
      validator: validation!.nameValidation,
      hintText: 'key_full_name'.tr,
      iconData: "assets/icons/icon-user.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildEmailWidget() {
    return TextFieldWithSuffixIcon(
      textController: _emailController,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.emailAddress,
      validator: validation!.emailValidation,
      hintText: 'key_email_address'.tr,
      iconData: "assets/icons/icon-mail.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildPhoneNumberWidget() {
    return TextFieldWithSuffixIcon(
      textController: _phoneNumberController,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.number,
      validator: validation!.phoneNumverValidation,
      hintText: 'key_phone_number'.tr,
      iconData: "assets/icons/icon-phone.png",
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
}
