import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';

class MyPrescription extends StatefulWidget {
  const MyPrescription({Key? key}) : super(key: key);

  @override
  State<MyPrescription> createState() => _MyPrescriptionState();
}

class _MyPrescriptionState extends State<MyPrescription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: 'key_my_prescription'.tr),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'key_prescriptions'.tr,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged five centuries, but also the leap into electronic.',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ThemeClass.greyColor),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'key_past_7_days'.tr,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildTestCase(),
            const SizedBox(
              height: 15,
            ),
            _buildTestCase(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'key_past_22_days'.tr,
                style: TextStyle(
                  fontSize: 12,
                  color: ThemeClass.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            _buildTestCase(),
          ],
        ),
      ),
    );
  }

  Container _buildTestCase() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeClass.skyblueColor,
        border: Border.all(width: 0, color: Colors.white),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1.5),
            blurRadius: 6,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    "Test Case",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Self Upload',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
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
                          "Delete",
                          style: TextStyle(
                            fontSize: 10,
                            color: ThemeClass.orangeColor,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.prescriptionDetails);
                  print("object");
                },
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'View Prescription',
                        style: TextStyle(
                          fontSize: 14,
                          color: ThemeClass.orangeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Image.asset(
                        'assets/icons/icon_arrow.png',
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '13 june',
                style: TextStyle(
                  fontSize: 12,
                  color: ThemeClass.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
