import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/lab_test_detail.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/lab_test_detail_model.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import '../../../themedata.dart';

class MemberSelectionBottomSheet extends StatefulWidget {
  MemberSelectionBottomSheet({
    Key? key,
    this.testData,
    this.laboratoryData,
    this.date,
    this.time,
    this.prescription,
    this.memberId,
    this.remarks,
    this.testPrice,
  }) : super(key: key);

  LAbTestDetailData? testData;
  RecommendedProduct? laboratoryData;
  String? date;
  String? time;
  List<XFile>? prescription;
  String? memberId;
  String? remarks;

  String? testPrice;

  @override
  State<MemberSelectionBottomSheet> createState() =>
      _MemberSelectionBottomSheetState();
}

class _MemberSelectionBottomSheetState
    extends State<MemberSelectionBottomSheet> {
  String? short;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Member Selection',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: <Widget>[
                    _buildListTile("Self"),
                    _buildListTile("Member"),
                    _buildListTile("Other"),
                    SizedBox(
                      height: 10,
                    ),
                    RoundButton(
                        buttonLabel: "confirm",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LabtestDetail(
                                      date: widget.date,
                                      time: widget.time,
                                      prescription: widget.prescription,
                                      bookingFor: short,
                                      memberId: widget.memberId,
                                      remarks: widget.remarks,
                                    )),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildListTile(String value) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      contentPadding: EdgeInsets.all(5),
      minVerticalPadding: 0,
      onTap: () {
        setState(() {
          short = value.toString();
        });
      },
      title: Row(
        children: [
          SizedBox(
            height: 15,
            width: 15,
            child: Radio(
                value: value,
                fillColor: MaterialStateColor.resolveWith(
                    (states) => ThemeClass.orangeColor),
                groupValue: short,
                onChanged: (value) {
                  setState(() {
                    short = value.toString();
                  });
                  print(short);
                }),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 12,
                color: ThemeClass.blackColor,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
