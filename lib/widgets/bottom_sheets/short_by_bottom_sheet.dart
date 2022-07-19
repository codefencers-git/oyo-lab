import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/all_lab_test_service.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class ShortByBottomSheet extends StatefulWidget {
  const ShortByBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShortByBottomSheet> createState() => _ShortByBottomSheetState();
}

class _ShortByBottomSheetState extends State<ShortByBottomSheet> {
  late double screebnHeight, screenWidth;
  String? _rmFmSortGroup;

  var _labTestController = Get.find<LabTestController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _rmFmSortGroup = _labTestController.sortingFilter.value.toString();
  }

  @override
  Widget build(BuildContext context) {
    screebnHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 290,
      color: ThemeClass.whiteColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sort by',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeClass.blackColor),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/icons/icon_cross.png',
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Column(
            children: <Widget>[
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: Row(
                  children: [
                    Radio(
                        value: "average",
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ThemeClass.orangeColor),
                        groupValue: _rmFmSortGroup,
                        onChanged: (value) {
                          setState(() {
                            _rmFmSortGroup = value.toString();
                          });
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Average customer rating",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.blackColor),
                    ),
                  ],
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: Row(
                  children: [
                    Radio(
                        value: "low_to_high",
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ThemeClass.orangeColor),
                        groupValue: _rmFmSortGroup,
                        onChanged: (value) {
                          setState(() {
                            _rmFmSortGroup = value.toString();
                          });
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Price : low to high",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.blackColor),
                    ),
                  ],
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                title: Row(
                  children: [
                    Radio(
                        value: "high_to_low",
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ThemeClass.orangeColor),
                        groupValue: _rmFmSortGroup,
                        onChanged: (value) {
                          setState(() {
                            _rmFmSortGroup = value.toString();
                          });
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Price : high to low",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.blackColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: RoundButton(
                  buttonLabel: 'Apply',
                  onTap: () {
                    _labTestController.sortingFilter(_rmFmSortGroup);
                    _labTestController.getLabTestData(true);
                    Get.back();
                  },
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
