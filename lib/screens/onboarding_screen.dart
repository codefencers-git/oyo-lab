import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import '../widgets/buttons/round_button_with_border.dart';
import '../widgets/buttons/round_button_with_icon.dart';
import '../widgets/container_with_inner_shadow.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.45,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child:
                  Center(child: Image.asset("assets/images/onboarding-1.png")),
            ),
            ContainerWithInnerShadow(
              width: width,
              height: height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Find A Lab",
                        style: TextStyle(
                            fontSize: 24,
                            color: ThemeClass.blackColor1,
                            fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ThemeClass.greyColor),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          onBoardingContentIndicator(),
                          onBoardingContentIndicator(),
                          onBoardingContentIndicator(),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          child: BorderRoundButton(
                            onTap: () {
                              Get.toNamed(Routes.loginScreen);
                            },
                            buttonLabel: Text(
                              "SKIP",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: ThemeClass.orangeColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.33,
                          child: RoundButtonWithIcon(
                            label: 'NEXT  ',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container onBoardingContentIndicator() {
    return Container(
      width: 10.0,
      height: 10.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: ThemeClass.orangeColor),
    );
  }
}
