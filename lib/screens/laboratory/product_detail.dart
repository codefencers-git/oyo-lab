import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/global/global_messages.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/lab_test_detail_model.dart';
import 'package:oyo_labs/services/http_services.dart';
import 'package:oyo_labs/themedata.dart';
import '../../widgets/appbar/appbar_with_back_button.dart';
import 'package:geolocator/geolocator.dart';

/// Determine the current position of the device.

class LaboratoryDetail extends StatefulWidget {
  LaboratoryDetail({Key? key, required this.id}) : super(key: key);
  String id;
  @override
  State<LaboratoryDetail> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LaboratoryDetail> {
  bool isLoadMore = false;
  var _futureCall;
  var latlong;
  @override
  void initState() {
    super.initState();
    latlong = _determinePosition();
    _futureCall = _loadData();
  }

  Future<LAbTestDetailData?> _loadData() async {
    try {
      var response = await HttpServices.httpPostWithoutToken(
        "product/${widget.id}",
        {"latitude": "23.0771593", "longitude": "72.5047247"},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = json.decode(response.body);

        if (body['status'] == "200" && body['success'] == "1") {
          LAbTestDetailModel data = LAbTestDetailModel.fromJson(body);

          return data.data;
        } else {
          throw body['message'].toString();
        }
      } else if (response.statusCode == 401) {
        showToast(GlobalMessages.unauthorizedUser);
      } else if (response.statusCode == 500) {
        throw GlobalMessages.internalservererror;
      } else {
        throw GlobalMessages.internalservererror;
      }
    } catch (e) {
      if (e is SocketException) {
        throw GlobalMessages.socketExceptionMessage;
      } else if (e is TimeoutException) {
        throw GlobalMessages.timeoutExceptionMessage;
      } else {
        throw e.toString();
      }
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: _buildAppbar(),
        body: FutureBuilder(
            future: _futureCall,
            builder: (context, AsyncSnapshot<LAbTestDetailData?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    return _buildView(snapshot.data);
                  } else {
                    return _buildDataNotFound1("Data Not Found!");
                  }
                } else if (snapshot.hasError) {
                  return _buildDataNotFound1(snapshot.error.toString());
                } else {
                  return _buildDataNotFound1("Data Not Found!");
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: ThemeClass.orangeColor,
                  ),
                );
              }
            }));
  }

  Center _buildDataNotFound1(
    String text,
  ) {
    return Center(child: Text("$text"));
  }

  PreferredSize _buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65.0),
      child: AppbarWithBackButton(appbarTitle: "ABO Group & RH Type"),
    );
  }

  SingleChildScrollView _buildView(LAbTestDetailData? data) {
    print(data!.labList!.length);
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  data.image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              _buildDetailsCard(data),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          _buildLaboratoryImage(data.gallery),
          _buildLaboratoryNearTitle(data.labList),
          _buildNearLaboratory(data.labList),
          data.labList!.isEmpty || data.labList!.length <= 3
              ? const SizedBox()
              : _buildLoadMoreButton(),
          const SizedBox(
            height: 10,
          ),
          _buildCustomerReviewTitle(),
          const SizedBox(
            height: 10,
          ),
          _buildReviewList(data.reviews),
        ],
      ),
    );
  }

  ListView _buildReviewList(List<Review>? reviews) {
    return ListView.builder(
      //scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reviews!.length,
      itemBuilder: (context, index) {
        return _buildReviewListTile(reviews, index);
      },
    );
  }

  Padding _buildReviewListTile(List<Review> data, int index) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.network(
                  data[index].image.toString(),
                  fit: BoxFit.fill,
                  // fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].name.toString(),
                    style: TextStyle(
                        fontSize: 10,
                        color: ThemeClass.darkgreyColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    data[index].date.toString().substring(0, 10),
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
                initialRating: double.parse(data[index].rating.toString()),
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data[index].review.toString(),
            style: TextStyle(
                fontSize: 9,
                color: ThemeClass.greyColor1,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Padding _buildCustomerReviewTitle() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'key_customer_reviews'.tr,
            style: TextStyle(
                fontSize: 12,
                color: ThemeClass.darkgreyColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  InkWell _buildLoadMoreButton() {
    return InkWell(
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
            isLoadMore == false ? 'key_load_more'.tr : 'key_less'.tr,
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
    );
  }

  Padding _buildNearLaboratory(List<RecommendedProduct>? recommadProduct) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recommadProduct!.length <= 3
            ? recommadProduct.length
            : isLoadMore == false
                ? 3
                : recommadProduct.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Image.network(
                      recommadProduct[index].image.toString(),
                      height: 35,
                      width: 35,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recommadProduct[index].name.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            recommadProduct[index].area.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                color: ThemeClass.orangeColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Image.asset(
                        "assets/icons/icon_calander.png",
                        height: 30,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.labDetailScreen);
                      },
                    ),
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
    );
  }

  Padding _buildLaboratoryNearTitle(List<RecommendedProduct>? labList) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labList!.isNotEmpty
                ? 'key_laboratories_near_you'.tr
                : 'key_no_laboratory_near_you'.tr,
            style: TextStyle(
                fontSize: 14,
                color: ThemeClass.blackColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  SizedBox _buildLaboratoryImage(List<Gallery>? image) {
    return SizedBox(
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
            child: Image.network(
              image![index].image.toString(),
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }

  Positioned _buildDetailsCard(LAbTestDetailData? data) {
    return Positioned(
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
                data!.title.toString(),
                style: TextStyle(
                    fontSize: 14,
                    color: ThemeClass.blackColor,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.testcode.toString(),
                      style:
                          TextStyle(fontSize: 12, color: ThemeClass.greyColor),
                    ),
                    Text(
                      data.testType.toString(),
                      style:
                          TextStyle(fontSize: 12, color: ThemeClass.redColor),
                    ),
                    Text(
                      "₹ ${data.price.toString()}",
                      style: TextStyle(
                          fontSize: 20, color: ThemeClass.orangeColor),
                    ),
                  ],
                ),
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
