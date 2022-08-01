// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/screens/Drawer/TestReport/my_test_report_model.dart';
import 'package:oyo_labs/screens/Drawer/TestReport/my_test_report_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';

class MyTestRepoer extends StatefulWidget {
  const MyTestRepoer({Key? key}) : super(key: key);

  @override
  State<MyTestRepoer> createState() => _MyTestRepoerState();
}

class _MyTestRepoerState extends State<MyTestRepoer> {
  final _testReportController = Get.put(MyTestRepoertServicesController());
  @override
  void initState() {
    _testReportController.getMyTestReports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: 'key_my_test_report'.tr),
        ),
        body: Obx(
          () => (_testReportController.isloading.value == false)
              ? _testReportController.isError.value == true
                  ? Center(
                      child: Text(
                          _testReportController.errorMessage.value.toString()),
                    )
                  : _testReportController.myTestDetails.isEmpty
                      ? const Center(child: Text("Test report not found"))
                      : ListView.builder(
                          itemCount: _testReportController.myTestDetails.length,
                          itemBuilder: (context, index) {
                            TestReportDetails? testData = _testReportController
                                .myTestDetails.value[index];
                            return _buildListTile(testData);
                          })
              : _buildCircularProgressIndicator(height, width),
        ),
      ),
    );
  }

  Column _buildListTile(TestReportDetails? testData) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ThemeClass.skyblueColor,
            border: Border.all(width: 0, color: Colors.white),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1.5),
                blurRadius: 6,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testData!.testName.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Uploaded by ${testData.labName.toString()}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat.MMMd().format(testData.date!),
                    style: TextStyle(
                      fontSize: 12,
                      color: ThemeClass.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 23,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ThemeClass.orangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                      onPressed: () {},
                      child: Text(
                        'key_download_btn'.tr,
                        style: const TextStyle(
                            fontSize: 10,
                            color: ThemeClass.whiteColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildCircularProgressIndicator(double height, double width) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          color: ThemeClass.orangeColor,
        ),
      ),
    );
  }
}
