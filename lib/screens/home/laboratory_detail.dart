import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oyo_labs/themedata.dart';

import '../../widgets/appbar/appbar_with_back_button.dart';

class LaboratoryDetail extends StatefulWidget {
  const LaboratoryDetail({Key? key}) : super(key: key);

  @override
  State<LaboratoryDetail> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LaboratoryDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        // backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: "Green Cross Laboratory"),
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset("assets/images/all_laboratories.png"),
                Positioned(
                  top: 133,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeClass.skyblueColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Green Cross Laboratory",
                            style: TextStyle(
                              fontSize: 14,
                              color: ThemeClass.blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    RatingBar(
                                      initialRating: 3,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemSize: 16,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      ratingWidget: RatingWidget(
                                        full: _image(
                                            'assets/images/full_star.png'),
                                        half: _image(
                                            'assets/images/half_star.png'),
                                        empty: _image(
                                            'assets/images/blank_star.png'),
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 8.0, top: 5),
                                      child: Image.asset(
                                          "assets/images/icon_black_location.png"),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 8.0, top: 4),
                                        child: Text(
                                          '45, Park Avenue, Near Sal Hospital, Thaltej, Ahmedabad.',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: ThemeClass.greyColor,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    height: 64,
                    width: 78,
                    child:
                        Image.asset("assets/images/lab_listview_builder.png"),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 60,
              color: ThemeClass.skyblueColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 2.8,
                    child: Row(
                      children: [
                        Image.asset("assets/icons/icon_short.png"),
                        SizedBox(
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
                    width: width / 2.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/icon_filter.png"),
                        SizedBox(
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
                  // Row(
                  //   children: [
                  //     Image.asset("assets/icons/filter_icon.png"),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     const Text(
                  //       "Filter",
                  //       style: TextStyle(
                  //           fontSize: 10, fontWeight: FontWeight.w900),
                  //     )
                  //   ],
                  // )
                ],
              ),
            )
          ],
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
