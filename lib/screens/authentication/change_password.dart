import 'package:flutter/material.dart';

import 'package:oyo_labs/global/validaton.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';

import '../../widgets/textfield/textfield_with_suffix.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _changePassword();
}

class _changePassword extends State<ChangePassword> {
  Validation? validation;

  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      body: SizedBox(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.5,
                  width: width * 0.6,
                  padding: const EdgeInsets.only(top: 100, bottom: 60),
                  child: Image.asset("assets/images/logo.png"),
                ),
                ContainerWithInnerShadow(
                  width: width,
                  height: height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Change Password",
                            style: TextStyle(
                                color: ThemeClass.orangeColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: width * 0.9,
                            child: Text(
                              'Please enter new password for your login account.',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldWithSuffixIcon(
                                  textController: _passController,
                                  isReadOnly: false,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: validation?.validateEmail,
                                  hintText: "Password",
                                  iconData: "assets/icons/icon-password.png",
                                  onIconTap: () {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFieldWithSuffixIcon(
                                  textController: _passController,
                                  isReadOnly: false,
                                  keyboardType: TextInputType.visiblePassword,
                                  //validator: validation!.validateEmail,
                                  hintText: "Confirm Password",
                                  iconData: "assets/icons/icon-password.png",
                                  onIconTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: RoundButton(
                          onTap: () {},
                          buttonLabel: 'Change Password',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
