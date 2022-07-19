import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/screens/home/Homepage%20Model/dashboard_model.dart';
import 'package:oyo_labs/services/http_services.dart';

class DashboardController extends GetxController {
  Rx<DashboardData> dashboardData = DashboardData().obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  showdialog() {
    Get.dialog(
      Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.white,
          child: const Text("code here"),
        ),
      ),
    );
  }

  Future<void> getDashboardData() async {
    isloading(true);
    try {
      var url = 'get_dashboard_data';
      var response = await HttpServices.httpGetWithoutToken(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          var dashboardData1 = DashboardModel.fromJson(jasonData);

          dashboardData(dashboardData1.data);
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
}
