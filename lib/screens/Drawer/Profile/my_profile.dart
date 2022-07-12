import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';

import '../../../global/global_enum_class.dart';
import '../../../routes.dart';
import '../../../services/validation_services.dart';
import '../../../widgets/appbar/appbar_with_back_button.dart';
import '../../../widgets/buttons/round_button.dart';
import '../../../widgets/textfield/textfield_with_suffix.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  enumForMF _radioMF = enumForMF.Male;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  //Validation? validation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
          appbarTitle: 'Profile Detail'.tr,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(400.0),
                      child: const Image(
                          image:
                              AssetImage('assets/images/profile_image.png'))),
                ),
                Positioned(
                  top: 135,
                  right: 7,
                  left: 98,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: ThemeClass.orangeColor,
                            shape: BoxShape.circle),
                        height: 35,
                        child: Image.asset(
                          'assets/icons/icon_white_camera.png',
                          scale: 3,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ThemeClass.orangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return const SizedBox();
                    },
                  );
                },
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                      fontSize: 10,
                      color: ThemeClass.whiteColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildTextTitle("Full Name")),
                  _buildFullNameWidget(),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildTextTitle("Email Address")),
                  _buildEmailWidget(),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildTextTitle("Phone Number")),
                  _buildPhoneNumberWidget(),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildTextTitle("Select Gender")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _buildGenderWidget(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 44,
        child: RoundButton(
          onTap: () {
            // Get.toNamed(Routes.bookingSuccessScreen);
          },
          buttonLabel: 'Edit Profile',
        ),
      ),
    );
  }

  Padding _buildTextTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 15, left: 15),
      child: Text(
        title,
        style: TextStyle(fontSize: 10, color: ThemeClass.greyColor1),
      ),
    );
  }

  TextFieldWithSuffixIcon _buildFullNameWidget() {
    return TextFieldWithSuffixIcon(
      textController: _nameController,
      color: ThemeClass.greyLightColor,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.text,
      // validator: validation!.nameValidation,
      hintText: 'John Doe',
      iconData: "assets/icons/icon-user.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildEmailWidget() {
    return TextFieldWithSuffixIcon(
      textController: _emailController,
      color: ThemeClass.greyLightColor,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.emailAddress,
      // validator: validation!.emailValidation,
      hintText: 'johndoe@gmail.com',
      iconData: "assets/icons/icon-mail.png",
      onIconTap: () {},
    );
  }

  TextFieldWithSuffixIcon _buildPhoneNumberWidget() {
    return TextFieldWithSuffixIcon(
      textController: _phoneNumberController,
      color: ThemeClass.greyLightColor,
      isReadOnly: false,
      isObscureText: false,
      keyboardType: TextInputType.number,
      // validator: validation!.phoneNumverValidation,
      hintText: '9876543210',
      iconData: "assets/icons/icon-phone.png",
      onIconTap: () {},
    );
  }

  Column _buildGenderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
}
