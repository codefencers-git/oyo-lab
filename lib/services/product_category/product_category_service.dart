import 'dart:convert';

import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';
import 'package:oyo_labs/services/product_category/product_category_model.dart';

class ProductCategoryController extends GetxController {
  RxList<ProductCategoryData> categoryData = <ProductCategoryData>[].obs;
  RxList<ProductCategoryData> tempCategoryData = <ProductCategoryData>[].obs;

  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  toggleCheckbox(bool? val, item) {
    int index1 = tempCategoryData.indexOf(item);
    int index2 = categoryData.indexOf(item);
    tempCategoryData.value[index1].isChecked = val;
    categoryData.value[index2].isChecked = val;
    update();
  }

  clearCatagoryList() {
    var data1 = tempCategoryData.where((p0) => p0.isChecked = false);
    tempCategoryData.addAll(data1);
    var data = categoryData.where((p0) => p0.isChecked = false);
    categoryData.addAll(data);
    update();
  }

  searchCategory(String value) {
    tempCategoryData.value = [];
    var filterdData = categoryData.where((p0) => p0.title!.contains(value));
    tempCategoryData.value.addAll(filterdData);
    update();
  }

  getProductCategory() async {
    try {
      String url = 'categories';
      var dataToPass = {"search": ""};
      var response = await HttpServices.httpPostWithoutToken(url, dataToPass);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          var dashboardData1 = ProductCategoryModel.fromJson(jasonData);
          categoryData(dashboardData1.data);
          tempCategoryData(dashboardData1.data);
          isError(false);
          errorMessage("");
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "201") {
          showToast(jasonData['message']);
        } else {
          isError(true);
          errorMessage(jasonData['message'].toString());
        }
      } else if (response.statusCode == 401) {
        showToast(GlobalMessages.unauthorizedUser);
        UserPrefService().setIsLogin(false);
        await UserPrefService().removeUserData();
      } else {
        isError(true);
        errorMessage(GlobalMessages.internalservererror);
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }
}
