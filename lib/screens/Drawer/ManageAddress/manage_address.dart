import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/Drawer/ManageAddress/services%20and%20model/address_services.dart';
import 'package:oyo_labs/themedata.dart';
import 'package:oyo_labs/widgets/appbar/appbar_with_back_button.dart';
import 'package:oyo_labs/widgets/buttons/round_button.dart';

import 'services and model/address_model.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({Key? key}) : super(key: key);

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  final AddressServicesController _addressController =
      Get.put(AddressServicesController(), permanent: true);

  @override
  void initState() {
    _addressController.getAddressList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppbarWithBackButton(appbarTitle: 'key_manage_address'.tr),
        ),
        body: Obx(
          () => (_addressController.isloading.value == false)
              ? _addressController.isError.value == true
                  ? Center(
                      child: Text(
                          _addressController.errorMessage.value.toString()),
                    )
                  : Container(
                      padding: const EdgeInsets.all(16),
                      child: _addressController.addressData.isEmpty
                          ? const Center(child: Text("Address not added"))
                          : ListView.builder(
                              itemCount: _addressController.addressData.length,
                              itemBuilder: (context, index) {
                                AddrressData? addressData =
                                    _addressController.addressData[index];
                                return _buildAddressListTile(addressData);
                              },
                            ))
              : _buildCircularProgressIndicator(height, width),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          height: 45,
          child: RoundButton(
            onTap: () {
              Get.toNamed(Routes.addNewAddressScreen);
            },
            buttonLabel: 'key_add_new_address'.tr,
          ),
        ),
      ),
    );
  }

  Column _buildAddressListTile(AddrressData? addressData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              addressData!.addressType.toString() == "Home"
                  ? "assets/icons/icon_manage_add_home.png"
                  : "assets/icons/icon_building.png",
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            _buildAddress(addressData),
            _buildEditBtn(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
      ],
    );
  }

  DropdownButton<int> _buildEditBtn() {
    return DropdownButton(
        underline: const SizedBox(),
        icon: Image.asset(
          'assets/icons/icon_3_dots.png',
          height: 20,
        ),
        elevation: 50,
        dropdownColor: Colors.transparent,
        items: [
          DropdownMenuItem(
            enabled: false,
            alignment: Alignment.centerLeft,
            value: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      5,
                      2,
                    ),
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
              ),

              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              // margin: const EdgeInsets.only(right: 10),
              child: Text(
                'key_edit_btn'.tr,
                style: TextStyle(
                  fontSize: 12,
                  color: ThemeClass.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
        onChanged: (val) {});
  }

  Expanded _buildAddress(AddrressData? addressData) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addressData!.name.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          RichText(
            text: TextSpan(
              text: addressData.addressLine1.toString(),
              style: TextStyle(
                color: ThemeClass.greyColor1,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: addressData.addressLine2.toString(),
                  style: TextStyle(
                    color: ThemeClass.greyColor1,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCircularProgressIndicator(double height, double width) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          color: ThemeClass.orangeColor,
        ),
      ),
    );
  }
}
