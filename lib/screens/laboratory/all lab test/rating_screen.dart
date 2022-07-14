import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/text_box_normal.dart';
import 'package:oyo_labs/themedata.dart';

import '../../../routes.dart';
import '../../../widgets/appbar/appbar_with_back_button.dart';
import '../../../widgets/buttons/round_button.dart';

class RatingScreen extends StatefulWidget {
  RatingScreen({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController _textController = TextEditingController();

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
            physics: BouncingScrollPhysics(),
            // ignore: prefer_const_literals_to_create_immutables
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rate your experience",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: ThemeClass.greyColor2.withOpacity(0.2),
                    itemPadding: EdgeInsets.only(right: 4.0),
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
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: ThemeClass.greyLightColor1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tell us something",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextBoxSimpleWidget(
                      minLine: 6,
                      radius: 10,
                      hinttext: "",
                      controllers: _textController),
                  SizedBox(
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
            onTap: () {
              Get.toNamed(Routes.myUpCommingAppoinmentScreen);
            },
            buttonLabel: 'Submit',
          ),
        ),
      ),
    );
  }

  // submitReview() async {
  //   EasyLoading.show();

  //   try {
  //     Map<String, String> queryParameters = {
  //       "item_id": widget.id.toString(),
  //       "rating": rating.toString(),
  //       "review": _textController.text.toString()
  //     };

  //     var response = await HttpService.httpPost("submitReview", queryParameters,
  //         context: context);

  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       var res = jsonDecode(response.body);

  //       if (res['success'].toString() == "1" &&
  //           res['status'].toString() == "200") {
  //         showToast(res['message']);
  //         Navigator.pop(context);
  //       } else {
  //         showToast(res['message']);
  //         Navigator.pop(context);
  //       }
  //     } else if (response.statusCode == 401) {
  //       showToast(GlobalVariableForShowMessage.unauthorizedUser);
  //       await UserPrefService().removeUserData();
  //       NavigationService().navigatWhenUnautorized();
  //     } else {
  //       showToast(GlobalVariableForShowMessage.somethingwentwongMessage);
  //     }
  //   } catch (e) {
  //     if (e is SocketException) {
  //       showToast(GlobalVariableForShowMessage.socketExceptionMessage);
  //     } else if (e is TimeoutException) {
  //       showToast(GlobalVariableForShowMessage.timeoutExceptionMessage);
  //     } else {
  //       showToast(e.toString());
  //     }
  //   } finally {
  //     EasyLoading.dismiss();
  //   }
  // }
}
