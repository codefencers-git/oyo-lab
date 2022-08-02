// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/reschedule_bottomsheet.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment/appointment_service.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'all lab test/rating/rating_screen.dart';

class DrawerLabTestScreen extends StatefulWidget {
  DrawerLabTestScreen({Key? key, required this.appointmentId})
      : super(key: key);
  String appointmentId;
  @override
  State<DrawerLabTestScreen> createState() => _DrawerLabTestScreenState();
}

class _DrawerLabTestScreenState extends State<DrawerLabTestScreen> {
  final _appointmentServiceController = Get.find<AppointmentHistoryController>();
  @override
  void initState() {
    _appointmentServiceController
        .appointmentHistoryServices(widget.appointmentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'key_lab_test_details'.tr),
      ),
      body: Obx(
        () => (_appointmentServiceController.isloading.value == false)
            ? _appointmentServiceController.isError.value == true
                ? Center(
                    child: Text(_appointmentServiceController.errorMessage.value
                        .toString()),
                  )
                : Column(
                    children: [
                      _buildLabAddressWidget(),
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
                  )
            : Container(
                height: height,
                width: width,
                child: Center(
                  child:
                      CircularProgressIndicator(color: ThemeClass.orangeColor),
                ),
              ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: RoundButton(
                    buttonLabel: 'key_cancel_btn'.tr,
                    color: ThemeClass.whiteColor,
                    fontcolor: ThemeClass.orangeColor,
                    fontSize: 16,
                    fontFamily: "poppins",
                    onTap: () {
                      Get.back();
                    })),
            const SizedBox(width: 10),
            Expanded(
                child: RoundButton(
                    buttonLabel: 'key_reschedule'.tr,
                    fontSize: 16,
                    fontFamily: "poppins",
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return RescheduleBottomSheet(
                           appointmentId: widget.appointmentId,
                          );
                        },
                      );
                    })),
          ],
        ),
      ),
    );
  }

  Stack _buildLabAddressWidget() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset("assets/images/all_laboratories.png"),
        Padding(
          padding: const EdgeInsets.only(right: 18, top: 90, left: 18),
          child: _appointmentServiceController
                      .appointmentDetailData.value.status
                      .toString() ==
                  "Completed"
              ? _buildDownloadNshareRowWidget()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ThemeClass.orangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                        onPressed: () {},
                        child: Text(
                          _appointmentServiceController
                              .appointmentDetailData.value.status
                              .toString(),
                          style: const TextStyle(
                              fontSize: 8,
                              color: ThemeClass.whiteColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        Positioned(
          top: 135,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _appointmentServiceController
                            .appointmentDetailData.value.laboratory
                            .toString(),
                        style: TextStyle(
                            fontSize: 14,
                            color: ThemeClass.blackColor,
                            fontWeight: FontWeight.w500),
                      ),
                      _appointmentServiceController
                                  .appointmentDetailData.value.status
                                  .toString() ==
                              "Completed"
                          ? SizedBox(
                              height: 20,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: ThemeClass.orangeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ).copyWith(
                                    elevation: ButtonStyleButton.allOrNull(0)),
                                onPressed: () {
                                  Get.to(RatingScreen(
                                    itemId: _appointmentServiceController
                                        .appointmentDetailData.value.itemId
                                        .toString(),
                                    orderId: _appointmentServiceController
                                        .appointmentDetailData.value.id
                                        .toString(),
                                  ));
                                },
                                child: Text(
                                  'key_submit_review'.tr,
                                  style: const TextStyle(
                                      fontSize: 8,
                                      color: ThemeClass.whiteColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            RatingBar(
                              initialRating: double.parse(
                                  _appointmentServiceController
                                      .appointmentDetailData.value.rating
                                      .toString()),
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
                            Text(
                              "  ${_appointmentServiceController.appointmentDetailData.value.rating}"
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 8,
                                  color: ThemeClass.redColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "  (${_appointmentServiceController.appointmentDetailData.value.totalRate})"
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 8,
                                  color: ThemeClass.blackColor,
                                  fontWeight: FontWeight.w400),
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
                                "assets/icons/icon_black_location.png",
                                height: 20,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 4),
                                child: Text(
                                  _appointmentServiceController
                                      .appointmentDetailData.value.labAddress
                                      .toString(),
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

  Row _buildDownloadNshareRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ThemeClass.greenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
            onPressed: () {},
            child: Text(
              'key_completed'.tr,
              style: const TextStyle(
                  fontSize: 8,
                  color: ThemeClass.whiteColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ThemeClass.orangeColor),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                onPressed: () {},
                child: Image.asset(
                  "assets/icons/icon_download.png",
                  height: 20,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ThemeClass.orangeColor),
                  shape: MaterialStateProperty.all(CircleBorder()),
                ),
                onPressed: () {},
                child: Image.asset(
                  "assets/icons/icon_share.png",
                  height: 20,
                ),
              ),
            )
          ],
        ),
      ],
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
            "₹${_appointmentServiceController.appointmentDetailData.value.grandTotal.toString()}",
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
            "₹${_appointmentServiceController.appointmentDetailData.value.itemTotal.toString()}",
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
      height: 100,
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
                        Text(
                          _appointmentServiceController
                              .appointmentDetailData.value.testName
                              .toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          _appointmentServiceController
                              .appointmentDetailData.value.testType
                              .toString(),
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
                  "₹${_appointmentServiceController.appointmentDetailData.value.price.toString()}",
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
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(40),
              //   child: Image.network(
              //     _appointmentServiceController
              //         .appointmentDetailData.value.userImage
              //         .toString(),
              //     height: 50,
              //   ),
              // ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _appointmentServiceController
                        .appointmentDetailData.value.userName
                        .toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color: ThemeClass.darkgreyColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "+91 ${_appointmentServiceController.appointmentDetailData.value.userNumber.toString()}",
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
}

_image(String s) {
  return Image.asset(
    s,
    height: 20,
  );
}
