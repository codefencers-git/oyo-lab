import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:oyo_labs/widgets/textfield/textfield_with_suffix.dart';

class AddnewMember extends StatefulWidget {
  AddnewMember({Key? key}) : super(key: key);

  @override
  State<AddnewMember> createState() => _AddnewMemberState();
}

Validation? validation;

class _AddnewMemberState extends State<AddnewMember> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
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
                // validator: validation!.nameValidation,
                hintText: "Name",
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
                  hintText: 'DOB',
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
                hintText: "Email address",
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
                hintText: "Phone Number",
                iconData: "assets/icons/icon-phone.png",
                onIconTap: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          height: 45,
          child: RoundButton(
            onTap: () {
              //Get.toNamed(Routes.bookingSuccessScreen);
            },
            buttonLabel: 'Add Member',
          ),
        ),
      ),
    );
  }
}
