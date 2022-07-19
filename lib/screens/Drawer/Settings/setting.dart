import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'package:oyo_labs/themedata.dart';

import '../../../widgets/appbar/appbar_with_back_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isPushNotification = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'key_settings'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: ThemeClass.greyLightColor2,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSettingSwitch(
                    settingLabel: "Push Notification",
                    isSelected: _isPushNotification,
                    onChanged: (val) {
                      setState(() {
                        _isPushNotification = val;
                      });
                    }),
                // _buildSettingSwitch(
                //     settingLabel: "Message",
                //     isSelected: _isMessage,
                //     onChanged: (val) {
                //       setState(() {
                //         _isMessage = val;
                //       });
                //     }),
                // _buildSettingSwitch(
                //     settingLabel: "Email",
                //     isSelected: _isEmail,
                //     onChanged: (val) {
                //       setState(() {
                //         _isEmail = val;
                //       });
                //     }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildSettingSwitch({
    settingLabel,
    isSelected,
    required Null Function(dynamic val) onChanged,
  }) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Text(
          settingLabel,
          style: TextStyle(
            fontSize: 10,
            color: ThemeClass.greyColor1,
            fontWeight: FontWeight.w400,
          ),
        )),
        FlutterSwitch(
          activeColor: ThemeClass.orangeColor,
          inactiveColor: ThemeClass.notificationSettingGrey,
          width: 35.0,
          height: 14.0,
          toggleSize: 15.0,
          value: isSelected,
          borderRadius: 15.0,
          padding: 1.5,
          onToggle: onChanged,
        ),
      ],
    );
  }
}
