// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/product_detail.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_book_slot.dart';

class AllLabsGridTileWidget extends StatelessWidget {
  AllLabsGridTileWidget({Key? key, required this.labTestData})
      : super(key: key);
  var labTestData;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeClass.orangeLightColor,
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              spreadRadius: 0.0,
              offset: const Offset(2, 0),
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.network(
                  labTestData.image.toString(),
                  width: width / 2.1,
                  // height: height / 3,
                  fit: BoxFit.contain,
                ),
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
                labTestData.title.toString(),
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
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: RoundButtonBookSlot(
                onTap: () {
                  Get.to(LaboratoryDetail(
                    id: labTestData.id.toString(),
                    productTitle: labTestData.title.toString(),
                  ));
                },
                label: 'Book a Slot',
              ),
            ),
            // comment
          ],
        ),
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
