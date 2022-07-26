import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_enum_class.dart';
import 'package:oyo_labs/screens/Drawer/ManageAddress/services%20and%20model/address_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _addressTextController2 = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  AddressTypeLabel? _addressType = AddressTypeLabel.home;

  final AddressServicesController _addressController =
      Get.find<AddressServicesController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor2,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'key_manage_address'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildNameTextBox(),
                SizedBox(
                  height: 20,
                ),
                _buildTextBoxAddressLine1(),
                const SizedBox(
                  height: 20,
                ),
                _buildTextBoxAddressLine2(),
                const SizedBox(
                  height: 20,
                ),
                _buildPincode(),
                _buildRadioButton()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 45,
        child: RoundButton(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              await _addressController.addAddress(
                  name: _nameTextController.text,
                  address1: _addressTextController.text,
                  address2: _addressTextController2.text,
                  addressType: _addressType!.name.toString(),
                  pincode: _pinCodeController.text);
            }
          },
          buttonLabel: 'key_add_address'.tr,
        ),
      ),
    );
  }

  Row _buildRadioButton() {
    return Row(
      children: [
        Radio(
          value: AddressTypeLabel.home,
          activeColor: ThemeClass.orangeColor,
          groupValue: _addressType,
          onChanged: (AddressTypeLabel? value) {
            setState(
              () {
                _addressType = value;
              },
            );
            print(_addressType);
          },
        ),
        Text(
          'key_home'.tr,
          style: TextStyle(
              color: ThemeClass.blackColor1,
              fontSize: 12,
              fontWeight: FontWeight.w700),
        ),
        Radio(
          value: AddressTypeLabel.office,
          activeColor: ThemeClass.orangeColor,
          groupValue: _addressType,
          onChanged: (AddressTypeLabel? value) {
            setState(
              () {
                _addressType = value;
              },
            );
            print(_addressType);
          },
        ),
        Text(
          'key_office'.tr,
          style: TextStyle(
              color: ThemeClass.blackColor1,
              fontSize: 12,
              fontWeight: FontWeight.w700),
        ),
        Radio(
          value: AddressTypeLabel.other,
          activeColor: ThemeClass.orangeColor,
          groupValue: _addressType,
          onChanged: (AddressTypeLabel? value) {
            setState(
              () {
                _addressType = value;
              },
            );
            print(_addressType);
          },
        ),
        Text(
          'key_other'.tr,
          style: TextStyle(
              color: ThemeClass.blackColor1,
              fontSize: 12,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  TextFormField _buildNameTextBox() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'key_name'.tr,
        hintStyle: TextStyle(
          fontSize: 12,
          color: ThemeClass.greyColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.0),
        ),
        filled: true,
      ),
      controller: _nameTextController,
      validator: (value) {
        if (value == null) {
          return 'key_full_name'.tr;
        } else if (value.length < 2) {
          return 'key_name_validation'.tr;
        }
      },
    );
  }

  TextFormField _buildPincode() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: 'key_pincode'.tr,
        hintStyle: TextStyle(
          fontSize: 12,
          color: ThemeClass.greyColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.0),
        ),
        filled: true,
      ),
      controller: _pinCodeController,
      validator: (value) {
        if (value == null) {
          return 'key_pincode_validation'.tr;
        } else if (value.length != 6) {
          return 'key_pincode_validation'.tr;
        }
      },
    );
  }

  SizedBox _buildTextBoxAddressLine1() {
    return SizedBox(
      height: 100,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 6,
        decoration: InputDecoration(
          hintText: 'key_address_line-1'.tr,
          hintStyle: TextStyle(
            fontSize: 12,
            color: ThemeClass.greyColor,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25.0),
          ),
          filled: true,
        ),
        controller: _addressTextController,
        validator: (value) {
          if (value == null) {
            return 'key_address_line-1'.tr;
          } else if (value.length < 2) {
            return 'key_address_validation'.tr;
          }
        },
      ),
    );
  }

  SizedBox _buildTextBoxAddressLine2() {
    return SizedBox(
      height: 100,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 6,
        decoration: InputDecoration(
          hintText: 'key_address_line-2'.tr,
          hintStyle: TextStyle(
            fontSize: 12,
            color: ThemeClass.greyColor,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25.0),
          ),
          filled: true,
        ),
        controller: _addressTextController2,
        validator: (value) {
          if (value == null) {
            return 'key_address_line-2'.tr;
          } else if (value.length < 2) {
            return 'key_address_validation'.tr;
          }
        },
      ),
    );
  }
}
