import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/screens/Drawer/Member/services/member_services.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/textfield/textfield_with_suffix.dart';

class AddnewMemberScreen extends StatefulWidget {
  const AddnewMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddnewMemberScreen> createState() => _AddnewMemberScreenState();
}

class _AddnewMemberScreenState extends State<AddnewMemberScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final MembersController _membersController = Get.find<MembersController>();

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

  Validation? validation;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    validation = Validation();
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: 'key_add_member'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildNameField(),
                const SizedBox(height: 15),
                _buildDoBField(context),
                const SizedBox(height: 15),
                _buildEmilField(),
                const SizedBox(height: 15),
                _buildPhoneNumberField(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          height: 45,
          child: RoundButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                EasyLoading.show();
                await _membersController.updateMemberDetail(
                    _nameController.text,
                    _dobController.text,
                    _emailController.text,
                    _phoneNumberController.text);
              }
              EasyLoading.dismiss();
              Get.back();
            },
            buttonLabel: 'key_add_member'.tr,
          ),
        ),
      ),
    );
  }

  TextFieldWithSuffixIcon _buildPhoneNumberField() {
    return TextFieldWithSuffixIcon(
      textController: _phoneNumberController,
      color: ThemeClass.greyLightColor,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.number,
      validator: validation!.phoneNumverValidation,
      hintText: 'key_phone_number'.tr,
      iconData: "assets/icons/icon-phone.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildEmilField() {
    return TextFieldWithSuffixIcon(
      textController: _emailController,
      color: ThemeClass.greyLightColor,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.emailAddress,
      validator: validation!.emailValidation,
      hintText: 'key_email_address'.tr,
      iconData: "assets/icons/icon-mail.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildDoBField(BuildContext context) {
    return TextFieldWithSuffixIcon(
        textController: _dobController,
        isReadOnly: true,
        color: ThemeClass.greyLightColor,
        isObscureText: false,
        hintText: 'key_dob'.tr,
        iconData: 'assets/icons/icon-calender.png',
        onIconTap: () {
          _selectDate(context);
        });
  }

  TextFieldWithSuffixIcon _buildNameField() {
    return TextFieldWithSuffixIcon(
      textController: _nameController,
      isReadOnly: false,
      color: ThemeClass.greyLightColor,
      isObscureText: false,
      keyboardType: TextInputType.text,
      validator: validation!.nameValidation,
      hintText: 'key_name'.tr,
      iconData: "assets/icons/icon-user.png",
      onIconTap: () {},
    );
  }
}
