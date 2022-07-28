import 'dart:convert';

import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment/appointment_model.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';

import 'package:oyo_labs/services/http_services.dart';

import 'model and services/appointment_history_model.dart';

class AppointmentServiceController extends GetxController {
  Rx<AppointmentDetails> appointmentDetailData = AppointmentDetails().obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  Future<List<AppointmentData>?> getAppointment(bool isUpcoming) async {
    try {
      String url = 'booking_history';
      Map<String, String> queryParameters = {
        "type": isUpcoming ? "Upcoming" : "Completed",
      };
      var response = await HttpServices.httpPost(url, queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          var data = AppointmentModel.fromJson(jasonData);
          return data.data;
        } else {
          throw jasonData['message'].toString();
        }
      } else if (response.statusCode == 401) {
        await UserPrefService().removeUserData();
        UserPrefService().setIsLogin(false);
        throw GlobalMessages.unauthorizedUser;
      } else {
        // isError(true);

        throw GlobalMessages.internalservererror;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> appointmentHistoryServices(String appointmentId) async {
    String url = 'booking/$appointmentId';

    isloading(true);
    try {
      var response = await HttpServices.httpGet(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          AppointmentHistoryModel appointmentData =
              AppointmentHistoryModel.fromJson(jasonData);

          appointmentDetailData(appointmentData.data);
        } else {
          isError(true);
          errorMessage(jasonData['message'].toString());
        }
      } else if (response.statusCode == 401) {
        showToast(GlobalMessages.unauthorizedUser);
        UserPrefService().setIsLogin(false);
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
}
