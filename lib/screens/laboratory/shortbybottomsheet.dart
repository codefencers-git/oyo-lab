import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';

class ShortByBottomSheet extends StatefulWidget {
  const ShortByBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShortByBottomSheet> createState() => _ShortByBottomSheetState();
}

class _ShortByBottomSheetState extends State<ShortByBottomSheet> {
  String? short;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
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
          Divider(),
          Column(
            children: <Widget>[
              ListTile(
                title: Text("Average customer rating"),
                leading: Radio(
                    value: "rating",
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFFFE4300)),
                    groupValue: short,
                    onChanged: (value) {
                      setState(() {
                        short = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text("Price : low to high"),
                leading: Radio(
                    value: "low",
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFFFE4300)),
                    groupValue: short,
                    onChanged: (value) {
                      setState(() {
                        short = value.toString();
                      });
                    }),
              ),
              ListTile(
                title: Text("Price : high to low"),
                leading: Radio(
                    value: "high",
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFFFE4300)),
                    groupValue: short,
                    onChanged: (value) {
                      setState(() {
                        short = value.toString();
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
