import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/Drawer/Member/services/member_services.dart';

import '../../../../themedata.dart';
import '../../../../widgets/appbar/appbar_with_back_button.dart';
import '../Model/members_model.dart';
import '../update_member.dart';

class SelectMemberScreen extends StatefulWidget {
  const SelectMemberScreen({Key? key}) : super(key: key);

  @override
  State<SelectMemberScreen> createState() => _SelectMemberScreenState();
}

class _SelectMemberScreenState extends State<SelectMemberScreen> {
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

  Column _buildMemberListTile(MemberData? memberData) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, memberData!.id.toString());
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
