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
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 15),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: const Color(0xffF3FAFF),
                      child: Image(
                        image: AssetImage(imgList[0]),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  final int _current = 0;
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
            onTap: () {
             
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ImageIcon(
                AssetImage("assets/icons/icon-hamberger.png"),
              ),
            ),
          ),
          title: Row(
            children: const [
              ImageIcon(AssetImage("assets/icons/icon-location.png")),
              Text(" Ahmedabad"),
            ],
          ),
        ),
        body: Column(
          children: [
            // CarouselSlider(
            //   items: imageSliders,
            //   carouselController: _controller,
            //   options: CarouselOptions(
            //       autoPlay: true,
            //       enlargeCenterPage: false,
            //       aspectRatio: 2.0,
            //       enableInfiniteScroll: false,
            //       viewportFraction: 0.9,
            //       initialPage: 1,
            //       onPageChanged: (index, reason) {
            //         setState(() {
            //           _current = index;
            //         });
            //       }),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: imgList.asMap().entries.map((entry) {
            //     return GestureDetector(
            //       onTap: () => _controller.animateToPage(entry.key),
            //       child: Container(
            //         width: 7.0,
            //         height: 7.0,
            //         margin: const EdgeInsets.symmetric(
            //             vertical: 8.0, horizontal: 4.0),
            //         decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: (Theme.of(context).brightness == Brightness.dark
            //                     ? Colors.white
            //                     : Colors.black)
            //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            //       ),
            //     );
            //   }).toList(),
            // ),
            Container(
              width: width,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: ThemeClass.skyblueColor,
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "50% Off",
                          style: TextStyle(
                              fontSize: 24,
                              color: ThemeClass.redColor,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "On your first booking",
                          style: TextStyle(
                              fontSize: 14,
                              color: ThemeClass.blackColor1,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/home-page-slider.png',
                    width: width * 0.5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
