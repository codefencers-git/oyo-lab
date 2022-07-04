import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';

class SelectImageBottomSheet extends StatefulWidget {
  const SelectImageBottomSheet({Key? key}) : super(key: key);

  @override
  State<SelectImageBottomSheet> createState() => _SelectImageBottomSheetState();
}

class _SelectImageBottomSheetState extends State<SelectImageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 20,
                color: Colors.transparent,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'key_choose_option'.tr,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ThemeClass.skyblueColor,
                            border: Border.all(width: 1, color: Colors.red),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width / 2.8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/icon_camera.png",
                                        height: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'key_camera'.tr,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 1,
                                indent: 15,
                                endIndent: 15,
                                color: ThemeClass.orangeColor,
                              ),
                              SizedBox(
                                width: width / 2.8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/icon_gallery.png",
                                        height: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'key_gallery'.tr,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ElevatedButton(
                      //   child:
                      //       const Text('Close BottomSheet'),
                      //   onPressed: () =>
                      //       Navigator.pop(context),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                child: ClipRect(
                  child: Image.asset(
                    "assets/icons/icon_cancel.png",
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
