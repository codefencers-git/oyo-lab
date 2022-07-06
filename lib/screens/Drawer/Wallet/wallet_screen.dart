import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/themedata.dart';
import '../../../widgets/appbar/appbar_with_back_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(appbarTitle: 'key_wallet'.tr),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xffFE7949),
                    Color(0xffFF9B77),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'key_available_balance'.tr,
                    style: const TextStyle(
                        fontSize: 12,
                        color: ThemeClass.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "₹12000.00",
                    style: TextStyle(
                        fontSize: 14,
                        color: ThemeClass.whiteColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'key_wallet_history'.tr,
                  style: TextStyle(
                      fontSize: 16,
                      color: ThemeClass.blackColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            color: ThemeClass.orangeLightColor2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'key_date'.tr,
                    style: TextStyle(
                        fontSize: 12,
                        color: ThemeClass.blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'key_amount'.tr,
                    style: TextStyle(
                        fontSize: 12,
                        color: ThemeClass.blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          _amountStatus(),
        ],
      ),
    );
  }

  Expanded _amountStatus() {
    return Expanded(
      child: ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Oct 19, 2021",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "04:00 PM",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: ThemeClass.greyColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '+ ₹50.00',
                          style: TextStyle(
                              fontSize: 12,
                              color: ThemeClass.greenColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Failed',
                          style: TextStyle(
                              fontSize: 8,
                              color: ThemeClass.redColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.2,
                indent: 2,
                endIndent: 2,
                color: ThemeClass.greyColor2,
              ),
            ],
          );
        },
      ),
    );
  }
}
