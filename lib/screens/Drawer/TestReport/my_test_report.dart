import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';

class MyTestRepoer extends StatefulWidget {
  const MyTestRepoer({Key? key}) : super(key: key);

  @override
  State<MyTestRepoer> createState() => _MyTestRepoerState();
}

class _MyTestRepoerState extends State<MyTestRepoer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "My Test Report"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _buildTestReport(),
            const SizedBox(
              height: 20,
            ),
            _buildTestReport(),
            const SizedBox(
              height: 20,
            ),
            _buildTestReport(),
            const SizedBox(
              height: 20,
            ),
            _buildTestReport(),
          ],
        ),
      ),
    );
  }

  Container _buildTestReport() {
    return Container(
      padding: const EdgeInsets.all(16),
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
                children: const [
                  Text(
                    "Test Case",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Laboratory Upload',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                '13 june',
                style: TextStyle(
                  fontSize: 12,
                  color: ThemeClass.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
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
                    'Download',
                    style: TextStyle(
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
    );
  }
}
