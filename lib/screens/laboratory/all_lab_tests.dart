import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/laboratory_tile.dart';
import 'package:oyo_labs/shortbybottomsheet.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_book_slot.dart';

import '../../routes.dart';

class AllLabTests extends StatefulWidget {
  const AllLabTests({Key? key}) : super(key: key);

  @override
  State<AllLabTests> createState() => _AllLabTestsState();
}

class _AllLabTestsState extends State<AllLabTests> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  bool isShowSearch = true;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
          appbarTitle: "Lab Tests",
          // isShowSearch: isShowSearch,
          onIconPress: () {
            setState(() {
              isShowSearch = !isShowSearch;
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // isShowSearch == false
            TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  cursorColor: ThemeClass.blackColor,
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                    suffixIcon: SizedBox(
                      child:
                          Image.asset("assets/icons/icon_search.png", scale: 3),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              color: ThemeClass.skyblueColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 2.9,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return ShortByBottomSheet();
                          },
                        );
                      },
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
                  ),
                  VerticalDivider(
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                    color: ThemeClass.orangeColor,
                  ),
                  SizedBox(
                    width: width / 2.9,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return Container();
                          },
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) =>
                                  CategoryFilterBottomSheet());
                        },
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Text(
              "A002",
              style: TextStyle(fontSize: 8, color: ThemeClass.orangeColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Text(
              "ABO Group & RH Type",
              style: TextStyle(fontSize: 10),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Text(
              "(Blood Group)",
              style: TextStyle(fontSize: 8, color: ThemeClass.greyColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Text(
              "(W B-ED TA (3ml))",
              style: TextStyle(fontSize: 8, color: ThemeClass.orangeColor),
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
