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
}
