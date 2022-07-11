import 'dart:convert';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/authentication/Login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefService extends GetxController {
  static SharedPreferences? preferences;

  var globleUserModel = UserModel().obs;
  var token = "".obs;

  Future<void> setUserData({required UserModel? userModel}) async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setString('userModel', jsonEncode(userModel));
    globleUserModel(userModel);
  }

  Future<void> setToken(value) async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setString('token', value);
    token = value;
  }

  Future<String?> getToken() async {
    preferences = await SharedPreferences.getInstance();
    var data = preferences!.getString('token');
    return data;
  }

  Future<void> removeToken(value) async {
    preferences = await SharedPreferences.getInstance();
    preferences!.remove('token');
  }

  Future<UserModel> getUserData() async {
    preferences = await SharedPreferences.getInstance();
    var temp = preferences!.getString("userModel");
    var dataToRetun = UserModel.fromJson(jsonDecode(temp.toString()));
    globleUserModel(dataToRetun);
    return dataToRetun;
  }

  Future<void> removeUserData() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.remove('userModel');
  }
}
