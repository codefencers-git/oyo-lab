// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'package:oyo_labs/screens/onboarding_screen.dart';
import 'package:oyo_labs/themedata.dart';

class OnBoardingSliderWidget extends StatefulWidget {
  OnBoardingSliderWidget({
    Key? key,
    required this.sliderData,
    required this.callBack,
    required this.controller,
  }) : super(key: key);
  List<OnBoardingScreenData> sliderData;
  Function callBack;
  CarouselController controller;

  @override
  State<OnBoardingSliderWidget> createState() => OnBoardingSliderWidgetState();
}

class OnBoardingSliderWidgetState extends State<OnBoardingSliderWidget> {
  int _current = 0;

  List<Widget> imageSliders = [];

  // onNextPress() {
  //   _controller.nextPage();
  // }

  @override
  void initState() {
    super.initState();
    imageSliders = widget.sliderData
        .map((item) => Container(
              margin: const EdgeInsets.only(left: 5, right: 5, top: 15),
              child: Column(
                children: [
                  Text(
                    item.title.toString(),
                    style: TextStyle(
                        fontSize: 24,
                        color: ThemeClass.blackColor1,
                        fontWeight: FontWeight.w800),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(right: 30, left: 30, top: 30),
                    child: Text(
                      item.discription.toString(),
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.7,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.greyColor),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.sliderData
              .map((item) => Container(
                    margin: const EdgeInsets.only(left: 5, right: 5, top: 15),
                    child: Column(
                      children: [
                        Text(
                          item.title.toString(),
                          style: TextStyle(
                              fontSize: 24,
                              color: ThemeClass.blackColor1,
                              fontWeight: FontWeight.w800),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, top: 30),
                          child: Text(
                            item.discription.toString(),
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.7,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ThemeClass.greyColor),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
          carouselController: widget.controller,
          options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  widget.callBack(index);
                  // OnboardingScreen().isImageIndexChanged(_current);
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.sliderData.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => widget.controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? ThemeClass.orangeColor
                        : ThemeClass.orangeColor.withOpacity(0.1)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
