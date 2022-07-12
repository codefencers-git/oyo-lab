import 'dart:convert';

import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';

import '../../../services/http_services.dart';
import 'all_lab_test_model.dart';

class LabTestController extends GetxController {
  RxList<LabTestData?> labTestData = (List<LabTestData?>.of([])).obs;

  RxBool isError = false.obs;
  var errorMessage = "".obs;
  var isloading = false.obs;

  List<LabTestData>? incomingData;

  Future getLabTestData() async {
    isloading(true);
    try {
      var url = 'products';
      var perameter = {};

      var response = await HttpServices.httpPostWithoutToken(url, perameter);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          var dashboardData1 = AllLabTestModel.fromJson(jasonData);

          labTestData(dashboardData1.data);
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
