import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/themedata.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      _navigateTo();
    });
    super.initState();
  }

  _navigateTo() {
    Get.toNamed(Routes.onboardingScreen);
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
        body: SizedBox(
          width: width,
          child: Column(
            children: [
              buildImageWidget(height, width),
              const SizedBox(height: 20),
              SizedBox(
                width: width * 0.6,
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  Container buildImageWidget(double height, double width) {
    return Container(
      height: height / 1.5,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            300,
          ),
        ),
        image: DecorationImage(
            image: AssetImage("assets/images/splash-screen.png"),
            fit: BoxFit.cover),
      ),
    );
  }
}
