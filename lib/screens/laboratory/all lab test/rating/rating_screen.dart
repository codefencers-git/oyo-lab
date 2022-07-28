import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/text_box_normal.dart';
import 'package:oyo_labs/themedata.dart';
import '../../../../widgets/appbar/appbar_with_back_button.dart';
import '../../../../widgets/buttons/round_button.dart';
import 'rating_services.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key, required this.itemId, required this.orderId})
      : super(key: key);
  final String itemId;
  final String orderId;
  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  final TextEditingController _textController = TextEditingController();

  final RatingServicesComtroller _ratingServicesComtroller =
      Get.put(RatingServicesComtroller());

  final _formKey = GlobalKey<FormState>();

  double rating = 4.5;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: ThemeClass.whiteColor,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: 'Add Review'),
        ),
        body: Container(
          color: ThemeClass.whiteColor,
          height: height,
          width: width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            // ignore: prefer_const_literals_to_create_immutables
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'key_rate_your_experience'.tr,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: ThemeClass.greyColor2.withOpacity(0.2),
                    itemPadding: const EdgeInsets.only(right: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: ThemeClass.orangeColor,
                    ),
                    onRatingUpdate: (rating1) {
                      setState(() {
                        rating = rating1;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: ThemeClass.greyLightColor1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Tell us something",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: _formKey,
                    child: TextBoxSimpleWidget(
                        minLine: 6,
                        radius: 10,
                        hinttext: "",
                        controllers: _textController),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          height: 45,
          child: RoundButton(
            onTap: () async {
              if (_textController.text == "") {
                showToast('Please write your review!');
              } else if (_formKey.currentState!.validate()) {
                var mapData = <String, dynamic>{};
                mapData['item_id'] = widget.itemId;
                mapData['rating'] = rating;
                mapData['review'] = _textController.text;
                mapData['order_id'] = widget.orderId;
                await _ratingServicesComtroller.ratingServices(mapData);
              }
            },
            buttonLabel: 'Submit',
          ),
        ),
      ),
    );
  }
}
