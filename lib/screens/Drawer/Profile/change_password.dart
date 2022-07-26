import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes.dart';
import '../../../services/validation_services.dart';
import '../../../themedata.dart';
import '../../../widgets/appbar/appbar_with_back_button.dart';
import '../../../widgets/buttons/round_button.dart';
import '../../../widgets/textfield/textfield_with_suffix.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    bool _isObs = true;
    toggleObs() {
      setState(() {
        _isObs = !_isObs;
      });
    }

    Validation? validation = Validation();
    final TextEditingController _oldPasswordController =
        TextEditingController();
    final TextEditingController _newPasswordController =
        TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
          appbarTitle: 'key_change_password'.tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: _buildText('Old Password'),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildTextFieldWithoutIcon(
                _oldPasswordController, validation, _isObs, toggleObs),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: _buildText('New Password'),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildTextFieldWithoutIcon(
                _newPasswordController, validation, _isObs, toggleObs),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: _buildText('Confirm Password'),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildTextFieldWithoutIcon(
                _confirmPasswordController, validation, _isObs, toggleObs),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 45,
        child: RoundButton(
          onTap: () {
            Get.toNamed(Routes.myProfileScreen);
          },
          buttonLabel: 'key_change_password'.tr,
        ),
      ),
    );
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 10,
          color: ThemeClass.greyColor1,
          fontWeight: FontWeight.w400),
    );
  }

  TextFieldWithSuffixIcon _buildTextFieldWithoutIcon(
      TextEditingController _passwordController,
      Validation validation,
      bool _isObs,
      Null toggleObs()) {
    return TextFieldWithSuffixIcon(
      textController: _passwordController,
      isReadOnly: false,
      keyboardType: TextInputType.visiblePassword,
      validator: validation.passwordValidation,
      hintText: 'key_password'.tr,
      iconData: _isObs
          ? "assets/icons/icon-password.png"
          : "assets/icons/icon-view-password.png",
      isObscureText: _isObs,
      onIconTap: () => toggleObs(),
    );
  }
}
