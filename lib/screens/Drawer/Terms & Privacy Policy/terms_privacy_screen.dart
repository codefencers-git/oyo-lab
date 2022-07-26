import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../CMS data/cms_service.dart';

class TermsAndPrivacyScreen extends StatefulWidget {
  const TermsAndPrivacyScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndPrivacyScreen> createState() => _TermsAndPrivacyScreenState();
}

class _TermsAndPrivacyScreenState extends State<TermsAndPrivacyScreen> {
  CmsServices cmsDataController = Get.find<CmsServices>();
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: 'key_terms_policy'.tr),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: cmsDataController.globleCmsData.value.terms.toString(),
        ),
      ),
    );
  }
}
