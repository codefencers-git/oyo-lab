// ignore_for_file: unused_element, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/Drawer/Profile/profile_model.dart';
import 'package:oyo_labs/screens/Drawer/Profile/profile_services.dart';
import 'package:oyo_labs/screens/authentication/user_controller.dart';
import 'package:oyo_labs/themedata.dart';

class DrawerWidget extends StatelessWidget {
  ProfileModel? profileModel;
  DrawerWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;


  final UserController _userController = Get.find<UserController>();
  final _profileController = Get.find<ProfileServiceController>();
  // final UserPrefService _userPrefController = Get.find<UserPrefService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeClass.whiteColor,
      elevation: 0,
      child: Obx(
        () => _userController.setIsLogin.value == true
            ?
            // profileController.isloading.value
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
            _buildMenuOfUser(context)
            : _buildMenuForLogin(context), 
      ),
    );
  }

  Column _buildMenuOfUser(BuildContext context) {
    return Column(
      children: [
        _buildProfileWidget(onTap: () {
          Get.toNamed(Routes.myProfileScreen);
        }),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.allLabTests);
                },
                tileLabel: 'key_book_lab_lest'.tr,
                tileIconPath: "assets/icons/lab-test-icon.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.checkAppointment);
                },
                tileLabel: 'key_my_appointments'.tr,
                tileIconPath: "assets/icons/appointment-icon.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.myPrescritionSreen);
                },
                tileLabel: 'key_my_prescription'.tr,
                tileIconPath: "assets/icons/icon_prescription.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.myTestReportScreen);
                },
                tileLabel: 'key_my_test_report'.tr,
                tileIconPath: "assets/icons/icon_lab_test_reort.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.addMemberScreen);
                },
                tileLabel: 'key_members'.tr,
                tileIconPath: "assets/icons/icon_members.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.helpAndSupportScreen);
                },
                tileLabel: 'key_help_n_faq'.tr,
                tileIconPath: "assets/icons/help-faq-icon.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.manageAddressScreen);
                },
                tileLabel: 'key_manage_address'.tr,
                tileIconPath: "assets/icons/icon_location.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.settingScreen);
                },
                tileLabel: 'key_settings'.tr,
                tileIconPath: "assets/icons/setting-icon.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.aboutUsScreen);
                },
                tileLabel: 'key_about_us'.tr,
                tileIconPath: "assets/icons/info-icon.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.termsAndPrivacyPolicy);
                },
                tileLabel: 'key_terms_policy'.tr,
                tileIconPath: "assets/icons/icon-terms&policy.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.contactUsScreen);
                },
                tileLabel: 'key_contact_us'.tr,
                tileIconPath: "assets/icons/icon-contactus.png",
              ),
              SizedBox(
                height: 16,
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  // try{

                  // }catch
                  _userController.logout(context);
                },
                tileLabel: 'key_logout'.tr,
                tileIconPath: "assets/icons/logout-icon.png",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _buildMenuForLogin(BuildContext context) {
    return Column(
      children: [
        _buildClickToLoginWidget(onTap: () {
          Get.toNamed(Routes.loginScreen);
        }),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.allLabTests);
                },
                tileLabel: 'key_book_lab_lest'.tr,
                tileIconPath: "assets/icons/lab-test-icon.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {},
                tileLabel: 'key_help_n_faq'.tr,
                tileIconPath: "assets/icons/help-faq-icon.png",
              ),
              // _buildDrawerListTile(
              //   onTileTap: () {
              //     Get.toNamed(Routes.manageAddressScreen);
              //   },
              //   tileLabel: 'key_manage_address'.tr,
              //   tileIconPath: "assets/icons/icon_location.png",
              // ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.settingScreen);
                },
                tileLabel: 'key_settings'.tr,
                tileIconPath: "assets/icons/setting-icon.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.aboutUsScreen);
                },
                tileLabel: 'key_about_us'.tr,
                tileIconPath: "assets/icons/info-icon.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.termsAndPrivacyPolicy);
                },
                tileLabel: 'key_terms_policy'.tr,
                tileIconPath: "assets/icons/icon-terms&policy.png",
              ),
              _buildDrawerListTile(
                onTileTap: () {
                  Get.toNamed(Routes.contactUsScreen);
                },
                tileLabel: 'key_contact_us'.tr,
                tileIconPath: "assets/icons/icon-contactus.png",
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell _buildClickToLoginWidget({
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/profile-picture.png",
                  height: 50,
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Click To",
                        style: TextStyle(
                          color: ThemeClass.orangeColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          color: ThemeClass.orangeColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Divider(
              thickness: 2,
              color: ThemeClass.orangeColor.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildDrawerListTile({
    String tileLabel = "",
    String tileIconPath = "",
    VoidCallback? onTileTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTileTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: SizedBox(
              child: Row(
                children: [
                  Image(
                    image: AssetImage(tileIconPath),
                    height: 35,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      tileLabel,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.darkgreyColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: ThemeClass.blackColor1.withOpacity(0.1),
        ),
      ],
    );
  }

  Widget _buildProfileWidget({
    VoidCallback? onTap,
  }) {
    return Obx(() => InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: _profileController
                          .profileData.value.profileImage
                          .toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      placeholder: (context, url) => CircularProgressIndicator(
                        color: ThemeClass.orangeColor,
                        strokeWidth: 3,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _profileController.profileData.value.name
                                .toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ThemeClass.darkgreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            _profileController.profileData.value.phoneNumber
                                .toString(),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Divider(
                  thickness: 2,
                  color: ThemeClass.orangeColor.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ));
  }
}
