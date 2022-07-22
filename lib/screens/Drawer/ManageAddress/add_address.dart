import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

enum AddressTypeLabel { home, office, other }

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textaddController = TextEditingController();
  final TextEditingController _textaddController2 = TextEditingController();

  AddressTypeLabel? _addressType = AddressTypeLabel.home;
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
        child: Column(
          children: [
            TextFormField(
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
              controller: _textController,
              validator: (value) {
                if (value == null) {
                  return 'key_full_name'.tr;
                } else if (value.length < 2) {
                  return 'key_name_validation'.tr;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
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
                validator: (value) {
                  if (value == null) {
                    return 'key_address_line-1'.tr;
                  } else if (value.length < 2) {
                    return 'key_address_validation'.tr;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
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
                controller: _textaddController2,
                validator: (value) {
                  if (value == null) {
                    return 'key_address_line-2'.tr;
                  } else if (value.length < 2) {
                    return 'key_address_validation'.tr;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
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
                validator: (value) {
                  if (value == null) {
                    return 'key_address_line-2'.tr;
                  } else if (value.length < 2) {
                    return 'key_address_validation'.tr;
                  }
                },
              ),
            ),
            Row(
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
            )
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
          buttonLabel: 'key_add_address'.tr,
        ),
      ),
    );
  }
}
