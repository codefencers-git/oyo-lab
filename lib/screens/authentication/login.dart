import 'package:flutter/material.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/global/validaton.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/container_with_inner_shadow.dart';

import '../../widgets/textfield/textfield_with_suffix.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Validation? validation;

  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      body: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.6,
                padding: const EdgeInsets.only(top: 100, bottom: 60),
                child: Image.asset("assets/images/logo.png"),
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
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            TextFieldWithSuffixIcon(
                              textController: _emailOrPhoneController,
                              isReadOnly: false,
                              keyboardType: TextInputType.text,
                              validator: validation!.validateEmail,
                              hintText: "Phone Number or Email",
                              iconData: "assets/icons/icon-user.png",
                              onIconTap: () {},
                            ),
                            TextFieldWithSuffixIcon(
                              textController: _passwordController,
                              isReadOnly: false,
                              keyboardType: TextInputType.visiblePassword,
                              validator: validation!.validateEmail,
                              hintText: "Password",
                              iconData: "assets/icons/icon-password.png",
                              onIconTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
