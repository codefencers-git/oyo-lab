import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeClass.whiteColor,
      elevation: 0,
      child: Column(
        children: [
          _buildProfileWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Divider(
              thickness: 2,
              color: ThemeClass.orangeColor.withOpacity(0.1),
            ),
          ),
          _buildDrawerListTile(
            tileLabel: "Book Lab Test",
            tileIconPath: "assets/icons/lab-test-icon.png",
          ),
          _buildDrawerListTile(
            tileLabel: "My Appointments",
            tileIconPath: "assets/icons/appointment-icon.png",
          ),
          _buildDrawerListTile(
            tileLabel: "Notification",
            tileIconPath: "assets/icons/notification-icon.png",
          ),
          _buildDrawerListTile(
            tileLabel: "Help & FAQ's",
            tileIconPath: "assets/icons/help-faq-icon.png",
          ),
          _buildDrawerListTile(
            tileLabel: "Settings",
            tileIconPath: "assets/icons/setting-icon.png",
          ),
          _buildDrawerListTile(
            tileLabel: "About Us",
            tileIconPath: "assets/icons/info-icon.png",
          ),
          _buildDrawerListTile(
            tileLabel: "Terms & Privacy Policy",
            tileIconPath: "assets/icons/info-icon.png",
          ),
          _buildDrawerListTile(
            tileLabel: "Contact Us",
            tileIconPath: "assets/icons/info-icon.png",
          ),
        ],
      ),
    );
  }

  Column _buildDrawerListTile(
      {String tileLabel = "", String tileIconPath = ""}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Row(
            children: [
              Image(
                image: AssetImage(tileIconPath),
                height: 35,
              ),
              const SizedBox(width: 12),
              Text(
                tileLabel,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ThemeClass.darkgreyColor),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: ThemeClass.blackColor1.withOpacity(0.1),
        ),
      ],
    );
  }

  Padding _buildProfileWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: Image.asset("assets/images/profile-picture.png"),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi John",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ThemeClass.darkgreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "+91 98765 43210",
                  style: TextStyle(
                    color: ThemeClass.orangeColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}