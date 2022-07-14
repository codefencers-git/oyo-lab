import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

class ShortByBottomSheet extends StatefulWidget {
  const ShortByBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShortByBottomSheet> createState() => _ShortByBottomSheetState();
}

class _ShortByBottomSheetState extends State<ShortByBottomSheet> {
  late double screebnHeight, screenWidth;
  String? short;
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
                        value: "rating",
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ThemeClass.orangeColor),
                        groupValue: short,
                        onChanged: (value) {
                          setState(() {
                            short = value.toString();
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
                        value: "low",
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ThemeClass.orangeColor),
                        groupValue: short,
                        onChanged: (value) {
                          setState(() {
                            short = value.toString();
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
                        value: "high",
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ThemeClass.orangeColor),
                        groupValue: short,
                        onChanged: (value) {
                          setState(() {
                            short = value.toString();
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
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(),
      ),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.88,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, right: 10, top: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'key_filters'.tr,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: ImageIcon(
                        AssetImage(
                          'assets/icons/icon-cancel.png',
                        ),
                        color: ThemeClass.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 0.8,
              ),
              Expanded(
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 110,
                        // child: ListView.builder(
                        //     shrinkWrap: true,
                        //     itemCount: 3,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return InkWell(
                        //         onTap: () {
                        //           setState(() {
                        //             isSelected = index;
                        //           });
                        //         },
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //               border: Border(
                        //             right: BorderSide(
                        //               color: isSelected == index
                        //                   ? ThemeClass.orangeColor
                        //                   : ThemeClass.whiteColor,
                        //               width: 2.0,
                        //             ),
                        //           )),
                        //           child: const ListTile(
                        //             visualDensity: VisualDensity(
                        //                 horizontal: -4, vertical: -4),
                        //             dense: true,
                        //             //contentPadding: EdgeInsets.zero,
                        //             title: Text(
                        //               "Category 01",
                        //               style: TextStyle(
                        //                   fontSize: 12,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     }),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8),
                      //   child: Text(
                      //     'Category 01',
                      //     style: TextStyle(
                      //         fontSize: 14, fontWeight: FontWeight.w500),
                      //   ),
                      // ),
                      // Container(
                      //   height: double.infinity,
                      //   width: 1,
                      //   color: ThemeClass.greyColor2,
                      // ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Container(
                                height: 35,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: ThemeClass.greyColor2)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      suffixIcon: SizedBox(
                                        child: Image.asset(
                                          'assets/icons/icon_search.png',
                                          scale: 2.8,
                                        ),
                                      ),
                                      // contentPadding: EdgeInsets.only(top: 14),
                                      border: InputBorder.none,
                                      // isCollapsed: true,
                                      hintText: 'Select Catagory',
                                      focusedBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return const ListTile(
                                        visualDensity: VisualDensity(
                                            horizontal: -4, vertical: -4),
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                            Icons.check_box_outline_blank),
                                        title: Text(
                                          "ABO Group & RH Type",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  child: const Text(
                    'Apply',
                    style: const TextStyle(
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
