import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(
            appbarTitle: "Contact Us",
            elevation: 20,
          ),
        ),
        body: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Column(
              children: [
                const SizedBox(height: 25),
                Image.asset(
                  "assets/images/contact-us.png",
                  height: height * 0.3,
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: height * 0.23,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: ThemeClass.orangeColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Emergency Help Needed?",
                              style: TextStyle(
                                color: ThemeClass.redColor1,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Divider(
                              height: height * 0.09,
                              thickness: 1,
                              color: ThemeClass.orangeColor,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/icon-phone-red.png",
                                  height: 40,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "987 654 3210",
                                  style: TextStyle(
                                    height: 0.8,
                                    color: ThemeClass.redColor1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
        bottomNavigationBar: Container(
          height: height * 0.1,
          padding: const EdgeInsets.all(15),
          child: RoundButton(
            verticalPadding: 10,
            buttonLabel: 'Call Us',
            onTap: () {
              _makePhoneCall('9876543210');
            },
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

_makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
