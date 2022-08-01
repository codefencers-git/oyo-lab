// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oyo_labs/global/flutter_toast.dart';
import 'package:oyo_labs/screens/authentication/Login/login.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import '../../widgets/buttons/round_button.dart';
import 'package:image_picker/image_picker.dart';
import 'all lab test/member_selection_bottomsheet.dart';
import 'booking model and services/book_appointment_services.dart';

class BookAppointment extends StatefulWidget {
  BookAppointment({
    Key? key,
    this.type,
  }) : super(key: key);

  String? type;

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

final _formKey = GlobalKey<FormState>();

class _BookAppointmentState extends State<BookAppointment> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  late List<bool> isSelected;

  final BookAppointmentServicesController _bookAppointmentController =
      Get.find<BookAppointmentServicesController>();

  final ImagePicker _picker = ImagePicker();
  // File? image;
  List<XFile> multiplePrescription = [];

  int? select;
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  List<String> amTimeSlot = [
    "12:00 AM",
    "12:30 AM",
    "01:00 AM",
    "01:30 AM",
    "02:00 AM",
    "02:30 AM",
    "03:00 AM",
    "03:30 AM",
    "04:00 AM",
    "04:30 AM",
  ];
  List<String> pmTimeSlot = [
    "12:00 PM",
    "12:30 PM",
    "01:00 PM",
    "01:30 PM",
    "02:00 PM",
    "02:30 PM",
    "03:00 PM",
    "03:30 PM",
    "04:00 PM",
    "04:30 PM",
  ];

  String selectedTimeSlot = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppbarWithBackButton(
            appbarTitle: _bookAppointmentController.testDetails.value.title
                .toString() //widget.testDetails!.title.toString(),
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDatePicker(),
                _buildSelectSlot(),
                _buildTimeSlotWidget(),
                const SizedBox(height: 10),
                Text(
                  'key_have_prescription'.tr,
                  style: TextStyle(
                      fontSize: 14,
                      color: ThemeClass.blackColor2,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                widget.type != "Reschedule"
                    ? _priscripion(width)
                    : const SizedBox(),
                const SizedBox(height: 10),
                Text(
                  'Uploaded Prescription',
                  style: TextStyle(
                      fontSize: 14,
                      color: ThemeClass.blackColor2,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'key_payment_summary'.tr,
                  style: TextStyle(
                      fontSize: 14,
                      color: ThemeClass.blackColor2,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                _buildTotalMRPWidget(),
                Divider(color: ThemeClass.greyColor1),
                _buildPayableAmtWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBookAppointmentBtn(context),
    );
  }

  _checkUserLogin() async {
    try {
      var getToken = await UserPrefService().getToken();
      print("--------$getToken");
      if (getToken == "" || getToken == null) {
        Get.to(LoginScreen(isFromBooking: true));
        showToast("Login required");
      } else if (getToken != "" && getToken != null) {
        _checkValidation();
      }
    } catch (e) {
      print("------------> $e");
    }
  }

  _checkValidation() {
    if (_formKey.currentState!.validate()) {
      print(_dateController.text);
    } else {
      showToast("Please select date.");
    }
    if (selectedTimeSlot == "") {
      showToast("Please select timeslot");
    }
    if (multiplePrescription.isEmpty) {
      showToast("Please upload prescription");
    }
    if (_dateController.text != "" &&
        selectedTimeSlot != "" &&
        multiplePrescription.isNotEmpty) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return MemberSelectionBottomSheet(
            date: _dateController.text.trim(),
            time: selectedTimeSlot.substring(0, 5),
            prescription: multiplePrescription,
            memberId: "",
          );
        },
      );
    }
  }

  Container _buildBookAppointmentBtn(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 45,
      child: RoundButton(
        onTap: () {
          _checkUserLogin();
        },
        buttonLabel: 'key_book_appointment_btn'.tr,
      ),
    );
  }

