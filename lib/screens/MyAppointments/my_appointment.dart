import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "My Appointment"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: ThemeClass.whiteColor,
                  border: Border.all(color: ThemeClass.orangeColor, width: 1.5),
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  labelStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: ThemeClass.orangeColor,
                  ),
                  labelColor: ThemeClass.whiteColor,
                  unselectedLabelColor: ThemeClass.orangeColor,
                  tabs: const [
                    Tab(
                      text: 'Upcoming',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      // physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, i) {
                        return appointmentListTile();
                      },
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      // physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, i) {
                        return appointmentListTile();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container appointmentListTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ThemeClass.orangeColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/appointment-tile.png",
                height: 70,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ID : #123456",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: ThemeClass.blackColor1),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "ABO Group & RH Type",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ThemeClass.blackColor1),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "₹ 120.00",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ThemeClass.orangeColor),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "25 Oct, 2021 12:30PM",
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: ThemeClass.blackColor1),
          ),
        ],
      ),
    );
  }
}
