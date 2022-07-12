// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/onBoarding/onboarding_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/slider_widget.dart';
import '../../widgets/buttons/round_button_with_border.dart';
import '../../widgets/buttons/round_button_with_icon.dart';
import '../../widgets/container_with_inner_shadow.dart';
import '../home/Homepage Services/dashboard_services.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  GlobalKey<OnBoardingSliderWidgetState> globalKey = GlobalKey();

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  int _index = 0;

  final CarouselController _controller = CarouselController();

  List<OnBoardingScreenData> data = [
    OnBoardingScreenData(
        title: 'key_find_a_lab'.tr,
        discription: 'key_onboarding1_discription'.tr,
        imagePath: 'assets/images/onboarding-1.png'),
    OnBoardingScreenData(
        title: 'key_book_an_appointment'.tr,
        discription: 'key_onboarding2_discription'.tr,
        imagePath: 'assets/images/onboarding-2.png'),
    OnBoardingScreenData(
        title: 'key_make_payment'.tr,
        discription: 'key_onboarding3_discription'.tr,
        imagePath: 'assets/images/onboarding-3.png'),
  ];
  var dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    dashboardController.getDashboardData();
    _disableOnBoading();
    super.initState();
  }

  _disableOnBoading() async {
    await OnBoadingPrefService.setOnBoaringScreenDisable(false);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: ThemeClass.whiteColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: ThemeClass.whiteColor,
          body: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height / 2.4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Center(child: Image.asset(data[_index].imagePath)),
                ),
                ContainerWithInnerShadow(
                  width: width,
                  height: height / 2.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OnBoardingSliderWidget(
                          controller: _controller,
                          key: widget.globalKey,
                          sliderData: data,
                          callBack: (value) {
                            setState(() {
                              _index = value;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.3,
                              child: BorderRoundButton(
                                onTap: () {
                                  Get.toNamed(Routes.homeScreen);
                                },
                                buttonLabel: Text(
                                  'key_skip'.tr,
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
                                label: 'key_onboarding_next_btn'.tr,
                                onTap: () {
                                  if (_index < 2) {
                                    _controller.nextPage();

                                    // widget.globalKey.currentState!.onNextPress();
                                    setState(() {
                                      _index++;
                                    });
                                  } else {
                                    Get.toNamed(Routes.homeScreen);
                                  }
                                },
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
        ),
      ),
    );
  }
}

class OnBoardingScreenData {
  OnBoardingScreenData({
    required this.title,
    required this.discription,
    required this.imagePath,
  });

  String title;
  String discription;
  String imagePath;
}
