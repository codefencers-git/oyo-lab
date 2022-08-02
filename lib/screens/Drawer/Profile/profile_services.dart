import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/screens/Drawer/Profile/profile_model.dart';

import '../../../global/global_messages.dart';
import '../../../services/SharedPrefServices/shared_pref_services.dart';
import '../../../services/http_services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parse;

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
          var profileDetail = ProfileModel.fromJson(jasonData);

          profileData(profileDetail.data);
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
          return 1;
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

  Future uploadProfilePhotoImage(File? file) async {
    String fileName = file!.path.split('/').last;
    String url = HttpServices.API_BASE_URL + 'update_profilePicture';
    var token = await UserPrefService().getToken();
    Map<String, String> requestHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "Request-From": Platform.isAndroid ? "Android" : "Ios",
      HttpHeaders.acceptLanguageHeader: 'en',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll(requestHeaders);

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image', file.path,
        filename: fileName, contentType: http_parse.MediaType('image', 'jpg'));
    request.files.add(multipartFile);
    var response = await request.send();

    final res = await http.Response.fromStream(response);

    var data = jsonDecode(res.body);
    String message = data['message'];
    showToast(message);
    if (res.statusCode == 200) {
      if (data["status"] == "200") {
        return 1;
      }
    } else if (res.statusCode == 401) {}
    return response;
  }
}
