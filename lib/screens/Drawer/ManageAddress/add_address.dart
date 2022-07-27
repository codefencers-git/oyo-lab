// ignore_for_file: must_be_immutable, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/Drawer/ManageAddress/services%20and%20model/address_services.dart';
import 'package:oyo_labs/services/validation_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'services and model/address_model.dart';

class AddAddress extends StatefulWidget {
  AddAddress({
    Key? key,
    this.isEdit = false,
    this.addressData,
  }) : super(key: key);

  bool isEdit;
  AddrressData? addressData;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

final _formKey = GlobalKey<FormState>();

enum AddressTypeLabel { Home, Office, Other }

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _textaddController = TextEditingController();
  final TextEditingController _textaddController2 = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  final AddressServicesController _addressController =
      Get.find<AddressServicesController>();

  AddressTypeLabel? _addressType = AddressTypeLabel.Home;
  String type = "Home";

  Validation? validation;

  @override
  void initState() {
    if (widget.isEdit) {
      _getDataToEdit();
    }
    super.initState();
  }

  void _getDataToEdit() {
    var type = widget.addressData!.addressType.toString();
    setState(() {
      _addressType = type == "Home"
          ? AddressTypeLabel.Home
          : type == "Office"
              ? AddressTypeLabel.Office
              : AddressTypeLabel.Other;
      _nameController.text = widget.addressData!.name.toString();
      _textaddController.text = widget.addressData!.addressLine1.toString();
      _textaddController2.text = widget.addressData!.addressLine2.toString();
      _pincodeController.text = widget.addressData!.pincode.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    validation = Validation();
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor2,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
            appbarTitle:
                widget.isEdit ? 'key_edit_address'.tr : 'key_add_address'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildNameField(),
                const SizedBox(height: 20),
                _buildAddress1Field(),
                const SizedBox(height: 20),
                _buildAddress2Field(),
                const SizedBox(height: 20),
                _buildPincodeField(),
                _buildAddressTypeRadio(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: widget.isEdit
          ? Container(
              margin: const EdgeInsets.all(16),
              height: 50,
              child: Row(
                children: [
                  _buildDeleteBtn(),
                  const SizedBox(width: 10),
                  _buildUpdateBtn(),
                ],
              ),
            )
          : _buildButton(),
    );
  }

  Expanded _buildUpdateBtn() {
    return Expanded(
      child: RoundButton(
        buttonLabel: 'key_update_btn'.tr,
        fontSize: 16,
        fontFamily: "poppins",
        onTap: () async {
          EasyLoading.show();
          if (_formKey.currentState!.validate()) {
            var mapData = <String, dynamic>{};
            mapData['address_id'] = widget.addressData!.id;
            mapData['name'] = _nameController.text.trim();
            mapData['address_line_1'] = _textaddController.text.trim();
            mapData['address_line_2'] = _textaddController2.text.trim();
            mapData['pincode'] = _pincodeController.text.trim();
            mapData['address_type'] = _addressType!.name;

            try {
              await _addressController.saveAddress(mapData);
            } catch (e) {
              debugPrint(e.toString());
            }
          }
          EasyLoading.dismiss();
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
          EasyLoading.show();
          if (_formKey.currentState!.validate()) {
            await _addressController
                .deleteAddress(widget.addressData!.id.toString());
          }
          EasyLoading.dismiss();
        },
      ),
    );
  }

  Container _buildButton() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 45,
      child: RoundButton(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            var mapData = <String, dynamic>{};
            mapData['name'] = _nameController.text.trim();
            mapData['address_line_1'] = _textaddController.text.trim();
            mapData['address_line_2'] = _textaddController2.text.trim();
            mapData['pincode'] = _pincodeController.text.trim();
            mapData['address_type'] = _addressType!.name;

            try {
              _addressController.saveAddress(mapData);
            } catch (e) {
              debugPrint(e.toString());
            }
          }
        },
        buttonLabel: 'key_add_address'.tr,
      ),
    );
  }

  Row _buildAddressTypeRadio() {
    return Row(
      children: [
        Radio(
          value: AddressTypeLabel.Home,
          activeColor: ThemeClass.orangeColor,
          groupValue: _addressType,
          onChanged: (AddressTypeLabel? value) {
            setState(
              () {
                _addressType = value;
                type = "Home";
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
          value: AddressTypeLabel.Office,
          activeColor: ThemeClass.orangeColor,
          groupValue: _addressType,
          onChanged: (AddressTypeLabel? value) {
            setState(
              () {
                _addressType = value;
                type = "Office";
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
          value: AddressTypeLabel.Other,
          activeColor: ThemeClass.orangeColor,
          groupValue: _addressType,
          onChanged: (AddressTypeLabel? value) {
            setState(
              () {
                _addressType = value;
                type = "Other";
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

  TextFormField _buildPincodeField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      maxLength: 6,
      decoration: InputDecoration(
        hintText: 'pincode'.tr,
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
        counterText: "",
      ),
      controller: _pincodeController,
      validator: validation!.pincodeValidation,
    );
  }

  SizedBox _buildAddress2Field() {
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
        controller: _textaddController2,
        validator: validation!.address2Validation,
      ),
    );
  }

  SizedBox _buildAddress1Field() {
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
        controller: _textaddController,
        validator: validation!.addressValidation,
      ),
    );
  }

  TextFormField _buildNameField() {
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
      controller: _nameController,
      validator: validation!.nameValidation,
    );
  }
}
