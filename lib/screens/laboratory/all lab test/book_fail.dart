import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';

import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class BookingFailed extends StatefulWidget {
  const BookingFailed({Key? key}) : super(key: key);

  @override
  State<BookingFailed> createState() => _BookingFailedState();
}

class _BookingFailedState extends State<BookingFailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'Failed'),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/booking_failed.png"),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: 45,
        child: RoundButton(
          onTap: () {
            Get.toNamed(Routes.checkAppointment);
          },
          buttonLabel: 'Book Again',
        ),
      ),
    );
  }
}
