// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/authentication/user_controller.dart';
import 'package:oyo_labs/screens/home/google_place_picker/google_place_picker_screen.dart';
import 'package:oyo_labs/services/user_location_service.dart';
import 'package:oyo_labs/themedata.dart';
import '../../routes.dart';

class HomePageAppBar extends StatefulWidget {
  final String address;
  HomePageAppBar({Key? key, required this.onTap, required this.address})
      : super(key: key);

  VoidCallback onTap;

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  String _currentAddress = "";

  final UserController _userPrefController = Get.find<UserController>();

  final UserLocationController _userLocationController =
      Get.find<UserLocationController>();

  @override
  void initState() {
    super.initState();
    _currentAddress = widget.address;
  }

  @override
  Widget build(BuildContext context) {
    print("-----------" + _userLocationController.currentAddress.value);
    return AppBar(
        backgroundColor: ThemeClass.orangeColor,
        toolbarHeight: 70,
        elevation: 0,
        title: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo_oyo_lab.png',
                      height: 40,
                    ),
                    InkWell(
                      onTap: () async {
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const GooglePlacePickerScreen()),
                        );

                        if (result != null) {
                          setState(() {
                            _currentAddress = result;
                          });
                        }
                      },
                      child: RichText(
                        text: TextSpan(
                            text: 'key_delivered_to_appbar'.tr + " ",
                            style: const TextStyle(
                              color: ThemeClass.whiteColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: _currentAddress != ""
                                    ? _currentAddress
                                    : _userLocationController
                                        .currentAddress.value,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: ThemeClass.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                      ),

                      // Row(
                      //   children: [
                      //     Text(
                      //       'key_delivered_to_appbar'.tr + " ",
                      //       style: const TextStyle(
                      //         color: ThemeClass.whiteColor,
                      //         fontSize: 10,
                      //         fontWeight: FontWeight.w400,
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //         widget.address,
                      //         style: const TextStyle(
                      //           // overflow: TextOverflow.ellipsis,
                      //           color: ThemeClass.whiteColor,
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //     ),
                      //     //const SizedBox(width: 30, child: Icon(Icons.expand_more)),
                      //   ],
                      // ),
                    )
                  ],
                ),
              ),
              Obx(() => Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: _userPrefController.setIsLogin.value == true
                          ? SizedBox()
                          : TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.loginScreen);
                              },
                              child: Text(
                                'key_login_appbar'.tr,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeClass.whiteColor),
                              ),
                            ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
