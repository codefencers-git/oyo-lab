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
import 'book_appointment_model.dart';

class BookAppointmentServicesController extends GetxController {
  Rx<PaymentURL> paymentUrl = PaymentURL().obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  Future<void> bookAppointmentService(
      dynamic queryParameters, imageFiles) async {
    String url = "place_order";
    try {
      var response = await HttpServices.httpPostWithMultipleImageUpload(
        url,
        imageFiles,
        queryParameters,
        peramterName: "prescription[]",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);

          BookAppointmentModel bookAppointmentModel =
              BookAppointmentModel.fromJson(jasonData);

          paymentUrl(bookAppointmentModel.data);

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
        UserPrefService().setIsLogin(false);
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

  // upper code is not use more.

  RxString itemPrice = "".obs;
  RxString itemtitle = "".obs;
  RxString testID = "".obs;
  RxString laboratoryID = "".obs;
}
