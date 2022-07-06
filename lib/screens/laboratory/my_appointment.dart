import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  get editingController => null;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child:
              AppbarWithBackButton(appbarTitle: 'key_my_appointment_title'.tr),
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: ThemeClass.whiteColor,
                border: Border.all(color: ThemeClass.orangeColor),
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: ThemeClass.orangeColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: ThemeClass.orangeColor,
                tabs: [
                  Tab(
                    child: Text(
                      'key_upcoming'.tr,
                      style: const TextStyle(
                          fontSize: 14.0, fontFamily: "Poppins-Regular"),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'key_completed'.tr,
                      style: const TextStyle(
                          fontSize: 14.0, fontFamily: "Poppins-Regular"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _tabBarView(),
          ),
        ]),
      ),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildAppointmentListTIle(),
        _buildAppointmentListTIle(),
        // TextButton(
        //   onPressed: () {},
        //   //child: _tabBarView(),
        // )
      ],
    );
  }

  Padding _buildAppointmentListTIle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: const Color(0xfffeebe4),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.transparent)),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/lab_test_image.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'key_id'.tr + " #123456",
                                  style: const TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.w500),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text(
                                    "25 Oct, 2021 12:30PM",
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const Text(
                              "ABO Group & RH Type",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "₹ 120.00",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ThemeClass.orangeColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.myUpCommingAppoinmentScreen);
            },
          );
        },
      ),
    );
  }
}
