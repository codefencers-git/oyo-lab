// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/textfield/textfield_with_suffix.dart';

import 'services/member_services.dart';

class UpdateNewMemberScreen extends StatefulWidget {
  UpdateNewMemberScreen(
      {Key? key,
      required this.id,
      required this.name,
      required this.dob,
      required this.email,
      required this.phoneNumber})
      : super(key: key);

  String id;
  String name;
  String dob;
  String email;
  String phoneNumber;

  @override
  State<UpdateNewMemberScreen> createState() => _UpdateNewMemberScreenState();
}

class _UpdateNewMemberScreenState extends State<UpdateNewMemberScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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

  final MembersController _membersController = Get.find<MembersController>();

  @override
  void initState() {
    _nameController.text = widget.name.toString();
    _dobController.text = widget.dob.toString().substring(0, 10);
    _emailController.text = widget.email.toString();
    _phoneNumberController.text = widget.phoneNumber.toString();

    super.initState();
  }

  void _clearTextField() {
    _nameController.clear();
    _dobController.clear();
    _emailController.clear();
    _phoneNumberController.clear();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    validation = Validation();
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "Member"),
        ),
        body: Obx(
          () => (_membersController.isloading.value == false)
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildNameField(),
                        SizedBox(height: 15),
                        _buildDoBField(context),
                        SizedBox(height: 15),
                        _buildEmailField(),
                        SizedBox(height: 15),
                        _buildPhoneNumberField(),
                      ],
                    ),
                  ),
                )
              : Container(
                  height: height,
                  width: width,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ThemeClass.orangeColor,
                    ),
                  ),
                ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(16),
          height: 50,
          child: Row(
            children: [
              _buildDeleteBtn(),
              SizedBox(width: 10),
              _buildUpdateBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildUpdateBtn() {
    return Expanded(
      child: RoundButton(
        buttonLabel: 'key_update_btn'.tr,
        fontSize: 16,
        fontFamily: "poppins",
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            await _membersController.updateMemberDetail(
                _nameController.text,
                _dobController.text,
                _emailController.text,
                _phoneNumberController.text,
                widget.id);
          }
          _clearTextField();
          Get.back();
        },
      ),
    );
  }

  Expanded _buildDeleteBtn() {
    return Expanded(
      child: RoundButton(
        buttonLabel: 'key_delete_btn'.tr,
        color: ThemeClass.whiteColor,
        fontcolor: ThemeClass.orangeColor,
        fontSize: 16,
        fontFamily: "poppins",
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            await _membersController.deleteMember(widget.id);
          }
          _clearTextField();
          Get.back();
        },
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

  TextFieldWithSuffixIcon _buildEmailField() {
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
