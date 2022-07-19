import 'dart:convert';

import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';

import '../../../services/http_services.dart';
import 'all_lab_test_model.dart';

class LabTestController extends GetxController {
  RxList<LabTestProductData?> labTestData =
      (List<LabTestProductData?>.of([])).obs;

  RxBool isError = false.obs;
  var errorMessage = "".obs;
  var isloading = false.obs;

  RxString totalCount = "".obs;

// filter and sorting
  RxString categoryFilter = "".obs;
  RxString sortingFilter = "".obs;
  RxString searchFilter = "".obs;
  // pagination start

  var isProductLoaded = false.obs;
  var page = 1.obs;
  var isLoadMoreRunning = false.obs;
  var isnotMoreData = false.obs;

  // pagination end

  // sortingData
  sortingProduct(val) {
    sortingFilter.value = val;
  }

  // get lab data
  Future getLabTestData(
    bool isInit,
  ) async {
    if (isInit == true) {
      isloading(true);
      labTestData([]);
      page(1);
    }
    try {
      var url = 'products';
      var perameter = {
        "page": page.value,
        "count": "10",
        "search": searchFilter.value,
        "short_by": sortingFilter.value,
        "category_id": categoryFilter.value
      };

      print("----lab test ${perameter}");
      var response = await HttpServices.httpPostWithoutToken(url, perameter);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          var dashboardData1 = AllLabTestModel.fromJson(jasonData);
          isError(false);

          if (dashboardData1.data!.data!.isNotEmpty) {
            isnotMoreData(false);
            totalCount(dashboardData1.data!.totalcount.toString());
            dashboardData1.data!.data!.forEach((element) {
              labTestData.value.add(element);
            });
          } else {
            isnotMoreData(true);
          }
        } else {
          isError(true);
          errorMessage(jasonData['message'].toString());
        }
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

  Future<List<LabTestProductData>?> getLabTestForSearch(String text) async {
    try {
      var url = 'products';
      var perameter = {
        "page": "",
        "count": "",
        "search": text,
        "short_by": "",
        "category_id": ""
      };

      var response = await HttpServices.httpPostWithoutToken(url, perameter);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          var dashboardData1 = AllLabTestModel.fromJson(jasonData);

          return dashboardData1.data!.data;
          // return data;
        } else {
          throw jasonData['message'].toString();
          // isErrorInSearch(true);
          // errorMessageInSearch(jasonData['message'].toString());
        }
      } else {
        // isErrorInSearch(true);
        // errorMessageInSearch(GlobalMessages.internalservererror);
        throw GlobalMessages.internalservererror;
      }
    } catch (e) {
      // isErrorInSearch(true);
      // errorMessageInSearch(e.toString());

      throw e.toString();
    } finally {
      // isloadingInSearch(false);
    }
  }
}
