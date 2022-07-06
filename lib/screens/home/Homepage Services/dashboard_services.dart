import 'dart:convert';

import 'package:get/get.dart';

import 'package:oyo_labs/screens/home/Homepage%20Model/dashboard_model.dart';
import 'package:oyo_labs/services/http_services.dart';

class DashboardController extends GetxController {
  var dashboardData = DashboardData().obs;
  RxBool isError = false.obs;
  var errorMessage = "".obs;
  var isloading = false.obs;

  
  getDashboardData() async {
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
        errorMessage("internal server error");
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }
}
