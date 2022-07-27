// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/screens/Drawer/Profile/profile_services.dart';
import 'package:oyo_labs/screens/laboratory/book_success.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import '../booking model and services/book_appointment_services.dart';
import '../booking model and services/web_view_payment_screen.dart';

class LabtestDetail extends StatefulWidget {
  LabtestDetail({
    Key? key,
    this.date,
    this.time,
    this.prescription,
    this.bookingFor,
    this.memberId,
    this.remarks,
  }) : super(key: key);

  String? date;
  String? time;
  List<XFile>? prescription;
  String? bookingFor;
  String? memberId;
  String? remarks;

  @override
  State<LabtestDetail> createState() => _LabtestDetailState();
}

class _LabtestDetailState extends State<LabtestDetail> {
  final _bookAppointmentController =
      Get.find<BookAppointmentServicesController>();

  final _profileController = Get.put(ProfileServiceController());

  @override
  void initState() {
    _profileController.getprofileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
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
            var mapData = <String, dynamic>{};
            mapData['test_id'] =
                _bookAppointmentController.testDetails.value.id.toString();
            mapData['laboratory'] =
                _bookAppointmentController.labData.value.id.toString();
            mapData['date'] = widget.date;
            mapData['time'] = widget.time;
            mapData['booking_for'] = widget.bookingFor;
            mapData['member_id'] =
                widget.memberId == null ? "" : widget.memberId.toString();
            mapData['remarks'] =
                widget.remarks == null ? "" : widget.remarks.toString();
            mapData['contact_number'] =
                _profileController.profileData.value.phoneNumber.toString();
                
            _checkOut(mapData);
          },
          buttonLabel: 'Confirm'.tr,
        ),
      ),
    );
  }

  _checkOut(mapData) async {
    try {
      EasyLoading.show();

      await _bookAppointmentController.bookAppointmentService(
          mapData, widget.prescription);

      String paymentUrl =
          _bookAppointmentController.paymentUrl.value.paymentUrl.toString();

      print("-----------------------$paymentUrl");
      EasyLoading.dismiss();
      var res = await Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute<bool>(
          builder: (BuildContext context) => WebViewScreen(url: paymentUrl),
        ),
      );
      if (res == true) {
        showToast("Payment Successfully Done.");

        Get.offAll(BookingSuccess(isPaymentDone: true));
      } else {
        showToast("Payment Not Done.");
        Get.offAll(BookingSuccess(isPaymentDone: false));
      }
    } catch (e) {
      showToast(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
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
            "₹ ${_bookAppointmentController.testDetails.value.price}",
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
            "₹ ${_bookAppointmentController.testDetails.value.price}",
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
                          _bookAppointmentController.testDetails.value.title
                              .toString(),
                          style: const TextStyle(
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
                  "₹ ${_bookAppointmentController.testDetails.value.price}",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  _profileController.profileData.value.profileImage.toString(),
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _profileController.profileData.value.name.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color: ThemeClass.darkgreyColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "+91 ${_profileController.profileData.value.phoneNumber}",
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
              const SizedBox(
                height: 20,
              ),
              Column(
                children: const [
                  SizedBox(height: 20),
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
                    _bookAppointmentController.labData.value.name.toString(),
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
                                  _bookAppointmentController.labData.value.area
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
}

_image(String s) {
  return Image.asset(
    s,
    height: 20,
  );
}
