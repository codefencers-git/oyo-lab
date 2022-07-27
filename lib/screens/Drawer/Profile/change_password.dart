import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../global/global_messages.dart';
import '../../../routes.dart';
import '../../../services/validation_services.dart';
import '../../../themedata.dart';
import '../../../widgets/appbar/appbar_with_back_button.dart';
import '../../../widgets/buttons/round_button.dart';
import '../../../widgets/textfield/textfield_with_suffix.dart';
import '../../authentication/Change Password/change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());
  Validation? validation = Validation();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _oldObs = true;
  bool _newObs = true;
  bool _confObs = true;
  _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show();
      var mapData = <String, dynamic>{};

      mapData['current_password'] = _oldPasswordController.text.trim();
      mapData['new_password'] = _newPasswordController.text.trim();
      mapData['confirm_password'] = _confirmPasswordController.text.trim();

      try {
        await changePasswordController.changePasswordService(mapData);
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
          appbarTitle: 'key_change_password'.tr,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
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
              _buildTextFieldWithoutIcon(_oldPasswordController,
                  (val) => validation!.passwordValidation(val), _oldObs, () {
                setState(() {
                  _oldObs = !_oldObs;
                });
              }),
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
              _buildTextFieldWithoutIcon(_newPasswordController,
                  (val) => validation?.passwordValidation(val), _newObs, () {
                setState(() {
                  _newObs = !_newObs;
                });
              }),
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
                  _confirmPasswordController,
                  (value) {
                    if (value!.isEmpty) {
                      return GlobalMessages.emptyMessage + 'password field';
                    } else if (value.length < 6) {
                      return GlobalMessages.passwordshoudbeatleat;
                    } else if (value != _newPasswordController.text) {
                      return GlobalMessages.incorrectConfirmPassword;
                    }
                    return null;
                  },
                  _confObs,
                  () {
                    setState(() {
                      _confObs = !_confObs;
                    });
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 45,
        child: RoundButton(
          onTap: _onSubmit,
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
      String? Function(String?)? validator,
      bool isobs,
      void Function() onIconTap) {
    return TextFieldWithSuffixIcon(
      textController: _passwordController,
      isReadOnly: false,
      keyboardType: TextInputType.visiblePassword,
      validator: validator!,
      hintText: 'key_password'.tr,
      iconData: isobs
          ? "assets/icons/icon-password.png"
          : "assets/icons/icon-view-password.png",
      isObscureText: isobs,
      onIconTap: onIconTap,
    );
  }
}
