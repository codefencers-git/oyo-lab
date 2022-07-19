import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/all_lab_test_service.dart';
import 'package:oyo_labs/services/product_category/product_category_service.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/category_list_tile_widget.dart';

class CategoryFilterBottomSheet extends StatefulWidget {
  const CategoryFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<CategoryFilterBottomSheet> createState() =>
      _CategoryFilterBottomSheetState();
}

class _CategoryFilterBottomSheetState extends State<CategoryFilterBottomSheet> {
  int isSelected = 0;
  var _categoryController = Get.find<ProductCategoryController>();
  var _labTestController = Get.find<LabTestController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(),
      ),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.88,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, right: 10, top: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters'.tr,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: ImageIcon(
                        AssetImage(
                          'assets/icons/icon-cancel.png',
                        ),
                        color: ThemeClass.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 0.8,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _buildSearchBox(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildCategoryList()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          color: ThemeClass.greyLightColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _categoryController.clearCatagoryList();
                },
                child: Text(
                  'Clear all',
                  style: TextStyle(
                      fontSize: 16,
                      color: ThemeClass.orangeColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ThemeClass.orangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                  onPressed: () {
                    _applyFilter();

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Apply',
                    style: const TextStyle(
                        fontSize: 16,
                        color: ThemeClass.whiteColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _applyFilter() {
    var data = _categoryController.tempCategoryData
        .map((element) => element.isChecked == true ? element.id : null)
        .toList();
    data.removeWhere((element) => element == null);
    print(
      "-------->$data",
    );

    _labTestController.categoryFilter.value =
        data.toString().replaceAll("[", "").replaceAll("]", "");
    _labTestController.getLabTestData(
      true,
    );
  }

  _buildCategoryList() {
    return GetBuilder<ProductCategoryController>(
        builder: (tx) => Expanded(
              child: _categoryController.isloading.value == false
                  ? _categoryController.isError.value == true
                      ? Center(
                          child: Text(
                              _categoryController.isError.value.toString()),
                        )
                      : _categoryController.tempCategoryData.isEmpty
                          ? const Center(
                              child: Text("no data found!"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: _categoryController
                                  .tempCategoryData.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CategoryListTileWidget(
                                    categoryData: _categoryController
                                        .tempCategoryData[index]);
                              })
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ));
  }

  Container _buildSearchBox() {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ThemeClass.greyColor2)),
      child: TextField(
        onChanged: (text) {
          print(text);
          _categoryController.searchCategory(text);
        },
        decoration: InputDecoration(
            suffixIcon: SizedBox(
              child: Image.asset(
                'assets/icons/icon_search.png',
                scale: 2.8,
              ),
            ),
            border: InputBorder.none,
            hintText: 'Select Catagory',
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none),
      ),
    );
  }
}
