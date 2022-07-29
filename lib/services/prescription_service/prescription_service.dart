import 'dart:convert';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/screens/Drawer/My%20Prescription/prescription_model.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';

class PrescriptionService extends GetxController {
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  Future<List<PrescriptionData>?> getPrescriptionList() async {
    try {
      String url = 'prescription';

      var response = await HttpServices.httpGet(
        url,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          var data = PrescriptionModel.fromJson(jasonData);
          return data.data;
        } else {
          throw jasonData['message'].toString();
        }
      } else if (response.statusCode == 401) {
        UserPrefService().setIsLogin(false);
        await UserPrefService().removeUserData();
        throw GlobalMessages.unauthorizedUser;
      } else {
        throw GlobalMessages.internalservererror;
      }
    } catch (e) {
      isError(true);
      errorMessage(e.toString());
      throw e.toString();
    } finally {
      isloading(false);
    }
  }
}
