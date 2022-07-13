import 'dart:convert';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/authentication/Login/user_model.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';

class LoginController extends GetxController {
  var userPrefController = Get.put(UserPrefService());

  RxBool isError = false.obs;
  var errorMessage = "".obs;
  var isloading = false.obs;
  var islogin = false.obs;

  loginServices(dynamic mapData) async {
    try {
      var url = 'login';
      var response = await HttpServices.httpPostWithoutToken(url, mapData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          UserModel userData = UserModel.fromJson(jasonData);

          userPrefController.setUserData(userModel: userData);
          userPrefController.setToken(userData.data!.token);

          islogin(true);

          showToast(jasonData['message']);
          Get.offAllNamed(Routes.homeScreen);

          isError(false);
          errorMessage("");
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "201") {
          showToast(jasonData['message']);
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "202") {
              // Get.to
          // Get.toNamed(Routes.mobileVerificationScreen, arguments: [
          //   {'route': 'login'},
          //   {'phoneNumber': mapData['username'].toString()}
          // ]);
          showToast(jasonData['message']);
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
