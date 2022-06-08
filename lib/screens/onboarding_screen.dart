// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/slider_widget.dart';
import '../widgets/buttons/round_button_with_border.dart';
import '../widgets/buttons/round_button_with_icon.dart';
import '../widgets/container_with_inner_shadow.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  GlobalKey<OnBoardingSliderWidgetState> globalKey = GlobalKey();

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  int _index = 0;

  // isImageIndexChanged(currentIndex) {
  //   setState(() {
  //     index = currentIndex;
  //   });
  //   print(index);
  // }

  CarouselController _controller = CarouselController();

  List<OnBoardingScreenData> data = [
    OnBoardingScreenData(
        title: 'Find A Lab',
        discription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
        imagePath: 'assets/images/onboarding-1.png'),
    OnBoardingScreenData(
        title: 'Book An Appointment',
        discription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
        imagePath: 'assets/images/onboarding-2.png'),
    OnBoardingScreenData(
        title: 'Make A Payment',
        discription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
        imagePath: 'assets/images/onboarding-3.png'),
  ];

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
                                onTap: () {
                                  if (_index < 2) {
                                    _controller.nextPage();

                                    // widget.globalKey.currentState!.onNextPress();
                                    setState(() {
                                      _index++;
                                    });
                                  } else {
                                    Get.toNamed(Routes.loginScreen);
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
