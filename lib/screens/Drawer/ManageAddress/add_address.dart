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

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textaddController = TextEditingController();
  final TextEditingController _textaddController2 = TextEditingController();
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
              controller: _textController,
              validator: (value) {
                if (value == null) {
                  return 'key_full_name'.tr;
                } else if (value.length < 2) {
                  return 'key_name_validation'.tr;
                }
              },
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
          buttonLabel: 'key_add_address'.tr,
        ),
      ),
    );
  }
}





// class TestTextFormField extends StatelessWidget {
//   TestTextFormField(
//       {Key? key,
//       required this.lable,
//       required this.validator,
//       required this.keyboardType,
//       required this.controller})
//       : super(key: key);
//   String lable;

//   FormFieldValidator validator;
//   TextInputType keyboardType;
//   TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: const Color(0xffFBFBFB),
//           borderRadius: BorderRadius.circular(25)),
//       child: TextFormField(
//         decoration: InputDecoration(
//           hintText: lable,
//           hintStyle:
//               const TextStyle(color: const Color(0xff5B5B5B), fontSize: 14),
//           border: const OutlineInputBorder(
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }
