import 'package:get/get.dart';
import 'dart:convert';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';

class ChangePasswordController extends GetxController {
  RxBool isError = false.obs;
  var errorMessage = "".obs;
  var isloading = false.obs;

  changePasswordService(dynamic mapData) async {
    try {
      var url = 'reset-password';

      var response = await HttpServices.httpPostWithoutToken(url, mapData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);
     
          Get.offAllNamed(Routes.loginScreen);

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
