// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/screens/Drawer/My%20Prescription/prescription_model.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class PrescriptionDetail extends StatefulWidget {
  PrescriptionDetail({Key? key, required this.prescriptionData})
      : super(key: key);

  PrescriptionData? prescriptionData;

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
          child:
              AppbarWithBackButton(appbarTitle: 'key_prescription_details'.tr),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.prescriptionData!.title.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.prescriptionData!.type.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: ThemeClass.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat.MMMd().format(widget.prescriptionData!.date!),
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
                'key_document'.tr,
                style: TextStyle(
                  fontSize: 16,
                  color: ThemeClass.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
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
              child: Column(
                children: [
                  widget.prescriptionData!.prescription!.isEmpty
                      ? const Text("No prescription added!")
                      : widget.prescriptionData!
                          .map((prescriptionList) => Container(
                                padding: const EdgeInsets.only(bottom: 12),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Image.network(
                                  prescriptionList.prescription.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ))
                          .toList(),
                ],
              ),
            )),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          height: 45,
          child: RoundButton(
            onTap: () {
              //Get.toNamed(Routes.bookingSuccessScreen);
            },
            buttonLabel: 'key_download_prescription'.tr,
          ),
        ),
      ),
    );
  }
}
