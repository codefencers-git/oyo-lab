// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/screens/laboratory/lab_test_drawer_detail.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment/appointment_model.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment/appointment_service.dart';
import 'package:oyo_labs/themedata.dart';

class UpcomingAppointmentWidget extends StatefulWidget {
  UpcomingAppointmentWidget({Key? key, required this.isUpcoming})
      : super(key: key);
  bool isUpcoming;
  @override
  State<UpcomingAppointmentWidget> createState() =>
      _UpcomingAppointmentWidgetState();
}

class _UpcomingAppointmentWidgetState extends State<UpcomingAppointmentWidget> {
  var _futureCall;
  @override
  void initState() {
    _futureCall = AppointmentServiceController().getAppointment(widget.isUpcoming);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureCall,
        builder: (context, AsyncSnapshot<List<AppointmentData>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                return _buildAppointmentListTIle(snapshot.data!);
  
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
        });
  }

  Center _buildDataNotFound1(
    String text,
  ) {
    return Center(child: Text("$text"));
  }

  Padding _buildAppointmentListTIle(List<AppointmentData>? data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return _buildListTile(data[index]);
        },
      ),
    );
  }

  InkWell _buildListTile(AppointmentData data) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            color: const Color(0xfffeebe4),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.transparent)),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: data.labImage.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ThemeClass.orangeColor,
                      strokeWidth: 3,
                    ),
                  ),
                  errorWidget: (context, url, error) => const SizedBox(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'key_id'.tr + " ${data.customOrderId}",
                            style: const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "${data.bookingDate.toString()} ${data.bookingTime.toString()}",
                              style: const TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                        data.labName.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "₹ ${data.price}",
                        style: TextStyle(
                            fontSize: 16,
                            color: ThemeClass.orangeColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Get.to(DrawerLabTestScreen(appointmentId:data.id.toString()));
      },
    );
  }
}
