import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/Drawer/CMS%20data/cms_service.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  CmsServices cmsDataController = Get.find<CmsServices>();

  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  WebViewController? _webController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
          appbarTitle: 'key_about_us'.tr,
          elevation: 20,
        ),
      ),
      body: Obx(
        () => Scaffold(
          body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: Uri.encodeFull(
              cmsDataController.globleCmsData.value.about.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
