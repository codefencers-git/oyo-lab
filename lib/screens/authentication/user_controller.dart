import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/authentication/Login/user_model.dart';
import 'package:oyo_labs/screens/authentication/Mobile%20Verification/mobile_verification_screen.dart';
import 'package:oyo_labs/screens/home/home_page.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';
import 'package:oyo_labs/services/navigation_service.dart';

class UserController extends GetxController {
  // UserPrefService userPrefController = Get.find<UserPrefService>();

  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  RxBool setIsLogin = false.obs;

  loginServices(dynamic mapData) async {
    isloading(true);
    try {
      String url = 'login';
      var response = await HttpServices.httpPostWithoutToken(url, mapData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          UserModel userData = UserModel.fromJson(jasonData);

          await UserPrefService().setUserData(userModel: userData);
          await UserPrefService().setToken(userData.data!.token);

          setIsLogin(true);
          debugPrint(jasonData['message']);
          showToast(jasonData['message']);
          // Get.toNamed(Routes.homeScreen);
          Navigator.pushAndRemoveUntil<void>(
            navigationService.navigationKey.currentContext!,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => HomePage()),
            ModalRoute.withName(Routes.loginScreen),
          );

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
          UserModel userData = UserModel.fromJson(jasonData);

          // UserPrefService().setUserData(userModel: userData);
          // UserPrefService().setToken(userData.data!.token);

          // setIsLogin(true);

          Get.to(MobileVerification(
              fromScreen: 'signUp',
              userNameorPhoneNumber: mapData['phone_number'].toString()));

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

          await UserPrefService().setUserData(userModel: userData);
          await UserPrefService().setToken(userData.data!.token);

          setIsLogin(true);

          isError(false);
          errorMessage("");
          Navigator.pushAndRemoveUntil<void>(
            navigationService.navigationKey.currentContext!,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => HomePage()),
            ModalRoute.withName(Routes.onboardingScreen),
          );
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

  logout(context) async {
    var value = await showAlertDialog(context);
    if (value == true) {
      isloading(true);

      try {
        var response = await HttpServices.httpGetForLogout("logout");
        var res = jsonDecode(response.body);
        if (response.statusCode == 201 || response.statusCode == 200) {
          if (res['success'].toString() == "1" &&
              res['status'].toString() == "200") {
            await UserPrefService().removeUserData();
            await UserPrefService().removeToken();
            showToast(GlobalMessages.logoutSuccess);

            setIsLogin(false);
            // Get.back();
            Navigator.pushAndRemoveUntil<void>(
              navigationService.navigationKey.currentContext!,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => HomePage()),
              ModalRoute.withName(Routes.loginScreen),
            );

            // Get.offAllNamed(Routes.homeScreen);
          } else {
            showToast(GlobalMessages.somethingwentwongMessage);
          }
        } else if (response.statusCode == 401) {
          showToast(GlobalMessages.unauthorizedUser);
          await UserPrefService().removeUserData();
          Get.offAllNamed(Routes.loginScreen);
        } else {
          showToast(GlobalMessages.somethingwentwongMessage);
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
        isloading(false);
      }
    }
  }

  Future showAlertDialog(BuildContext context) {
    // show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context1) {
        return AlertDialog(
          title: const Text('Confirmation.'),
          content: const Text('Are you sure to Logout?'),
          actions: [
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.pop(context1, false);
              },
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.pop(context1, true);
              },
            )
          ],
        );
      },
    );
  }
}
