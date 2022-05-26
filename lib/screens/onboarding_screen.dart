import 'package:carousel_slider/carousel_slider.dart';
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

final List<String> imgList = [
  'assets/images/onboarding-1.png',
  'assets/images/onboarding-2.png',
  'assets/images/onboarding-3.png',
];

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 15),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Column(
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
                  ],
                )),
          ))
      .toList();

  int _current = 0;
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
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: false,
                        aspectRatio: 2.0,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.9,
                        initialPage: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  // Column(
                  //   children: [
                  //     Text(
                  //       "Find A Lab",
                  //       style: TextStyle(
                  //           fontSize: 24,
                  //           color: ThemeClass.blackColor1,
                  //           fontWeight: FontWeight.w800),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(30),
                  //       child: Text(
                  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                  //         softWrap: true,
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500,
                  //             color: ThemeClass.greyColor),
                  //       ),
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         onBoardingContentIndicator(),
                  //         onBoardingContentIndicator(),
                  //         onBoardingContentIndicator(),
                  //       ],
                  //     ),
                  //   ],
                  // ),
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
