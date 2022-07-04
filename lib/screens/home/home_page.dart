import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/home/imagebottomsheet.dart';
import 'package:oyo_labs/screens/home/drawer_sceen.dart';
import 'package:oyo_labs/screens/laboratory/laboratory_tile.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/homepage_appbar.dart';

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
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        drawer: DrawerWidget(
          width: width,
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: HomePageAppBar(onTap: () {}),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                                      'key_homepage_slider_title'.tr,
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: ThemeClass.redColor,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      'key_homepage_slider_subtitle'.tr,
                                      softWrap: true,
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 14,
                                          color: ThemeClass.blackColor1,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'key_homepage_slider_description'.tr,
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
                                width: width / 2.5,
                                height: height / 3,
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                        ))
                    .toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 2,
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  cursorColor: ThemeClass.orangeColor,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ThemeClass.skyblueColor,
                    border: InputBorder.none,
                    hintText: 'key_searchbar_label'.tr,
                    hintStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    suffixIcon: SizedBox(
                      child:
                          Image.asset("assets/icons/icon_search.png", scale: 3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: ThemeClass.whiteColor2,
                  border: Border.all(width: 0, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(-5, 3),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'key_order_with_prescription'.tr,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'key_upload_prescription_description'.tr,
                                softWrap: true,
                                maxLines: 3,
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                          width: 100,
                          child: _uploadButton(context, width),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'key_test_near_by_you'.tr,
                      style: TextStyle(
                          fontSize: 14,
                          color: ThemeClass.blackColor,
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.allLabTests);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'key_view_all'.tr,
                            style: TextStyle(
                                fontSize: 14,
                                color: ThemeClass.orangeColor,
                                fontWeight: FontWeight.w900),
                          ),
                          Image.asset('assets/icons/arrowhead-right.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const LaboratoryTile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _uploadButton(BuildContext context, double width) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ThemeClass.orangeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return const SelectImageBottomSheet();
          },
        );
      },
      child: Text(
        'key_upload_btn_label'.tr,
        style: const TextStyle(
            fontSize: 14,
            color: ThemeClass.whiteColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

// Star Rating Class


// typedef void RatingChangeCallback(double rating);

// class StarRating extends StatelessWidget {
//   final int starCount;
//   final double rating;
//   final RatingChangeCallback onRatingChanged;
//   final Color color;

//   StarRating(
//       {this.starCount = 5,
//       this.rating = .0,
//       required this.onRatingChanged,
//       required this.color});

//   Widget buildStar(BuildContext context, int index) {
//     Icon icon;
//     if (index >= rating) {
//       icon = Icon(
//         Icons.star_border,
//         color: ThemeClass.redColor1,
//       );
//     } else if (index > rating - 1 && index < rating) {
//       icon = Icon(
//         Icons.star_half,
//         color: ThemeClass.redColor1,
//       );
//     } else {
//       icon = Icon(
//         Icons.star,
//         color: ThemeClass.redColor1,
//       );
//     }
//     return InkResponse(
//       onTap:
//           onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
//       child: icon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Row(
//           children:
//               List.generate(starCount, (index) => buildStar(context, index))),
//     );
//   }
// }
