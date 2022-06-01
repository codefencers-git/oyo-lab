import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oyo_labs/screens/home/drawer_sceen.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oyo_labs/widgets/appbar/homepage_appbar.dart';

import '../../widgets/buttons/round_book_slot.dart';
import '../../widgets/buttons/round_button_with_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> imgList = [
  'assets/images/home-page-slider.png',
  'assets/images/home-page-slider.png',
  'assets/images/home-page-slider.png',
];
var scaffoldKey = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: HomePageAppBar(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: DrawerWidget(width: width),
        body: Column(
          children: [
            _buildCarouselSlider(width),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Laboratory Near by You",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ThemeClass.blackColor2),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ThemeClass.orangeColor),
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_right_rounded,
                          size: 26,
                          color: ThemeClass.orangeColor,
                        )
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

  Column _buildCarouselSlider(double width) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => Container(
                    margin: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        color: ThemeClass.skyblueColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "50% Off",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: ThemeClass.redColor,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "On your first\nbooking",
                                softWrap: true,
                                style: TextStyle(
                                    height: 1.6,
                                    fontSize: 14,
                                    color: ThemeClass.blackColor1,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Also save more with online\npayment offers",
                                softWrap: true,
                                style: TextStyle(
                                    height: 1.6,
                                    fontSize: 10,
                                    color: ThemeClass.greyColor1,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/home-page-slider.png',
                          width: width * 0.51,
                          // fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              enableInfiniteScroll: false,
              viewportFraction: 0.91,
              initialPage: 0,
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
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? ThemeClass.orangeColor
                        : ThemeClass.orangeColor.withOpacity(0.2)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}


