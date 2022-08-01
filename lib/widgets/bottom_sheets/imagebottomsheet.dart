import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/text_box_normal.dart';
import 'package:oyo_labs/services/http_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';

class SelectImageBottomSheet extends StatefulWidget {
  const SelectImageBottomSheet({Key? key}) : super(key: key);

  @override
  State<SelectImageBottomSheet> createState() => _SelectImageBottomSheetState();
}

class _SelectImageBottomSheetState extends State<SelectImageBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 290,
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextBoxSimpleWidget(
                            hinttext: "Enter Title",
                            controllers: _titleController),
                      ),
                      const SizedBox(height: 15),
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
                              InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  width: width / 2.8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              ),
                              VerticalDivider(
                                thickness: 1,
                                indent: 15,
                                endIndent: 15,
                                color: ThemeClass.orangeColor,
                              ),
                              InkWell(
                                onTap: () {
                                  _uploadMumtiImage();
                                },
                                child: SizedBox(
                                  width: width / 2.8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              ),
                            ],
                          ),
                        ),
                      ),
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

  _uploadMumtiImage() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();
    print(_titleController.text);
    if (_titleController.text != "") {
      if (images != null && images.isNotEmpty) {
        Map<String, String> requestPrm = {
          "title": _titleController.text,
          "type": "Self"
        };

        callAPi(images, requestPrm);
        print(images);
      }
    } else {
      showToast("Please enter title");
    }
  }

  callAPi(List<XFile> images, Map<String, String> requestPrm) async {
    try {
      EasyLoading.show();
      var response = await HttpServices.httpPostWithMultipleImageUpload(
          "save_prescription", images, requestPrm,
          peramterName: "prescription[]");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message'].toString());
          Get.back();
        } else {
          showToast(jasonData['message'].toString());
        }
      } else {
        showToast(GlobalMessages.internalservererror);
      }
    } catch (e) {
      showToast(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
