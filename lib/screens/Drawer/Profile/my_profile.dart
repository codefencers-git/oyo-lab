import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/screens/Drawer/Profile/profile_services.dart';
import 'package:oyo_labs/themedata.dart';
import '../../../global/global_enum_class.dart';
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
  final profileController = Get.put(ProfileServiceController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    profileController.getprofileData();
    super.initState();
  }
  _onInit(){
    profileController.getprofileData();
  }

  Validation? validation;

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

  final _formKey = GlobalKey<FormState>();

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
      body: Obx(() {
        if (profileController.isloading.value != true) {
          if (profileController.profileData.value.gender.toString()=="Male") {
            _radioMF = enumForMF.Male;
          }
          else{
            _radioMF = enumForMF.Female;
          }
          _phoneNumberController.text =
              profileController.profileData.value.phoneNumber.toString();
          _emailController.text =
              profileController.profileData.value.email.toString();
          _dobController.text=profileController.profileData.value.dob.toString();
          _nameController.text =
              profileController.profileData.value.name.toString();
        }
        return profileController.isloading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 200,
                            width: 150,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(400.0),
                                child: Image(
                                    image: NetworkImage(profileController
                                        .profileData.value.profileImage
                                        .toString()))),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: _buildTextTitle("Full Name")),
                            _buildFullNameWidget(),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: _buildTextTitle("Email Address")),
                            _buildEmailWidget(),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: _buildTextTitle("Phone Number")),
                            _buildPhoneNumberWidget(),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: _buildTextTitle("Select Gender")),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: _buildGenderWidget(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: _buildTextTitle("Date of  Birth")
                            ),
                            _buildDoBWidget(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
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
  _onEdit(){
     Map<String,dynamic> mapdata={
              "name":_nameController.text,
              "email":_emailController.text,
              "country_code":profileController.profileData.value.countryCode.toString(),
              "phone_number":_phoneNumberController.text,
              "gender":_radioMF.toString(),
              "dob":_dobController.text
            };
            try {
              EasyLoading.show();
              profileController.updateProfileData(mapdata, context);
              _onInit();
              EasyLoading.dismiss();
            } catch (e) {
              EasyLoading.dismiss();
              showToast(e.toString());
            }
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
       validator: validation!.nameValidation,

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
       validator: validation!.emailValidation,

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
       validator: validation!.phoneNumverValidation,

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
  TextFieldWithSuffixIcon _buildDoBWidget(BuildContext context) {
    return TextFieldWithSuffixIcon(
        textController: _dobController,
        isReadOnly: true,
        isObscureText: false,
        validator: (val){
          if (val!.isEmpty) {
            return "Enter Date of Birth";
          }
          return null;
        },
        hintText: 'key_date_of_birth'.tr,
        iconData: 'assets/icons/icon-calender.png',
        onIconTap: () {
          _selectDate(context);
        });
  }
}
