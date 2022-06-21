import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class PrescriptionDetail extends StatefulWidget {
  const PrescriptionDetail({Key? key}) : super(key: key);

  @override
  State<PrescriptionDetail> createState() => _PrescriptionDetailState();
}

class _PrescriptionDetailState extends State<PrescriptionDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "My Prescription Details"),
        ),
        body: const _buildTestCase(),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          height: 45,
          child: RoundButton(
            onTap: () {
              //Get.toNamed(Routes.bookingSuccessScreen);
            },
            buttonLabel: 'Dawnload Prescription',
          ),
        ),
      ),
    );
  }
}

class _buildTestCase extends StatelessWidget {
  const _buildTestCase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Test Case",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Self Upload',
                    style: TextStyle(
                      fontSize: 10,
                      color: ThemeClass.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                '13 june',
                style: TextStyle(
                  fontSize: 14,
                  color: ThemeClass.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Document',
            style: TextStyle(
              fontSize: 16,
              color: ThemeClass.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            decoration: BoxDecoration(
              color: ThemeClass.whiteColor2,
              border: Border.all(width: 0, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, -3),
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Container(
              color: Colors.amber,
              child: Image.network(
                  "https://pbs.twimg.com/media/EaSfY9gU4AQe1ox.jpg:large"),
            ),
          ),
        ),
      ],
    );
  }
}
