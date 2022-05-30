import 'package:get/get.dart';
import 'screens/authentication/change_password.dart';
import 'package:oyo_labs/screens/authentication/forgot_password_screen.dart';
import 'package:oyo_labs/screens/authentication/mobile_verification_screen.dart';
import 'package:oyo_labs/screens/authentication/signup_screen.dart';
import 'screens/authentication/change_password_screen.dart';
import 'screens/authentication/login.dart';
import 'screens/home/home_page.dart';
import 'screens/onboarding_screen.dart';
import 'screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/splashScreen';
  static const String onboardingScreen = '/onBoarding';
  static const String loginScreen = '/login';
  static const String forgotPasswordScreen = '/forgotPassword';
  static const String signupScreen = '/signup';
  static const String mobileVerificationScreen = '/mobileVerification';
  static const String homeScreen = '/homeScreen';
  static const String changePasswordScreen = '/changePassword';

  static List<GetPage> gobalRoutes = [
    GetPage(name: splashRoute, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgotPassword()),
    GetPage(name: signupScreen, page: () => const SignupScreen()),
    GetPage(
        name: mobileVerificationScreen, page: () => const MobileVerification()),
    GetPage(name: homeScreen, page: () => const HomePage()),
    GetPage(
        name: changePasswordScreen, page: () => const ChangePasswordScreen()),
  ];
}
