// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';

import '../../../widgets/appbar/appbar_with_back_button.dart';
import 'faqs_services_controller.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final FAQsController _faqsController =
      Get.put(FAQsController(), permanent: true);

  @override
  void initState() {
    _faqsController.getFAQsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'key_help_&_faq'.tr),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 50.0,
        margin: const EdgeInsets.all(16.0),
      ),
      body: Obx(
        () => (_faqsController.isloading.value == false)
            ? _faqsController.isError.value == true
                ? Center(
                    child: Text(_faqsController.errorMessage.value.toString()),
                  )
                : SafeArea(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Select any topics",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: _faqsController.faqsData.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data =
                                    _faqsController.faqsData.value[index];
                                if (data!.list!.isEmpty) {
                                  return ListTile(
                                    title: Text(
                                      data.title.toString(),
                                      style: const TextStyle(
                                        color: Color(0xff0E0E0E),
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                }
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                        ThemeClass.orangeColor,
                                    colorScheme: ColorScheme.light(
                                      primary: ThemeClass.orangeColor,
                                    ),
                                    dividerColor: Colors.transparent,
                                  ),
                                  child: ExpansionTile(
                                    iconColor: ThemeClass.orangeColor,
                                    collapsedIconColor: ThemeClass.orangeColor,
                                    title: Text(
                                      data.title.toString(),
                                      style: const TextStyle(
                                        color: Color(0xff0E0E0E),
                                        fontSize: 14,
                                      ),
                                    ),
                                    children: List.generate(
                                      _faqsController
                                          .faqsData.value[index]!.list!.length,
                                      (indx) => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: ExpansionTile(
                                          iconColor: ThemeClass.orangeColor,
                                          collapsedIconColor:
                                              ThemeClass.orangeColor,
                                          title: Text(
                                            _faqsController
                                                .faqsData
                                                .value[index]!
                                                .list![indx]
                                                .title!,
                                            style: const TextStyle(
                                              color: Color(0xff0E0E0E),
                                              fontSize: 12,
                                            ),
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    _faqsController
                                                        .faqsData
                                                        .value[index]!
                                                        .list![indx]
                                                        .description
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Color(0xff0E0E0E),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            : Container(
                height: height,
                width: width,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ThemeClass.orangeColor,
                  ),
                ),
              ),
      ),
    );
  }
}
