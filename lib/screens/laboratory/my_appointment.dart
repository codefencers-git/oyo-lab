import 'package:flutter/material.dart';
import 'package:oyo_labs/screens/laboratory/complete_booking.dart';
import 'package:oyo_labs/screens/laboratory/lab_test_detail.dart';
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
          child: AppbarWithBackButton(appbarTitle: "My Appointment"),
        ),
        body: Column(children: [
          SizedBox(
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
                tabs: const [
                  Tab(
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                          fontSize: 14.0, fontFamily: "Poppins-Regular"),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Completed',
                      style: TextStyle(
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
        Padding(
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
                      color: Color(0xfffeebe4),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.transparent)),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/lab_test_image.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "ID : #123456",
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
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
                                Text(
                                  "ABO Group & RH Type",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LabtestDetail()),
                  );
                },
              );
            },
          ),
        ),
        Padding(
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
                    color: Color(0xfffeebe4),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.transparent),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/lab_test_image.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "ID : #123456",
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
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
                                Text(
                                  "ABO Group & RH Type",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LabTestComplete()),
                  );
                },
              );
            },
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   //child: _tabBarView(),
        // )
      ],
    );
  }
}
