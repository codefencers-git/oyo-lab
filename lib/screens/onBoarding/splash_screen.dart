import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oyo_labs/routes.dart';
import 'package:oyo_labs/screens/Drawer/CMS%20data/cms_service.dart';
import 'package:oyo_labs/screens/Drawer/Profile/profile_services.dart';
import 'package:oyo_labs/screens/authentication/user_controller.dart';
import 'package:oyo_labs/screens/home/Homepage%20Services/dashboard_services.dart';
import 'package:oyo_labs/screens/home/home_page.dart';
import 'package:oyo_labs/screens/onBoarding/onboarding_screen.dart';
import 'package:oyo_labs/screens/onBoarding/onboarding_services.dart';
import 'package:oyo_labs/services/SharedPrefServices/shared_pref_services.dart';
import 'package:oyo_labs/services/product_category/product_category_service.dart';
import 'package:oyo_labs/themedata.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final DashboardController _dashboardController =
      Get.put(DashboardController(), permanent: true);

  final ProductCategoryController _categoryController =
      Get.put(ProductCategoryController(), permanent: true);

  final profileController =
      Get.put(ProfileServiceController(), permanent: true);

  final UserController _userController =
      Get.put(UserController(), permanent: true);
      
  final CmsServices _cmsDataController =
      Get.put(CmsServices(), permanent: true);

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();

    _navigateTo();

    super.initState();
  }

  _navigateTo() async {
    _categoryController.getProductCategory();
    _cmsDataController.getCmsData();
    _dashboardController.getDashboardData();
    // String? token = await FirebaseMessaging.instance.getToken();
    // debugPrint("---firebase token ---->" + token.toString());
    try {
      bool? isOnboard = await OnBoadingPrefService.getOnBoaring();
      if (isOnboard == null) {
        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => OnboardingScreen()),
          ModalRoute.withName(Routes.onboardingScreen),
        );
      } else if (!isOnboard) {
        await _checkUserLogin();
        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomePage()),
          ModalRoute.withName(Routes.homeScreen),
        );
      } else {
        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => OnboardingScreen()),
          ModalRoute.withName(Routes.onboardingScreen),
        );
      }
    } catch (e) {
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => OnboardingScreen()),
        ModalRoute.withName(Routes.onboardingScreen),
      );
    }
  }

  _checkUserLogin() async {
    try {
      var getToken = await UserPrefService().getToken();
      print("--------$getToken");
      if (getToken != "" && getToken != null) {
        _userController.setIsLogin(true);
        await profileController.getprofileData();
        print("afer----");
      } else {
        _userController.setIsLogin(false);
      }
    } catch (e) {
      _userController.setIsLogin(false);
      print("------------> $e");
    }
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
