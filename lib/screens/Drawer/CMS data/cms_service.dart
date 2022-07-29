import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/http_services.dart';
import 'cms_data_model.dart';

class CmsServices extends GetxController {
  Rx<CmsPagesData> globleCmsData = CmsPagesData().obs;
  Future<void> getCmsData() async {
    try {
      var url = 'cms_pages';
      var response = await HttpServices.httpGetWithoutToken(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          var tempData = CmsModel.fromJson(jasonData);
          globleCmsData(tempData.data);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {}
  }
}
