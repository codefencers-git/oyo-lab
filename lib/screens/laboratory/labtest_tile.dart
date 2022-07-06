// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/home/Homepage%20Model/dashboard_model.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_book_slot.dart';

class AllLabs extends StatelessWidget {
  AllLabs({Key? key, this.labTestData}) : super(key: key);
  Test? labTestData;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: ThemeClass.orangeLightColor,
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: Offset(5, 3),
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              labTestData!.image.toString(),
              width: width / 2.1,
              // height: height / 3,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Text(
              "A002",
              style: TextStyle(fontSize: 8, color: ThemeClass.orangeColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Text(
              labTestData!.title.toString(),
              style: const TextStyle(fontSize: 10),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Text(
              "(Blood Group)",
              style: TextStyle(fontSize: 8, color: ThemeClass.greyColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Text(
              "(W B-ED TA (3ml))",
              style: TextStyle(fontSize: 8, color: ThemeClass.orangeColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: RoundButtonBookSlot(
              onTap: () {
                Get.toNamed(Routes.labTileScreen);
                print("object");
              },
              label: 'Book a Slot',
            ),
          ),
          // comment
        ],
      ),
    );
  }

  _image(String s) {
    return Image.asset(
      s,
      height: 20,
    );
  }
}
