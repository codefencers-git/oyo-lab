import 'dart:convert';

import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment/appointment_model.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';

import 'package:oyo_labs/services/http_services.dart';

class AppointmentService {
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
        throw GlobalMessages.unauthorizedUser;
      } else {
        // isError(true);

        throw GlobalMessages.internalservererror;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
