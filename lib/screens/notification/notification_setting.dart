import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool _isPushNotification = true;
  bool _isMessage = false;
  bool _isEmail = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(
            appbarTitle: "Notification",
            elevation: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
          child: Container(
            height: height * 0.18,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 25,
            ),
            decoration: BoxDecoration(
              color: ThemeClass.greyLightColor,
              borderRadius: BorderRadius.circular(25),
            ),
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
                _buildSettingSwitch(
                    settingLabel: "Message",
                    isSelected: _isMessage,
                    onChanged: (val) {
                      setState(() {
                        _isMessage = val;
                      });
                    }),
                _buildSettingSwitch(
                    settingLabel: "Email",
                    isSelected: _isEmail,
                    onChanged: (val) {
                      setState(() {
                        _isEmail = val;
                      });
                    }),
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
