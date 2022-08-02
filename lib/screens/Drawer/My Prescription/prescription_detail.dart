// ignore_for_file: must_be_immutable, unnecessary_null_comparison
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

  PrescriptionData prescriptionData;

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
                        widget.prescriptionData.title.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.prescriptionData.type.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          color: ThemeClass.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat.MMMd().format(widget.prescriptionData.date!),
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeClass.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  decoration: BoxDecoration(
                    color: ThemeClass.whiteColor2,
                    border: Border.all(width: 0, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(0, -3),
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...widget.prescriptionData.prescription!
                            .map((e) => _buildPrescriptionList(e))
                            .toList()
                      ],
                    ),
                  )),
            ),
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

  Container _buildPrescriptionList(imagedata) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        children: [
          Image.network(
            imagedata,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
