import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/global/global_enum_class.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';
import 'package:oyo_labs/widgets/textfield/textfield_with_suffix.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  enumForMF _radioMF = enumForMF.Male;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  bool isObs = true;

  toggleObs() {
    setState(() {
      isObs = !isObs;
    });
  }

  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.45,
                padding: const EdgeInsets.symmetric(vertical: 23),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              ContainerWithInnerShadow(
                width: width,
                height: height * 0.8,
                child: Column(
                  children: [
                    Text(
                      "REGISTER",
                      style: TextStyle(
                          color: ThemeClass.orangeColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
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
                          TextFieldWithSuffixIcon(
                              textController: _dobController,
                              isReadOnly: true,
                              isObscureText: false,
                              hintText: 'Date of Birth',
                              iconData: 'assets/icons/icon-calender.png',
                              onIconTap: () {
                                _selectDate(context);
                              }),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 20),
                            child: RoundButton(
                              buttonLabel: 'Register',
                              onTap: () {
                             Get.toNamed(Routes.mobileVerificationScreen, arguments: 'signupScreen');
                              },
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already exists?  ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ThemeClass.greyColor1,
                                    fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.loginScreen),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ThemeClass.orangeColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildGenderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "  Select Gender",
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
            const Text('Male'),
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
            const Text('Female')
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
      validator: (value) {
        if (value!.isEmpty) {
          return GlobalMessages.emptyMessage + 'name';
        }
        if (value.length < 3) {
          return GlobalMessages.nameLengthMessage;
        }
        return null;
      },
      hintText: "Full Name",
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
      validator: (value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = RegExp(pattern.toString());
        if (value!.isEmpty) {
          return GlobalMessages.emptyMessage + 'email address';
        } else if (!regex.hasMatch(value)) {
          return GlobalMessages.pleaseEnterValidEmail;
        }
        return null;
      },
      hintText: "Email address",
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
      validator: (value) {
        if (value!.isEmpty) {
          return GlobalMessages.emptyMessage + 'phone number';
        } else if (value.length != 10) {
          return GlobalMessages.phoneNumberinvalied;
        }
        return null;
      },
      hintText: "Phone Number",
      iconData: "assets/icons/icon-phone.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildPasswordField() {
    return TextFieldWithSuffixIcon(
      textController: _passwordController,
      isReadOnly: false,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return GlobalMessages.emptyMessage + 'password field';
        } else {
          var passwordLength = value.length;
          if (passwordLength < 6) {
            return GlobalMessages.passwordshoudbeatleat;
          }
        }
        return null;
      },
      hintText: "Password",
      iconData: isObs
          ? "assets/icons/icon-password.png"
          : "assets/icons/icon-view-password.png",
      isObscureText: isObs,
      onIconTap: () => toggleObs(),
    );
  }
}
