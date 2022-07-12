import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';

class LogoutController extends GetxController {
  RxBool isError = false.obs;
  var errorMessage = "".obs;
  var isloading = false.obs;
  logout(context) async {
    var value = await showAlertDialog(context);
    print(value);
    if (value == true) {
      isloading(true);

      try {
        var response = await HttpServices.httpGet("logout");
        var res = jsonDecode(response.body);
        if (response.statusCode == 201 || response.statusCode == 200) {
          if (res['success'].toString() == "1" &&
              res['status'].toString() == "200") {
            await UserPrefService().removeUserData();
            showToast(GlobalMessages.logoutSuccess);
            Get.offAllNamed(Routes.loginScreen);
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
