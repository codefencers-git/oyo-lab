import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';

import '../../widgets/appbar/appbar_with_back_button.dart';
import 'book_appointment.dart';

class LaboratoryDetail extends StatefulWidget {
  const LaboratoryDetail({Key? key}) : super(key: key);

  @override
  State<LaboratoryDetail> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LaboratoryDetail> {
  bool isLoadMore = false;

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
        body: SingleChildScrollView(
          child: Column(
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
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, top: 5),
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
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          '(120)',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: ThemeClass.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: 8.0, top: 5),
                                        child: Image.asset(
                                            "assets/images/icon_black_location.png"),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 8.0, top: 4),
                                          child: Text(
                                            '45, Park Avenue, Near Sal Hospital, Thaltej, Ahmedabad.',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: ThemeClass.greyColor,
                                                fontWeight: FontWeight.w400),
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
                height: 45,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      height: 64,
                      width: 78,
                      child:
                          Image.asset("assets/images/lab_listview_builder.png"),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tests",
                      style: TextStyle(
                          fontSize: 14,
                          color: ThemeClass.blackColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   height: 60,
              //   color: ThemeClass.skyblueColor,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SizedBox(
              //         width: width / 2.8,
              //         child: Row(
              //           children: [
              //             Image.asset("assets/icons/icon_short.png",
              //                 height: 20),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             const Text(
              //               "Short by : Relevance",
              //               style: TextStyle(
              //                   fontSize: 10, fontWeight: FontWeight.w900),
              //             ),
              //           ],
              //         ),
              //       ),
              //       VerticalDivider(
              //         thickness: 1,
              //         indent: 15,
              //         endIndent: 15,
              //         color: ThemeClass.orangeColor,
              //       ),
              //       SizedBox(
              //         width: width / 2.8,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Image.asset(
              //               "assets/icons/icon_filter.png",
              //               height: 20,
              //             ),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             const Text(
              //               "Filter",
              //               style: TextStyle(
              //                   fontSize: 10, fontWeight: FontWeight.w900),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: isLoadMore == false ? 2 : 10,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/lab_test.png"),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "ABO Group & RH Type",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "₹ 120.00",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: ThemeClass.orangeColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              child: Image.asset(
                                "assets/icons/icon_calander.png",
                                height: 30,
                              ),
                              onPressed: () {
                                Get.toNamed(Routes.labDetailScreen);
                              },
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 0.2,
                          indent: 2,
                          endIndent: 2,
                          color: ThemeClass.greyColor2,
                        ),
                      ],
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isLoadMore = !isLoadMore;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLoadMore == false ? "Load More" : "Less",
                      style: TextStyle(
                          fontSize: 12,
                          color: ThemeClass.orangeColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      isLoadMore == false
                          ? "assets/icons/icon_down_arrow.png"
                          : "assets/icons/icon_up_arrow.png",
                      height: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Reviews",
                      style: TextStyle(
                          fontSize: 12,
                          color: ThemeClass.darkgreyColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/john_image.png"),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: ThemeClass.darkgreyColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "October, 2021",
                                  style: TextStyle(
                                      fontSize: 6,
                                      color: ThemeClass.orangeColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
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
                                full: _image('assets/images/full_star.png'),
                                half: _image('assets/images/half_star.png'),
                                empty: _image('assets/images/blank_star.png'),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0.7),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                          style: TextStyle(
                              fontSize: 9,
                              color: ThemeClass.greyColor1,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// widget
  _image(String s) {
    return Image.asset(
      s,
      height: 20,
    );
  }
}
