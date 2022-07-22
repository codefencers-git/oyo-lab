import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/Drawer/Member/services/member_services.dart';
import 'package:oyo_labs/screens/Drawer/Member/update_member.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

import 'Model/members_model.dart';

class AddNewMember extends StatefulWidget {
  const AddNewMember({Key? key}) : super(key: key);

  @override
  State<AddNewMember> createState() => _AddNewMemberState();
}

class _AddNewMemberState extends State<AddNewMember> {
  final MembersController _membersController =
      Get.put(MembersController(), permanent: true);

  @override
  void initState() {
    _membersController.getMembersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'key_members'.tr),
      ),
      body: Obx(
        () => (_membersController.isloading.value == false)
            ? _membersController.isError.value == true
                ? Center(
                    child:
                        Text(_membersController.errorMessage.value.toString()),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _membersController.memberData.isNotEmpty
                        ? ListView.builder(
                            itemCount: _membersController.memberData.length,
                            itemBuilder: (context, index) {
                              MemberData? memberData =
                                  _membersController.memberData[index];

                              return _buildMemberListTile(memberData);
                            })
                        : const Center(
                            child: Text("Members not added"),
                          ),
                  )
            : _buildCircularProgressIndicator(height, width),
      ),
      bottomNavigationBar: _buildAddMemberBtn(),
    );
  }

  Container _buildCircularProgressIndicator(double height, double width) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          color: ThemeClass.orangeColor,
        ),
      ),
    );
  }

  Container _buildAddMemberBtn() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 45,
      child: RoundButton(
        onTap: () {
          Get.toNamed(Routes.addNewMembers);
        },
        buttonLabel: 'key_add_new_member'.tr,
      ),
    );
  }

  Column _buildMemberListTile(MemberData? memberData) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Get.to(UpdateNewMemberScreen(
              id: memberData!.id.toString(),
              name: memberData.name.toString(),
              dob: memberData.dob.toString(),
              email: memberData.email.toString(),
              phoneNumber: memberData.phoneNumber.toString(),
            ));
          },
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  memberData!.name.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ThemeClass.blackColor),
                ),
                Image.asset(
                  'assets/icons/icon_3_dots.png',
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}
