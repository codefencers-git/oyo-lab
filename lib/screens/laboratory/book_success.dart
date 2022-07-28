// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/home/home_page.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class BookingSuccess extends StatefulWidget {
  BookingSuccess({Key? key, required this.isPaymentDone}) : super(key: key);
  bool isPaymentDone;
  @override
  State<BookingSuccess> createState() => _BookingSuccessState();
}

class _BookingSuccessState extends State<BookingSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
            onbackPress: () {
              Get.offAll(HomePage());
            },
            appbarTitle:
                widget.isPaymentDone ? 'key_success'.tr : 'key_failed'.tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            child: Image.asset(widget.isPaymentDone
                ? "assets/images/booking_successfull.png"
                : "assets/images/booking_failed.png"),
          ),
          Text(
            widget.isPaymentDone
                ? 'key_booking_successfull'.tr
                : 'key_booking_unsuccessfull'.tr,
            style: TextStyle(
                fontSize: 24,
                color: ThemeClass.greenColor,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.isPaymentDone
                  ? 'key_lorem_ipsum_is_simply_dummy_text_of_the_printing_and_typesetting_industry'
                      .tr
                  : 'key_lorem_ipsum_is_simply_dummy_text_of_the_printing_and_typesetting_industry'
                      .tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: ThemeClass.greyColor1,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 45,
        child: RoundButton(
          onTap: () {
            Get.toNamed(Routes.checkAppointment);
          },
          buttonLabel: widget.isPaymentDone
              ? 'key_check_appointment'.tr
              : 'key_book_again'.tr,
        ),
      ),
    );
  }
}
