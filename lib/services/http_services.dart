// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';

class HttpServices {
  static String API_BASE_URL = "http://oyolab.codefencers.com/api/customer/";

  static Map<String, String> requestHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
    "Request-From": Platform.isAndroid ? "Android" : "Ios",
    HttpHeaders.acceptLanguageHeader: 'en'
  };

  static Future<Response> httpGetWithoutToken(String url) async {
    return http.get(
      Uri.parse(API_BASE_URL + url),
      headers: requestHeaders,
    );
  }

  static Future<Response> httpGet(String url) async {
    var token = await UserPrefService().getToken();

    print(API_BASE_URL + url);

    return http.get(
      Uri.parse(API_BASE_URL + url),
      headers: requestHeaders
        ..addAll({
          'Authorization': 'Bearer $token',
        }),
    );
  }

  static Future<Response> httpGetForLogout(String url) async {
    var token = await UserPrefService().getToken();

    print(API_BASE_URL + url);

    return http.get(
      Uri.parse(API_BASE_URL + url),
      headers: requestHeaders
        ..addAll({
          'Authorization': 'Bearer $token',
        }),
    );
  }

  static Future<Response> httpPost(String url, dynamic data,
      {BuildContext? context}) async {
    var token = await UserPrefService().getToken();

    return http.post(
      Uri.parse(API_BASE_URL + url),
      body: jsonEncode(data),
      headers: requestHeaders
        ..addAll({
          'Authorization': 'Bearer $token',
        }),
    );
  }

  static Future<Response> httpPostWithoutToken(String url, dynamic data) async {
    return http.post(
      Uri.parse(API_BASE_URL + url),
      body: jsonEncode(data),
      headers: requestHeaders,
    );
  }

  static Future<Response> httpPostWithImageUpload(
      String url, File? imageFile, Map<String, dynamic> queryParameters,
      {required String peramterName}) async {
    try {
      var request3 = http.MultipartRequest(
        'POST',
        Uri.parse(API_BASE_URL + url),
      );
      request3.headers.addAll(requestHeaders);

      request3.files.add(await http.MultipartFile.fromPath(
        peramterName,
        "${imageFile!.path}",
        // contentType: MediaType('image', 'jpg'),
      ));
      queryParameters.forEach((key, value) {
        request3.fields[key] = value;
      });

      StreamedResponse res3 = await request3.send();
      var response = await http.Response.fromStream(
        res3,
      );

      return response;
    } catch (e) {
      print(e.toString());

      rethrow;
    }
  }

  static Future<Response> httpPostWithMultipleImageUpload(
      String url, List<XFile> imageFiles, Map<String, dynamic> queryParameters,
      {required String peramterName}) async {
    try {
      var request3 = http.MultipartRequest(
        'POST',
        Uri.parse(API_BASE_URL + url),
      );
      var token = await UserPrefService().getToken();
      request3.headers.addAll(requestHeaders);
      request3.headers.addAll({
        'Authorization': 'Bearer $token',
      });

      //

      for (int i = 0; i < imageFiles.length; i++) {
        request3.files.add(await http.MultipartFile.fromPath(
          peramterName,
          "${imageFiles[i].path}",
        ));
      }
      queryParameters.forEach((key, value) {
        request3.fields[key] = value;
      });

      StreamedResponse res3 = await request3.send();
      var response = await http.Response.fromStream(
        res3,
      );

      return response;
    } catch (e) {
      print(e.toString());

      rethrow;
    }
  }
}
