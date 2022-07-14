import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/reschedule_bottomsheet.dart';

import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

import '../../../routes.dart';

class LabtestDetail extends StatefulWidget {
  const LabtestDetail({Key? key}) : super(key: key);

  @override
  State<LabtestDetail> createState() => _LabtestDetailState();
}

class _LabtestDetailState extends State<LabtestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'key_lab_test_details'.tr),
      ),
      body: Column(
        children: [
          _buildLabDetailWidget(),
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              _buildPatientDetailTile(),
              _buildPatientDetail(),
              const SizedBox(
                height: 10,
              ),
              _buildTestDetail(),
              const SizedBox(
                height: 10,
              ),
              _buildItemTotalWidget(),
              Divider(
                indent: 10,
                endIndent: 10,
                color: ThemeClass.greyColor1,
              ),
              _buildPayableAmountWidget(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 45,
        child: RoundButton(
          onTap: () {
            Get.toNamed(Routes.bookingSuccessScreen);
          },
          buttonLabel: 'Confirm'.tr,
        ),
      ),
    );
  }

  Padding _buildPayableAmountWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'key_payable_amount'.tr,
            style: TextStyle(
                fontSize: 10,
                color: ThemeClass.blackColor1,
                fontWeight: FontWeight.w400),
          ),
          Text(
            "₹240.00",
            style: TextStyle(
                fontSize: 10,
                color: ThemeClass.blackColor1,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Padding _buildItemTotalWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'key_item_total_mrp'.tr,
            style: TextStyle(
                fontSize: 10,
                color: ThemeClass.greyColor1,
                fontWeight: FontWeight.w400),
          ),
          Text(
            "₹240.00",
            style: TextStyle(
                fontSize: 10,
                color: ThemeClass.greyColor1,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Container _buildTestDetail() {
    return Container(
      height: 150,
      color: ThemeClass.skyblueColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'key_test_details'.tr,
              style: TextStyle(
                  fontSize: 14,
                  color: ThemeClass.darkgreyColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/icon_lab.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ABO Group & RH Type",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "W B-ED TA (3ml)",
                          style: TextStyle(
                              fontSize: 12,
                              color: ThemeClass.greyColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "₹120.00",
                  style: TextStyle(
                      fontSize: 16,
                      color: ThemeClass.orangeColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Divider(
              thickness: 0.2,
              indent: 2,
              endIndent: 2,
              color: ThemeClass.greyColor2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/icon_lab.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ABO Group & RH Type",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "W B-ED TA (3ml)",
                          style: TextStyle(
                              fontSize: 12,
                              color: ThemeClass.greyColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "₹120.00",
                  style: TextStyle(
                      fontSize: 16,
                      color: ThemeClass.orangeColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildPatientDetail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/images/lab_detail_johndoe.png"),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Doe",
                    style: TextStyle(
                        fontSize: 14,
                        color: ThemeClass.darkgreyColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "+91 98765 43210",
                    style: TextStyle(
                        fontSize: 10,
                        color: ThemeClass.orangeColor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildPatientDetailTile() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: [
          Text(
            'key_patient_details'.tr,
            style: TextStyle(
                fontSize: 14,
                color: ThemeClass.blackColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Stack _buildLabDetailWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset("assets/images/all_laboratories.png"),
        Padding(
          padding: const EdgeInsets.only(right: 18, top: 90, left: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
                // child: ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: ThemeClass.orangeColor,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(25),
                //     ),
                //   ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                //   onPressed: () {},
                //   child: Text(
                //     'key_pending'.tr,
                //     style: const TextStyle(
                //         fontSize: 8,
                //         color: ThemeClass.whiteColor,
                //         fontWeight: FontWeight.w500),
                //   ),
                // ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                    // child: ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     primary: ThemeClass.orangeColor,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(25),
                    //     ),
                    //   ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                    //   onPressed: () {
                    //     Get.toNamed(Routes.ratingScreen);
                    //   },
                    //   child: Text(
                    //     'key_submit_review'.tr,
                    //     style: const TextStyle(
                    //         fontSize: 8,
                    //         color: ThemeClass.whiteColor,
                    //         fontWeight: FontWeight.w500),
                    //   ),
                    // ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 129,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: ThemeClass.skyblueColor,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Green Cross Laboratory",
                    style: TextStyle(
                        fontSize: 14,
                        color: ThemeClass.blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            RatingBar(
                              initialRating: 3,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 16,
                              itemCount: 5,
                              ignoreGestures: true,
                              ratingWidget: RatingWidget(
                                full: _image('assets/images/full_star.png'),
                                half: _image('assets/images/half_star.png'),
                                empty: _image('assets/images/blank_star.png'),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0.7),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                '4.0',
                                style: TextStyle(
                                    fontSize: 8,
                                    color: ThemeClass.redColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                '(120)',
                                style: TextStyle(
                                    fontSize: 8,
                                    color: ThemeClass.blackColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, top: 5),
                              child: Image.asset(
                                  "assets/icons/icon_black_location.png"),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 4),
                                child: Text(
                                  '45, Park Avenue, Near Sal Hospital, Thaltej, Ahmedabad.',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ThemeClass.greyColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

_image(String s) {
  return Image.asset(
    s,
    height: 20,
  );
}
