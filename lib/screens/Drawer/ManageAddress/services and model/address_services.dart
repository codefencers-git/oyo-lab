import 'dart:convert';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/screens/Drawer/ManageAddress/services%20and%20model/address_model.dart';
import 'package:oyo_labs/services/http_services.dart';

class AddressServicesController extends GetxController {
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

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
