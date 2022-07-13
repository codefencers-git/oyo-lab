import 'dart:async';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/authentication/Login/user_model.dart';
import 'package:oyo_labs/services/http_services.dart';
import '../../../services/SharedPrefServices/shared_pref_services.dart';

class MobileVerificationController extends GetxController {
  var isError = false.obs;
  var errorMessage = "".obs;
  var isLoading = false.obs;

  var userPrefController = Get.put(UserPrefService());

  checkOtp(String phoneNumber, String otp) async {
    try {
      var mapData = <String, dynamic>{};
      mapData['otp'] = otp;
      mapData['country_code'] = "+91";
      mapData['phone_number'] = phoneNumber;

      var url = 'activeAccount';

      var response = await HttpServices.httpPostWithoutToken(url, mapData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);
          Get.toNamed(Routes.mobileVerificationScreen, arguments: [
            {'route': 'signupScreen'},
            {'phoneNumber': mapData['phone_number'].toString()}
          ]);
          UserModel userData = UserModel.fromJson(jasonData);

          userPrefController.setUserData(userModel: userData);
          userPrefController.setToken(userData.data!.token);

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

  checkOtpForChangePassword(String phoneNumber, String otp) async {
    try {
      var mapData = <String, dynamic>{};
      mapData['otp'] = otp;
      mapData['country_code'] = "+91";
      mapData['phone_number'] = phoneNumber;

      var url = 'reset-password';

      var response = await HttpServices.httpPostWithoutToken(url, mapData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);
          Get.offAllNamed(Routes.changePasswordScreen, arguments: [
            {
              'userName': mapData['phone_number'],
              'otp': otp,
            }
          ]);

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