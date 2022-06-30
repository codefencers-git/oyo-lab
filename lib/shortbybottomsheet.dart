import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

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
      height: 300,
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
                        (states) => ThemeClass.orangeColor),
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
                        (states) => ThemeClass.orangeColor),
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
                        (states) => ThemeClass.orangeColor),
                    groupValue: short,
                    onChanged: (value) {
                      setState(() {
                        short = value.toString();
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(
                  buttonLabel: 'Apply',
                  onTap: () {
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

class CategoryFilterBottomSheet extends StatefulWidget {
  const CategoryFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<CategoryFilterBottomSheet> createState() =>
      _CategoryFilterBottomSheetState();
}

class _CategoryFilterBottomSheetState extends State<CategoryFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(),
      ),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.88,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    ImageIcon(
                      AssetImage(
                        'assets/icons/icon-cancel.png',
                      ),
                      color: ThemeClass.orangeColor,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.8,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       offset: const Offset(-5, 3),
          //       blurRadius: 3,
          //       color: Colors.black.withOpacity(0.1),
          //     ),
          //   ],
          // ),

          height: 60,
          color: ThemeClass.greyLightColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Clear all',
                style: TextStyle(
                    fontSize: 16,
                    color: ThemeClass.orangeColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ThemeClass.orangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Container();
                      },
                    );
                  },
                  child: Text(
                    'Apply',
                    style: TextStyle(
                        fontSize: 16,
                        color: ThemeClass.whiteColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
