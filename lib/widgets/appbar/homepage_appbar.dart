// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/home/google_place_picker/google_place_picker_screen.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/screens/authentication/user_controller.dart';
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
  var _currentAddress = "350001 Ahmedabad";
  final UserController _loginController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeClass.orangeColor,
      toolbarHeight: 70,
      elevation: 0,
      title: Row(
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
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'key_delivered_to_appbar'.tr + " ",
                        style: const TextStyle(
                          color: ThemeClass.whiteColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.address,
                          style: const TextStyle(
                            // overflow: TextOverflow.ellipsis,
                            color: ThemeClass.whiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      //const SizedBox(width: 30, child: Icon(Icons.expand_more)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.loginScreen);
                },
                child: Text(
                  _loginController.islogin.value == true
                      ? ""
                      : 'key_login_appbar'.tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeClass.whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
