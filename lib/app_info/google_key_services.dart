import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/http_services.dart';
import 'google_services_model.dart';

class AppInfoController extends GetxController {
  Rx<String> googleApiKey = "".obs;

  Future<void> getAppInfo() async {
    try {
      var url = 'get_general_info';
      var response = await HttpServices.httpGetWithoutToken(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          var dashboardData1 = GoogleServicesModel.fromJson(jasonData);
          googleApiKey(dashboardData1.data!.googleMapApiKey.toString());
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString(
              "googleKey", dashboardData1.data!.googleMapApiKey.toString());
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {}
  }
}
