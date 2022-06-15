import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/laboratory_tile.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_book_slot.dart';

import '../../routes.dart';

class AllLabTests extends StatelessWidget {
  const AllLabTests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "Lab Tests"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                color: ThemeClass.skyblueColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width / 2.9,
                      child: Row(
                        children: [
                          Image.asset("assets/icons/icon_short.png",
                              height: 20),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Short by : Relevance",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                      color: ThemeClass.orangeColor,
                    ),
                    SizedBox(
                      width: width / 2.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/icon_filter.png",
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Test',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.blackColor),
                    ),
                    Row(
                      children: [
                        Text(
                          '34,001 Test available',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: ThemeClass.orangeColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return const AllLabs();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllLabs extends StatelessWidget {
  const AllLabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: ThemeClass.orangeLightColor,
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: Offset(5, 3),
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/laboratory_image.png",
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
                    empty: _image('assets/images/blank_star.png'),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.7),
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
            padding: const EdgeInsets.only(top: 5),
            child: RoundButtonBookSlot(
              onTap: () {
                Get.toNamed(Routes.labTileScreen);
                print("object");
              },
              label: 'Book a Slot',
            ),
          ),
          // comment
        ],
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
