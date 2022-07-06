// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
    // var token = await UserPrefService().getToken();

    print(API_BASE_URL + url);
    //  print(token);

    return http.get(
      Uri.parse(API_BASE_URL + url),
      headers: requestHeaders
        ..addAll({
          // 'Authorization': 'Bearer $token',
        }),
    );
  }

  static Future<Response> httpPost(String url, dynamic data,
      {required BuildContext context}) async {
    // var token = await UserPrefService().getToken();

    return http.post(
      Uri.parse(API_BASE_URL + url),
      body: jsonEncode(data),
      headers: requestHeaders
        ..addAll({
          //  'Authorization': 'Bearer $token',
        }),
      // headers: requestHeaders,
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
}
