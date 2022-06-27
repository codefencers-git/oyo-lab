import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';

import '../../../widgets/appbar/appbar_with_back_button.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({Key? key}) : super(key: key);

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
          appbarTitle: "Refer And Earn",
          elevation: 20,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/refer_image.png'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Refer your friend and earn',
            style: TextStyle(
                color: ThemeClass.orangeColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'Your Friend gets 50 Mediheist points on signup and, you get 100 Mediheist points too everytime!',
              style: TextStyle(
                  color: ThemeClass.greyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DottedBorder(
              radius: Radius.circular(5),
              borderType: BorderType.RRect,
              color: ThemeClass.orangeColor,
              strokeWidth: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeClass.skyblueColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your referral code",
                              style: TextStyle(
                                  color: ThemeClass.greyColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "ABCD1234",
                              style: TextStyle(
                                  color: ThemeClass.blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                      color: ThemeClass.greyColor,
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/icon-copy.png",
                              height: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 20,
                              child: Text(
                                "Copy Code",
                                style: TextStyle(
                                    color: ThemeClass.greyColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(),
          SizedBox(
            height: 15,
          ),
          Text(
            "Share your Referral Code via",
            style: TextStyle(
                color: ThemeClass.orangeColor,
                fontSize: 14,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialButton("assets/icons/icon-whatsapp.png"),
              SizedBox(
                width: 10,
              ),
              _socialButton("assets/icons/icon-email.png"),
              SizedBox(
                width: 10,
              ),
              _socialButton("assets/icons/icon-share.png"),
            ],
          )
        ],
      ),
    );
  }

  Widget _socialButton(image) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeClass.blackColor,
            offset: const Offset(
              0,
              2,
            ),
            blurStyle: BlurStyle.inner,
            blurRadius: 80,
          ),
        ],
        color: ThemeClass.skyblueColor,
        image: DecorationImage(
          scale: 2.9,
          image: AssetImage(
            image,
          ),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
