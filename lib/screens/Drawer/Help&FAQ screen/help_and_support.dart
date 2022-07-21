import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';

import '../../../widgets/appbar/appbar_with_back_button.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  //late double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    // screenHeight = MediaQuery.of(context).size.height;
    // screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'key_help_&_faq'.tr),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 50.0,
        margin: EdgeInsets.all(16.0),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Text(
                "Select any topics",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              // trailing: Icon(
                              //   Icons.arrow_forward_ios,
                              //   color: ThemeClass.orangeColor,
                              //   size: 15,
                              // ),
                              title: Text(
                                'A guide to OYO LAB',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: ThemeClass.greyColor1),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    'pending from api',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 1.0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
