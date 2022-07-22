import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/screens/Drawer/Profile/profile_model.dart';

import '../../../global/global_messages.dart';
import '../../../services/http_services.dart';

class ProfileServiceController extends GetxController {
  RxString errorMessage = "".obs;
  RxBool isError = false.obs;
  RxBool isloading = false.obs;
  Rx<ProfileData> profileData = ProfileData().obs;

  showdialog() {
    Get.dialog(
      Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.white,
          child: const Text("code here"),
        ),
      ),
    );
  }

  Future getprofileData() async {
    isloading(true);
    try {
      var url = 'get_myProfile';
      var response = await HttpServices.httpGet(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          var dashboardData1 = ProfileModel.fromJson(jasonData);

          profileData(dashboardData1.data);
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

  Future updateProfileData(mapdata, context) async {
    try {
      var url = 'updateProfile';
      var response =
          await HttpServices.httpPost(url, mapdata, context: context);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData["message"]);
        } else {
          showToast(jasonData["message"]);
        }
      } else {
        showToast(GlobalMessages.internalservererror);
      }
    } catch (e) {
      showToast(e.toString());
    }
  }
}
