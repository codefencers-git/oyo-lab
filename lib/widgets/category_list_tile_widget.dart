import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:oyo_labs/services/product_category/product_category_model.dart';
import 'package:oyo_labs/services/product_category/product_category_service.dart';

import 'package:oyo_labs/themedata.dart';

class CategoryListTileWidget extends StatelessWidget {
  CategoryListTileWidget({
    Key? key,
    required this.categoryData,
  }) : super(key: key);
  ProductCategoryData categoryData;
  final _categoryController = Get.find<ProductCategoryController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductCategoryController>(builder: (tx) => _buildTile());
  }

  ListTile _buildTile() {
    return ListTile(
      visualDensity: VisualDensity(horizontal: -1, vertical: -3),
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Checkbox(
        value: categoryData.isChecked,
        activeColor: ThemeClass.orangeColor,
        onChanged: (val) {
          _categoryController.toggleCheckbox(val, categoryData);
        },
      ),
      title: Text(
        categoryData.title.toString(),
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}
