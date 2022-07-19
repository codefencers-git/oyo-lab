import 'dart:async';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/services/http_services.dart';
import '../../../services/SharedPrefServices/shared_pref_services.dart';
import '../Change Password/change_password_screen.dart';

class MobileVerificationController extends GetxController {
  var isError = false.obs;
  var errorMessage = "".obs;
  var isLoading = false.obs;

  var userPrefController = Get.put(UserPrefService());

  checkOtpForChangePassword(String phoneNumber, String otp) async {
    try {
      var mapData = <String, dynamic>{};
      mapData['otp'] = otp;
      mapData['country_code'] = "+91";
      mapData['username'] = phoneNumber;

      var url = 'verifyOTP';

      var response = await HttpServices.httpPostWithoutToken(url, mapData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);
          Get.to(ChangePasswordScreen(
              otp: otp, usernameOrPhoneNumber: mapData['username']));
          // Get.offAllNamed(Routes.changePasswordScreen, arguments: [
          //   {
          //     'userName': mapData['phone_number'],
          //     'otp': otp,
          //   }
          // ]);

          isError(false);
          errorMessage("");
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "201") {
          showToast(jasonData['message']);
        } else {
          errorMessage(jasonData['message'].toString());
        }
      } else {
        isError(true);
        errorMessage(GlobalMessages.internalservererror);
      }
    } catch (e) {
      if (e is SocketException) {
        showToast(GlobalMessages.socketExceptionMessage);
      } else if (e is TimeoutException) {
        showToast(GlobalMessages.timeoutExceptionMessage);
      } else {
        showToast(e.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
