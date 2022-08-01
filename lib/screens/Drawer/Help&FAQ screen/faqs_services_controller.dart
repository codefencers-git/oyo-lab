import 'dart:convert';
import 'package:get/get.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/services/http_services.dart';
import 'faqs_model.dart';

class FAQsController extends GetxController {
  RxList<FAQsData?> faqsData = (List<FAQsData?>.of([])).obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isloading = false.obs;
  Future<void> getFAQsData() async {
    isloading(true);
    try {
      String url = 'faqs';
      var response = await HttpServices.httpGetWithoutToken(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jasonData = json.decode(response.body);

        if (jasonData['status'] == "200" && jasonData['success'] == "1") {
          isError(false);
          errorMessage("");
          FAQsModel faqs = FAQsModel.fromJson(jasonData);

          faqsData(faqs.data);
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
      print("dashoard    --  $e");
      errorMessage(e.toString());
    } finally {
      isloading(false);
    }
  }
}