  Row _buildPayableAmtWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'key_payable_amount'.tr,
          style: TextStyle(
              fontSize: 10,
              color: ThemeClass.blackColor1,
              fontWeight: FontWeight.w400),
        ),
        Row(
          children: [
            Text(
              "₹ ${_bookAppointmentController.testDetails.value.price.toString()}",
              style: TextStyle(
                  fontSize: 10,
                  color: ThemeClass.blackColor1,
                  fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    );
  }

  Row _buildTotalMRPWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'key_item_total_mrp'.tr,
          style: TextStyle(
              fontSize: 10,
              color: ThemeClass.greyColor1,
              fontWeight: FontWeight.w400),
        ),
        Row(
          children: [
            Text(
              "₹ ${_bookAppointmentController.testDetails.value.price.toString()}",
              style: TextStyle(
                  fontSize: 10,
                  color: ThemeClass.greyColor1,
                  fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }

  Padding _buildTimeSlotWidget() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: SizedBox(
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: amTimeSlot.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 4 / 1.8),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    select = index;
                  });
                  selectedTimeSlot = isSelected[0] == true
                      ? amTimeSlot[int.parse(select.toString())].toString()
                      : pmTimeSlot[int.parse(select.toString())].toString();
                  print(selectedTimeSlot);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: select == index
                        ? ThemeClass.orangeColor
                        : ThemeClass.orangeLightColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        isSelected[0] == true
                            ? amTimeSlot[index].toString()
                            : pmTimeSlot[index].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            color: select == index
                                ? ThemeClass.whiteColor
                                : ThemeClass.blackColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Column _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 10),
          child: Text(
            'key_select_date'.tr,
            style: TextStyle(
                fontSize: 12,
                color: ThemeClass.blackColor1,
                fontWeight: FontWeight.w700),
          ),
        ),
        DatePicker(
          dateController: _dateController,
        ),
      ],
    );
  }

  Widget _priscripion(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ThemeClass.skyblueColor,
            border: Border.all(width: 1, color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  XFile? pickedImage =
                      await _picker.pickImage(source: ImageSource.camera);
                  setState(() {
                    multiplePrescription.add(
                        XFile(pickedImage!.path)); //= File(pickedImage!.path);
                  });
                },
                child: SizedBox(
                  width: width / 2.8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/icon_camera.png",
                          height: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'key_camera'.tr,
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                thickness: 1,
                indent: 15,
                endIndent: 15,
                color: ThemeClass.orangeColor,
              ),
              InkWell(
                onTap: () async {
                  List<XFile>? picked = await _picker.pickMultiImage();
                  setState(() {
                    multiplePrescription =
                        picked!.map((e) => XFile(e.path)).toList();
                  });
                },
                child: SizedBox(
                  width: width / 2.8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/icon_gallery.png",
                          height: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'key_gallery'.tr,
                          style: const TextStyle(
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
        multiplePrescription.isNotEmpty
            ? Container(
                height: 100,
                padding: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                  itemCount: multiplePrescription.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 0, left: 10),
                      height: 100.0,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: ThemeClass.greyColor2,
                                )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(multiplePrescription[i].path),
                                height: 65,
                                width: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 58,
                            left: 18.0,
                            child: InkWell(
                              onTap: () {
                                multiplePrescription.removeAt(i);

                                setState(() {});
                              },
                              child: Image.asset(
                                "assets/icons/close-icon.png",
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Padding _buildSelectSlot() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'key_select_slot'.tr,
                style: TextStyle(
                    fontSize: 12,
                    color: ThemeClass.blackColor1,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 26,
                  child: ToggleButtons(
                    borderColor: ThemeClass.orangeColor,
                    fillColor: ThemeClass.orangeColor,
                    selectedBorderColor: ThemeClass.orangeColor,
                    selectedColor: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    children: [
                      Text(
                        'AM',
                        style: TextStyle(
                            fontSize: 10,
                            color: isSelected[0] == false
                                ? ThemeClass.blackColor1
                                : ThemeClass.whiteColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'PM',
                        style: TextStyle(
                            fontSize: 10,
                            color: isSelected[1] == false
                                ? ThemeClass.blackColor1
                                : ThemeClass.whiteColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                    onPressed: (int index) {
                      setState(
                        () {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                        },
                      );
                    },
                    isSelected: isSelected,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DatePicker extends StatefulWidget {
  TextEditingController dateController;
  DatePicker({
    Key? key,
    required this.dateController,
  }) : super(key: key);

  @override
  State<DatePicker> createState() => _date_pickerState();
}

// ignore: camel_case_types
class _date_pickerState extends State<DatePicker> {
  String currentDate() {
    DateTime currentDate = DateTime.now();
    //String formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);
    return currentDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: widget.dateController,
          decoration: InputDecoration(
            suffixIcon: Image.asset(
              "assets/icons/icon-calender.png",
              scale: 3,
            ),
            contentPadding:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            fillColor: ThemeClass.greyLightColor,
            filled: true,
            border: InputBorder.none,
            hintText: currentDate().substring(0, 10),
            hintStyle: TextStyle(
                color: ThemeClass.greyColor1,
                fontWeight: FontWeight.w400,
                fontSize: 12),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
          ),
          readOnly: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'key_date_validation'.tr;
            } else {
              return null;
            }
          },
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);

              setState(() {
                widget.dateController.text = formattedDate;
              });
            } else {
              // ignore: avoid_print
              print("Date is not selected");
            }
          },
        ),
      ),
    );
  }
}
