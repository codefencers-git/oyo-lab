import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/textfield/textfield_with_suffix.dart';

class UpdateNewMemberScreen extends StatefulWidget {
  UpdateNewMemberScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    validation = Validation();
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor2,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "Member"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFieldWithSuffixIcon(
                textController: _nameController,
                isReadOnly: false,
                color: ThemeClass.greyLightColor,
                isObscureText: false,
                keyboardType: TextInputType.text,
                validator: validation!.nameValidation,
                hintText: 'key_name'.tr,
                iconData: "assets/icons/icon-user.png",
                onIconTap: () {},
              ),
              SizedBox(
                height: 15,
              ),
              TextFieldWithSuffixIcon(
                  textController: _dobController,
                  isReadOnly: true,
                  color: ThemeClass.greyLightColor,
                  isObscureText: false,
                  hintText: 'key_dob'.tr,
                  iconData: 'assets/icons/icon-calender.png',
                  onIconTap: () {
                    _selectDate(context);
                  }),
              SizedBox(
                height: 15,
              ),
              TextFieldWithSuffixIcon(
                textController: _emailController,
                color: ThemeClass.greyLightColor,
                isReadOnly: false,
                isObscureText: false,
                keyboardType: TextInputType.emailAddress,
                validator: validation!.emailValidation,
                hintText: 'key_email_address'.tr,
                iconData: "assets/icons/icon-mail.png",
                onIconTap: () {},
              ),
              SizedBox(
                height: 15,
              ),
              TextFieldWithSuffixIcon(
                textController: _phoneNumberController,
                color: ThemeClass.greyLightColor,
                isReadOnly: false,
                isObscureText: false,
                keyboardType: TextInputType.number,
                validator: validation!.phoneNumverValidation,
                hintText: 'key_phone_number.tr',
                iconData: "assets/icons/icon-phone.png",
                onIconTap: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(16),
          height: 50,
          child: Row(
            children: [
              Expanded(
                  child: RoundButton(
                      buttonLabel: 'key_delete_btn'.tr,
                      color: ThemeClass.whiteColor,
                      fontcolor: ThemeClass.orangeColor,
                      fontSize: 16,
                      fontFamily: "poppins",
                      onTap: () {})),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: RoundButton(
                      buttonLabel: 'key_update_btn'.tr,
                      fontSize: 16,
                      fontFamily: "poppins",
                      onTap: () {})),
            ],
          ),
        ),
        // bottomNavigationBar: Container(
        //   margin: const EdgeInsets.all(16),
        //   height: 45,
        //   child: RoundButton(
        //     onTap: () {
        //       //Get.toNamed(Routes.addMemberScreen);
        //     },
        //     buttonLabel: 'Add Member',
        //   ),
        // ),
      ),
    );
  }
}
