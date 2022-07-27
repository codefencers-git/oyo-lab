import 'dart:convert';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/Drawer/ManageAddress/services%20and%20model/address_model.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';

class AddressServicesController extends GetxController {
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;
  RxBool isSaveAddressLoading = false.obs;

  RxList<AddrressData?> addressData = (List<AddrressData?>.of([])).obs;

  Future<void> getAddressList() async {
    isloading(true);
    try {
      String url = 'get_addresses';
      var response = await HttpServices.httpGet(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          AddressModel address = AddressModel.fromJson(jasonData);

          addressData(address.data);
        } else {
          isError(true);
          errorMessage(jasonData['message'].toString());
        }
      } else if (response.statusCode == 401) {
        showToast(GlobalMessages.unauthorizedUser);
        await UserPrefService().removeUserData();
        Get.offAllNamed(Routes.loginScreen);
      } else {
        showToast(GlobalMessages.somethingwentwongMessage);
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }

  Future<void> saveAddress(queryParameters) async {
    try {
      String url = 'save_address';
      var response = await HttpServices.httpPost(url, queryParameters);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          Get.back();
          getAddressList();
        } else {
          isError(true);
          errorMessage(jasonData['message'].toString());
        }
      } else if (response.statusCode == 401) {
        showToast(GlobalMessages.unauthorizedUser);
        await UserPrefService().removeUserData();
        Get.offAllNamed(Routes.loginScreen);
      } else {
        showToast(GlobalMessages.somethingwentwongMessage);
      }
    } catch (e) {
      isError(true);
      print("----------$e");
      errorMessage(e.toString());
    }
  }

  Future<void> deleteAddress(String addressId) async {
    isloading(true);
    try {
      var url = 'delete_address';

      Map<String, String> queryParameters = {"address_id": addressId};

      var response = await HttpServices.httpPost(url, queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          Get.back();
          showToast(jasonData['message']);

          await getAddressList();

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

  Future<void> addAddress({
    required String name,
    required String address1,
    required String address2,
    required String addressType,
    required String pincode,
  }) async {
    try {
      String type = "";
      if (addressType == "home") {
        type = "Home";
      } else if (addressType == "office") {
        type = "Office";
      } else {
        type = "Other";
      }
      String url = 'save_address';
      Map<String, String> queryParameters = {
        "name": name,
        "address_line_1": address1,
        "address_line_2": address2,
        "address_type": type,
        "pincode": pincode,
      };

      print(queryParameters);
      // // var response = await HttpServices.httpPost(url, queryParameters);

      // // if (response.statusCode == 200 || response.statusCode == 201) {
      // //   final jasonData = json.decode(response.body);

      // //   if (jasonData['status'] == "200" && jasonData['success'] == "1") {
      // //     isError(false);
      // //     errorMessage("");
      // //     AddressModel address = AddressModel.fromJson(jasonData);

      // //     addressData(address.data);
      // //   } else {
      // //     isError(true);
      // //     errorMessage(jasonData['message'].toString());
      // //   }
      // } else {
      //   isError(true);
      //   errorMessage(GlobalMessages.internalservererror);
      // }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }
}
