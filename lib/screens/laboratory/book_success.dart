import 'package:flutter/material.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment.dart';
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
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "Success"),
        ),
        body: Column(
          children: [
            Image.asset("assets/images/booking_successfull.png"),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          height: 45,
          child: RoundButton(
         
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAppointment()),
              );
            },
            buttonLabel: 'Check Appointment',
          ),
        ),
      ),
    );
  }
}
