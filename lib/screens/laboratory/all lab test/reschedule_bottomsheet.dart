import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/global/flutter_toast.dart';

import '../../../themedata.dart';
import '../../../widgets/buttons/round_button.dart';
import '../book_appointment.dart';

class RescheduleBottomSheet extends StatefulWidget {
  const RescheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<RescheduleBottomSheet> createState() => _RescheduleBottomSheetState();
}

class _RescheduleBottomSheetState extends State<RescheduleBottomSheet> {
  @override
  bool check = false;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 355,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 20,
                color: Colors.transparent,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Reschedule Appointment',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: ThemeClass.greyColor2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Are you sure you want to reschedule your appointment?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: ThemeClass.orangeColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ThemeClass.greyColor1,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Transform.scale(
                                  scale: 0.9,
                                  child: Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                          width: 1.0,
                                          color: ThemeClass.orangeColor),
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeColor: ThemeClass.orangeColor,
                                    value: check,
                                    onChanged: (b) {
                                      setState(
                                        () {
                                          check = !check;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: ' I Accept',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    TextSpan(
                                        text: ' Rescheduling Policy',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: ThemeClass.orangeColor)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: RoundButton(
                                        buttonLabel: 'No',
                                        color: ThemeClass.whiteColor,
                                        fontcolor: ThemeClass.orangeColor,
                                        fontSize: 16,
                                        fontFamily: "poppins",
                                        onTap: () {
                                          Get.back();
                                        })),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: RoundButton(
                                        buttonLabel: 'Yes',
                                        fontSize: 16,
                                        fontFamily: "poppins",
                                        onTap: () {
                                          if (!check) {
                                            showToast(
                                                "Please accept rescheduling policy!");
                                          } else if (check) {
                                            Get.to(BookAppointment());
                                            ;
                                          }
                                        })),
                              ],
                            ),
                          ),
                        ],
                      )

                      // ElevatedButton(
                      //   child:
                      //       const Text('Close BottomSheet'),
                      //   onPressed: () =>
                      //       Navigator.pop(context),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                child: ClipRect(
                  child: Image.asset(
                    "assets/icons/icon_cancel.png",
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
