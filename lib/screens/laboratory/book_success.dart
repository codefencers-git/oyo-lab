import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';

import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class BookingSuccess extends StatefulWidget {
  const BookingSuccess({Key? key}) : super(key: key);

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
        child: AppbarWithBackButton(appbarTitle: 'key_success'.tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            child: Image.asset("assets/images/booking_successfull.png"),
          ),
          Text(
            'key_booking_successfull'.tr,
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
              'key_lorem_ipsum_is_simply_dummy_text_of_the_printing_and_typesetting_industry'
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
          buttonLabel: 'key_check_appointment'.tr,
        ),
      ),
    );
  }
}
