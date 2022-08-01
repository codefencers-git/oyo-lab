import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment/upcoming_appointment_widget.dart';
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
          _buildTwoButton(),
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
        UpcomingAppointmentWidget(isUpcoming: true),
        UpcomingAppointmentWidget(isUpcoming: false),
      ],
    );
  }

  Padding _buildTwoButton() {
    return Padding(
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
    );
  }
}
