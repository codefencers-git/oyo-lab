import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({Key? key}) : super(key: key);

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "My Test Report"),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: _buildManageAdd(),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          height: 45,
          child: RoundButton(
            onTap: () {
              Get.toNamed(Routes.addNewAddressScreen);
            },
            buttonLabel: 'Add New Address',
          ),
        ),
      ),
    );
  }

  Column _buildManageAdd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/icons/icon_manage_add_home.png",
              height: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '103, Audiah Nagar, B\H SBI Bank, Nr. Rukmani School, MG Road, Ahmedabad, Gujarat - 000000.',
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            DropdownButton(
                underline: SizedBox(),
                icon: Image.asset(
                  'assets/icons/icon_3_dots.png',
                  height: 20,
                ),
                elevation: 50,
                dropdownColor: Colors.transparent,
                items: [
                  DropdownMenuItem(
                    enabled: false,
                    alignment: Alignment.centerLeft,
                    value: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(
                              5,
                              2,
                            ),
                            blurRadius: 6,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),

                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      // margin: const EdgeInsets.only(right: 10),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 12,
                          color: ThemeClass.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
                onChanged: (val) {}),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(),
        Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/icons/icon_building.png",
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '103, Audiah Nagar, B\H SBI Bank, Nr. Rukmani School, MG Road, Ahmedabad, Gujarat - 000000.',
                        //overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                DropdownButton(
                    underline: SizedBox(),
                    icon: Image.asset(
                      'assets/icons/icon_3_dots.png',
                      height: 20,
                    ),
                    elevation: 50,
                    dropdownColor: Colors.transparent,
                    items: [
                      DropdownMenuItem(
                        enabled: false,
                        alignment: Alignment.centerLeft,
                        value: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(
                                  5,
                                  2,
                                ),
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),

                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          // margin: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: 12,
                              color: ThemeClass.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                    onChanged: (val) {}),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/icon_manage_add_home.png",
                      height: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '103, Audiah Nagar, B\H SBI Bank, Nr. Rukmani School, MG Road, Ahmedabad, Gujarat - 000000.',
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownButton(
                        underline: SizedBox(),
                        icon: Image.asset(
                          'assets/icons/icon_3_dots.png',
                          height: 20,
                        ),
                        elevation: 50,
                        dropdownColor: Colors.transparent,
                        items: [
                          DropdownMenuItem(
                            enabled: false,
                            alignment: Alignment.centerLeft,
                            value: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 0, color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(
                                      5,
                                      2,
                                    ),
                                    blurRadius: 6,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(5),
                              ),

                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              // margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ThemeClass.blackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (val) {}),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
              ],
            )
          ],
        ),
      ],
    );
  }
}
