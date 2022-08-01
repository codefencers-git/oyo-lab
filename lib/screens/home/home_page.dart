// ignore_for_file: sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/home/Drawer%20screen/drawer_sceen.dart';
import 'package:oyo_labs/screens/home/Homepage%20Model/dashboard_model.dart';
import 'package:oyo_labs/screens/laboratory/product_detail.dart';
import 'package:oyo_labs/widgets/bottom_sheets/imagebottomsheet.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/all_lab_test_model.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/all_lab_test_service.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/homepage_appbar.dart';
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

  bool isFirst = true;
  final TextEditingController _searchQuery = TextEditingController();

  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  UserLocationController userLocationController =
      Get.put(UserLocationController(), permanent: true);
  @override
  void initState() {
    super.initState();
    _determinePosition();
    _focus.addListener(_onFocusChange);

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

  final ScrollController _scrollController = ScrollController();
  final FocusNode _focus = FocusNode();

  _moveToTop(val) {
    _scrollController.jumpTo(val);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
    if (_focus.hasFocus == false) {
      _searchQuery.clear();
    }
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
          child: Obx(
            () => userLocationController.currentAddress.toString() == ''
                ? HomePageAppBar(
                    onTap: () {},
                    address: "",
                    isDelivered: false,
                  )
                : HomePageAppBar(
                    onTap: () {},
                    isDelivered: true,
                    address: userLocationController.currentAddress.toString(),
                  ),
          )),
      body: Obx(
        () => (_dashboardController.isloading.value == false)
            ? _dashboardController.isError.value == true
                ? Center(
                    child: Text(
                        _dashboardController.errorMessage.value.toString()),
                  )
                : SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        _buildSlider(width, height,
                            _dashboardController.dashboardData.value),
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
                            itemCount: _dashboardController
                                .dashboardData.value.tests!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var dashboardData = _dashboardController
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

  Widget _buildSearchBar() {
    return WillPopScope(
      onWillPop: () async {
        _searchQuery.clear();
        return Future.value(true);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: false,
            focusNode: _focus,
            controller: _searchQuery,
            cursorColor: ThemeClass.orangeColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: ThemeClass.skyblueColor,
              border: InputBorder.none,
              hintText: 'key_searchbar_label'.tr,
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              suffixIcon: SizedBox(
                child: Image.asset("assets/icons/icon_search.png", scale: 3),
              ),
            ),
            onTap: () {
              _moveToTop(MediaQuery.of(context).size.height * 0.3);
            },
            onEditingComplete: () {
              FocusScopeNode _currentFocus = FocusScope.of(context);
              _searchQuery.clear();
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
          hideOnEmpty: false,
          hideOnLoading: false,
          hideOnError: false,
          getImmediateSuggestions: true,
          loadingBuilder: (context) {
            return Container(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(color: ThemeClass.orangeColor),
              ),
            );
          },
          suggestionsCallback: (pattern) async {
            var data = await LabTestController().getLabTestForSearch(pattern);

            return data!.map((e) => e);
          },
          itemBuilder: (context, LabTestProductData suggestion) {
            return ListTile(
              leading: Icon(
                Icons.medication_rounded,
                color: ThemeClass.orangeColor,
              ),
              title: Text(suggestion.title.toString()),
            );
          },
          noItemsFoundBuilder: (contex) {
            return const Center(
              child: Text("no data found"),
            );
          },
          onSuggestionSelected: (LabTestProductData suggestion) {
            print("--------");
            print(suggestion.id);
            Get.to(LaboratoryDetail(
              id: suggestion.id.toString(),
              productTitle: suggestion.title.toString(),
            ));
          },
          errorBuilder: (context, data) {
            return Center(
              child: Text(data.toString()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSlider(double width, double height, DashboardData data) {
    return Column(
      children: [
        CarouselSlider(
          items: data.slider!
              .map(
                (item) => Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ThemeClass.skyblueColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Image.network(
                      item.image.toString(),
                      fit: BoxFit.contain,
                    )),
              )
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
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return const SelectImageBottomSheet();
          },
        );
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
