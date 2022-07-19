import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/all_lab_test_service.dart';
import 'package:oyo_labs/screens/laboratory/labtest_tile_widget.dart';
import 'package:oyo_labs/services/product_category/product_category_service.dart';
import 'package:oyo_labs/widgets/bottom_sheets/filter_bottom_sheet.dart';

import 'package:oyo_labs/widgets/bottom_sheets/short_by_bottom_sheet.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';

class AllLabTestsScreen extends StatefulWidget {
  const AllLabTestsScreen({Key? key}) : super(key: key);

  @override
  State<AllLabTestsScreen> createState() => _AllLabTestsScreenState();
}

class _AllLabTestsScreenState extends State<AllLabTestsScreen> {
  late TextEditingController _controller;
  var _scrollcontroller = ScrollController();
  var _categoryController = Get.find<ProductCategoryController>();
  var _labTestController = Get.put(LabTestController());
  @override
  void initState() {
    super.initState();
    _scrollcontroller.addListener(_loadMore);

    _labTestController.getLabTestData(true);
    _categoryController.clearCatagoryList();
    _controller = TextEditingController();
  }

  bool isShowSearch = true;

  void _loadMore() async {
    if (!_labTestController.isnotMoreData.value) {
      if (_scrollcontroller.position.pixels ==
          _scrollcontroller.position.maxScrollExtent) {
        if (_labTestController.isloading.value == false &&
            _labTestController.isLoadMoreRunning.value == false) {
          if (_scrollcontroller.position.extentAfter < 300) {
            _labTestController.isLoadMoreRunning(true);

            var page1 = _labTestController.page.value;
            _labTestController.page(page1 + 1);
            print("--- start products");

            await _labTestController.getLabTestData(false);
            _labTestController.isLoadMoreRunning(false);
          }
        } else {
          print("loading....");
        }
      } else {
        print("---- end products");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
          appbarTitle: 'key_lab_test_title'.tr,
          // isShowSearch: isShowSearch,
          onIconPress: () {
            setState(() {
              isShowSearch = !isShowSearch;
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollcontroller,
        child: Obx(
          () => Column(
            children: [
              _buildSearchBox(),
              _buildSortAndFilterWidget(width, context),
              _buildAllTestTItle(),
              (_labTestController.isloading.value == true)
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ThemeClass.orangeColor,
                      ),
                    )
                  : _labTestController.isError.value == true
                      ? Center(
                          child: Text(
                              _labTestController.errorMessage.value.toString()),
                        )
                      : _labTestController.labTestData.value.isEmpty
                          ? Center(
                              child: Text("No Data Found"),
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.7,
                                    ),
                                    itemCount: _labTestController
                                        .labTestData.value.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // return Text("data");

                                      return AllLabsGridTileWidget(
                                        labTestData: _labTestController
                                            .labTestData.value[index],
                                      );
                                    },
                                  ),
                                ),
                                _labTestController.isLoadMoreRunning.value ==
                                        true
                                    ? CircularProgressIndicator(
                                        color: ThemeClass.orangeColor,
                                      )
                                    : SizedBox()
                              ],
                            )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildAllTestTItle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'key_all_test'.tr,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ThemeClass.blackColor),
          ),
          Row(
            children: [
              Text(
                " ${_labTestController.totalCount} " + 'key_test_available'.tr,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: ThemeClass.orangeColor),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildSortAndFilterWidget(double width, BuildContext context) {
    var sortingdata = "";

    if (_labTestController.sortingFilter.value == "average") {
      sortingdata = "avarage";
    } else if (_labTestController.sortingFilter.value == "low_to_high") {
      sortingdata = "low to high";
    } else if (_labTestController.sortingFilter.value == "high_to_low") {
      sortingdata = "high to low";
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: ThemeClass.skyblueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width / 2.9,
            child: InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return const ShortByBottomSheet();
                  },
                );
              },
              child: Row(
                children: [
                  Image.asset("assets/icons/icon_short.png", height: 20),
                  const SizedBox(
                    width: 10,
                  ),
                  // Text(
                  //   'key_sortby'.tr + 'key_relevance'.tr,
                  //   style: const TextStyle(
                  //       fontSize: 10, fontWeight: FontWeight.w900),
                  // ),

                  Expanded(
                    child: Text(
                      'key_sortby'.tr + " " + sortingdata,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: ThemeClass.orangeColor,
          ),
          SizedBox(
            width: width / 2.9,
            child: InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Container();
                  },
                );
              },
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const CategoryFilterBottomSheet());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/icon_filter.png",
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'key_filter'.tr,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton _buildSearchBox() {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: TextField(
          cursorColor: ThemeClass.blackColor,
          controller: _controller,
          onChanged: (val) {
            // _labTestController.searchFilter.value = val.toString();
            // _labTestController.getLabTestData(
            //   true,
            // );
          },
          onEditingComplete: () {
            print("compelte edint");
            _labTestController.searchFilter.value = _controller.text.toString();
            _labTestController.getLabTestData(
              true,
            );
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'key_search'.tr,
            hintStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            suffixIcon: InkWell(
              onTap: () {
                _labTestController.searchFilter.value =
                    _controller.text.toString();
                _labTestController.getLabTestData(
                  true,
                );
              },
              child: SizedBox(
                child: Image.asset("assets/icons/icon_search.png", scale: 3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
