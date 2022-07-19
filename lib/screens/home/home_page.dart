// ignore_for_file: sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/app_info/google_key_services.dart';
import 'package:oyo_labs/routes.dart';

import 'package:oyo_labs/screens/home/Drawer%20screen/drawer_sceen.dart';
import 'package:oyo_labs/screens/home/Homepage%20Model/dashboard_model.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/homepage_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/user_location_service.dart';
import '../laboratory/labtest_tile_widget.dart';
import 'Homepage Services/dashboard_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  DashboardController dashboardController = Get.find<DashboardController>();
  UserLocationController userLocationController =
      Get.put(UserLocationController());
  @override
  void initState() {
    super.initState();
    _determinePosition();
    userLocationController.getCurrentLocation();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      drawer: DrawerWidget(
        width: width,
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: HomePageAppBar(
          onTap: () {},
          address: userLocationController.currentAddress.toLowerCase(),
        ),
      ),
      body: Obx(
        () => (dashboardController.isloading.value == false)
            ? dashboardController.isError.value == true
                ? Center(
                    child:
                        Text(dashboardController.errorMessage.value.toString()),
                  )
                : SingleChildScrollView(
                    child: Column(
                    children: [
                      _buildSlider(width, height,
                          dashboardController.dashboardData.value),
                      _buildSearchBar(),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildUploadPrescription(context, width),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildTestNearYouTitleRow(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: dashboardController
                              .dashboardData.value.tests!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var dashboardData = dashboardController
                                .dashboardData.value.tests![index];
                            return AllLabsGridTileWidget(
                                labTestData: dashboardData);
                          },
                        ),
                      ),
                    ],
                  ))
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

  Padding _buildTestNearYouTitleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'key_test_near_by_you'.tr,
            style: TextStyle(
                fontSize: 14,
                color: ThemeClass.blackColor,
                fontWeight: FontWeight.w700),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.allLabTests);
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            child: Row(
              children: [
                Text(
                  'key_view_all'.tr,
                  style: TextStyle(
                      fontSize: 14,
                      color: ThemeClass.orangeColor,
                      fontWeight: FontWeight.w900),
                ),
                Image.asset('assets/icons/arrowhead-right.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildUploadPrescription(BuildContext context, double width) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: ThemeClass.whiteColor2,
        border: Border.all(width: 0, color: Colors.white),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-5, 3),
            blurRadius: 3,
            color: Colors.black.withOpacity(0.1),
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
                    'key_order_with_prescription'.tr,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'key_upload_prescription_description'.tr,
                      softWrap: true,
                      maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
                width: 100,
                child: _uploadButton(context, width),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        cursorColor: ThemeClass.orangeColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeClass.skyblueColor,
          border: InputBorder.none,
          hintText: 'key_searchbar_label'.tr,
          hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          suffixIcon: SizedBox(
            child: Image.asset("assets/icons/icon_search.png", scale: 3),
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(double width, double height, DashboardData data) {
    return Column(
      children: [
        CarouselSlider(
          items: data.slider!
              .map((item) => Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ThemeClass.skyblueColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'key_homepage_slider_title'.tr,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: ThemeClass.redColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'key_homepage_slider_subtitle'.tr,
                                softWrap: true,
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 14,
                                    color: ThemeClass.blackColor1,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'key_homepage_slider_description'.tr,
                                softWrap: true,
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 10,
                                    color: ThemeClass.greyColor1,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/home-page-slider.png',
                          width: width / 2.5,
                          height: height / 3,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 2,
              enableInfiniteScroll: false,
              viewportFraction: 0.95,
              initialPage: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.slider!.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? ThemeClass.orangeColor
                        : ThemeClass.orangeColor.withOpacity(0.2)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  ElevatedButton _uploadButton(BuildContext context, double width) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ThemeClass.orangeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
      onPressed: () {
        // showModalBottomSheet<void>(
        //   context: context,
        //   backgroundColor: Colors.transparent,
        //   builder: (BuildContext context) {
        //     return const SelectImageBottomSheet();
        //   },
        // );

        dashboardController.showdialog();
      },
      child: Text(
        'key_upload_btn_label'.tr,
        style: const TextStyle(
            fontSize: 14,
            color: ThemeClass.whiteColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
