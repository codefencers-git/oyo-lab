import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';

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

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: AppBar(
          backgroundColor: ThemeClass.orangeColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ImageIcon(
                AssetImage("assets/icons/icon-hamberger.png"),
              ),
            ),
          ),
          title: Row(
            children: [
              ImageIcon(AssetImage("assets/icons/icon-location.png")),
              Text(
                " Ahmedabad",
                style: TextStyle(
                    fontSize: 14,
                    color: ThemeClass.whiteColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ThemeClass.skyblueColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(25),
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
                                        height: 1.5,
                                        fontSize: 14,
                                        color: ThemeClass.blackColor1,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Also save more with online\npayment offers",
                                    softWrap: true,
                                    style: TextStyle(
                                        height: 1.5,
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
                  viewportFraction: 0.95,
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
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
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
        ),
      ),
    );
  }
}
