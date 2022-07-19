import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/authentication/Login/user_model.dart';
import 'package:oyo_labs/screens/authentication/Mobile%20Verification/mobile_verification_screen.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';

class UserController extends GetxController {
  var userPrefController = Get.put(UserPrefService());

  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;
  RxBool islogin = false.obs;

  loginServices(dynamic mapData) async {
    try {
      String url = 'login';
      var response = await HttpServices.httpPostWithoutToken(url, mapData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          UserModel userData = UserModel.fromJson(jasonData);

          userPrefController.setUserData(userModel: userData);
          userPrefController.setToken(userData.data!.token);
          print("------------Token" + userData.data!.token.toString());
          islogin(true);
          print(
              "------------login done------------" + islogin.value.toString());

          debugPrint(jasonData['message']);
          showToast(jasonData['message']);
          Get.toNamed(Routes.homeScreen);

          isError(false);
          errorMessage("");
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "201") {
          showToast(jasonData['message']);
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "202") {
          Get.to(
            MobileVerification(
                fromScreen: "login",
                userNameorPhoneNumber: mapData['username'].toString()),
          );
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

//------------------- Sign up services
  signupServices(dynamic mapData) async {
    try {
      var url = 'registration';
      var response = await HttpServices.httpPostWithoutToken(url, mapData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);
          Get.to(MobileVerification(
              fromScreen: 'signUp',
              userNameorPhoneNumber: mapData['phone_number'].toString()));
          islogin(true);

          isError(false);
          errorMessage("");
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "201") {
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

//------------------- Mobile verification
  checkOtp(String phoneNumber, String otp) async {
    try {
      var mapData = <String, dynamic>{};
      mapData['otp'] = otp;
      mapData['country_code'] = "+91";
      mapData['username'] = phoneNumber;

      var url = 'activeAccount';

      var response = await HttpServices.httpPostWithoutToken(url, mapData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);

          UserModel userData = UserModel.fromJson(jasonData);

          Get.offAllNamed(Routes.homeScreen);

          userPrefController.setUserData(userModel: userData);
          userPrefController.setToken(userData.data!.token);
          islogin(true);
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
      isError(true);
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }
}
