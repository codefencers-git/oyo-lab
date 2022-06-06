import 'package:flutter/material.dart';
import 'package:oyo_labs/themedata.dart';

class LabTestScreen extends StatefulWidget {
  const LabTestScreen({Key? key}) : super(key: key);

  @override
  State<LabTestScreen> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeClass.whiteColor,
        appBar: AppBar(
          backgroundColor: ThemeClass.orangeColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ImageIcon(
                AssetImage("assets/icons/icon-hamberger.png"),
              ),
            ),
          ),
          title: Row(
            children: [
              const ImageIcon(AssetImage("assets/icons/icon-location.png")),
              Text(
                " Ahmedabad",
                style: TextStyle(
                    fontSize: 14,
                    color: ThemeClass.whiteColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
