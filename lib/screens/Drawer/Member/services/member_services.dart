import 'dart:convert';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/Drawer/Member/Model/members_model.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/http_services.dart';

class MembersController extends GetxController {
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;

  RxList<MemberData?> memberData = (List<MemberData?>.of([])).obs;

  Future<void> getMembersList() async {
    isloading(true);

    Map<String, String> queryParameters = {"serach": ""};

    try {
      String url = 'members';
      var response = await HttpServices.httpPost(url, queryParameters);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          MemberModel members = MemberModel.fromJson(jasonData);

          memberData(members.data);
        } else {
          isError(true);
          errorMessage(jasonData['message'].toString());
        }
      } else if (response.statusCode == 401) {
        isError(true);
        showToast(GlobalMessages.unauthorizedUser);
        UserPrefService().setIsLogin(false);
        await UserPrefService().removeUserData();
        Get.offAllNamed(Routes.loginScreen);
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

  Future<void> updateMemberDetail(
      String name, String dob, String email, String phoneNumber,
      [String? memberId]) async {
    isloading(true);
    try {
      var url = 'save_member';

      Map<String, String> queryParameters = {
        "name": name,
        "dob": dob,
        "email": email,
        "phone_number": phoneNumber,
        "profile_image": ""
      };

      if (memberId != null) {
        queryParameters.addAll({
          "member_id": memberId.toString(),
        });
      }

      var response = await HttpServices.httpPost(url, queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);

          await getMembersList();

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

  Future<void> deleteMember(String memberId) async {
    isloading(true);
    try {
      var url = 'delete_member';

      Map<String, String> queryParameters = {"member_id": memberId};

      var response = await HttpServices.httpPost(url, queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = jsonDecode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          showToast(jasonData['message']);

          await getMembersList();

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
}
