import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../widgets/buttons/round_book_slot.dart';
import 'lab_test.dart';

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
              const ImageIcon(AssetImage("assets/icons/icon-location.png")),
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
                                    const SizedBox(height: 5),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Laboratory Near by You",
                      style: TextStyle(
                          fontSize: 14,
                          color: ThemeClass.blackColor,
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'View All',
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
                    return Container(
                      decoration: BoxDecoration(
                        color: ThemeClass.orangeLightColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
                            offset: Offset(5, 10),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/752ba49a-33d.png",
                            width: width / 2.1,
                            // height: height / 3,
                            fit: BoxFit.cover,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 8.0,
                              top: 10,
                            ),
                            child: Text(
                              "Green Cross Laboratory",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 8.0,
                              top: 5,
                            ),
                            child: Text(
                              "1 Km Away",
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5.0,
                              top: 0.2,
                            ),
                            child: Row(
                              children: [
                                RatingBar(
                                  initialRating: 3,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemSize: 16,
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  ratingWidget: RatingWidget(
                                    full: _image('assets/images/full_star.png'),
                                    half: _image('assets/images/half_star.png'),
                                    empty:
                                        _image('assets/images/blank_star.png'),
                                  ),
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 0.7),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    '4.0',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: ThemeClass.redColor,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    '(120)',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: ThemeClass.blackColor,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: RoundButtonBookSlot(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LabTestScreen()),
                                );
                              },
                              label: 'Book a Slot',
                            ),
                          ),
                          // comment
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _image(String s) {
    return Image.asset(
      s,
      height: 20,
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
