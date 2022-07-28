import 'dart:convert';

import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/http_services.dart';

import '../../../global/global_messages.dart';

import '../../../services/SharedPrefServices/shared_pref_services.dart';

class ChangePasswordController extends GetxController {
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  changePasswordService(dynamic mapData) async {
    try {
      String url = 'change-password';

      var response = await HttpServices.httpPost(url, mapData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "401" && jasonData['success'] == "1") {
          showToast(jasonData['message']);
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "201") {
          showToast(jasonData['message']);
        }
      } else if (response.statusCode == 401) {
        showToast(GlobalMessages.unauthorizedUser);
        UserPrefService().setIsLogin(false);
        await UserPrefService().removeUserData();
        Get.offAllNamed(Routes.loginScreen);
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }
}
