import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/lab_test_detail_model.dart';
import 'package:oyo_labs/services/http_services.dart';
import '../../../services/SharedPrefServices/shared_pref_services.dart';

class BookAppointmentServicesController extends GetxController {
  Future<void> bookAppointmentService(dynamic parameters, imageFile) async {
    RxBool isError = false.obs;
    RxString errorMessage = "".obs;
    RxBool isloading = false.obs;

    isloading(true);
    String url="place_order";
    try {
      var response = await HttpServices.httpPostWithImageUpload(url, imageFile, parameters, peramterName: 'prescription');
      
      // ("place_order", parameters);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);

          isError(false);
          errorMessage("");
        } else if (jasonData['success'].toString() == "0" &&
            jasonData['status'].toString() == "201") {
          showToast(jasonData['message']);
        } else {
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

  Rx<LAbTestDetailData> testDetails = LAbTestDetailData().obs;
  Rx<RecommendedProduct> labData = RecommendedProduct().obs;

  tempBookingData(testData, labDetail) {
    testDetails(testData);
    labData(labDetail);

    print(testDetails);
    print(labDetail);
  }
}
