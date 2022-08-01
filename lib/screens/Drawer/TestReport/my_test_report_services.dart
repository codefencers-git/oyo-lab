import 'dart:convert';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/http_services.dart';
import '../../../services/SharedPrefServices/shared_pref_services.dart';
import 'my_test_report_model.dart';

class MyTestRepoertServicesController extends GetxController {
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  RxList<TestReportDetails?> myTestDetails =
      (List<TestReportDetails?>.of([])).obs;

  Future<void> getMyTestReports() async {
    isloading(true);
    try {
      String url = 'report';
      var response = await HttpServices.httpGet(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          MyTestReportModel testData = MyTestReportModel.fromJson(jasonData);

          myTestDetails(testData.data);
        } else {
          isError(true);
          errorMessage(jasonData['message'].toString());
        }
      } else if (response.statusCode == 401) {
        showToast(GlobalMessages.unauthorizedUser);
        UserPrefService().setIsLogin(false);
        await UserPrefService().removeUserData();
        Get.offAllNamed(Routes.loginScreen);
      } else {
        showToast(GlobalMessages.somethingwentwongMessage);
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }
}
