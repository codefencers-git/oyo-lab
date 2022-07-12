import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/appbar/appbar_with_back_button.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
          appbarTitle: 'Profile Detail'.tr,
          // isShowSearch: isShowSearch,
          onIconPress: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
