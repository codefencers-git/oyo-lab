import 'package:get/get.dart';
import 'package:oyo_labs/screens/AboutUs/about_us.dart';
import 'package:oyo_labs/screens/MyAppointments/my_appointment.dart';

import 'package:oyo_labs/screens/authentication/forgot_password_screen.dart';
import 'package:oyo_labs/screens/authentication/mobile_verification_screen.dart';
import 'package:oyo_labs/screens/authentication/signup_screen.dart';
import 'package:oyo_labs/screens/home/all_laboratories.dart';
import 'package:oyo_labs/screens/laboratory/all_lab_tests.dart';
import 'package:oyo_labs/screens/laboratory/book_success.dart';
import 'package:oyo_labs/screens/laboratory/complete_booking.dart';
import 'package:oyo_labs/screens/laboratory/lab_test_detail.dart';
import 'package:oyo_labs/screens/laboratory/laboratory_detail.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment.dart';
import 'screens/ContactUs/contact_us.dart';
import 'screens/authentication/change_password_screen.dart';
import 'screens/authentication/login.dart';
import 'screens/home/home_page.dart';
import 'screens/laboratory/book_appointment.dart';
import 'screens/notification/notification_setting.dart';
import 'screens/onBoarding/onboarding_screen.dart';
import 'screens/onBoarding/splash_screen.dart';

class Routes {
  static const String splashRoute = '/splashScreen';
  static const String onboardingScreen = '/onBoarding';
  static const String loginScreen = '/login';
  static const String forgotPasswordScreen = '/forgotPassword';
  static const String signupScreen = '/signup';
  static const String mobileVerificationScreen = '/mobileVerification';
  static const String homeScreen = '/homeScreen';
  static const String changePasswordScreen = '/changePassword';
  static const String allLabScreen = '/allLabScreen';
  static const String myAppointmentScreen = '/myAppointment';
  static const String notificationSettingScreen = '/notificationSetting';
  static const String aboutUsScreen = '/aboutUs';
  static const String contactUsScreen = '/contactUs';
  static const String bookingSuccessScreen = '/bookingSuccess';
  static const String myUpCommingAppoinmentScreen = '/myUpCommingAppointment';
  static const String myAppointmentComplete = '/myAppointmentCompete';
  static const String checkAppointment = '/checkAppointment';
  static const String labDetailScreen = '/labDetailScreen';
  static const String labTileScreen = '/labTileScreen';
  static const String allLabTests = '/allLabTests';

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
    GetPage(name: allLabScreen, page: () => const AllLaboratories()),
    GetPage(name: myAppointmentScreen, page: () => const MyAppointments()),
    GetPage(
        name: notificationSettingScreen,
        page: () => const NotificationSetting()),
    GetPage(name: aboutUsScreen, page: () => const AboutUs()),
    GetPage(name: contactUsScreen, page: () => const ContactUs()),
    GetPage(name: bookingSuccessScreen, page: () => const BookingSuccess()),
    GetPage(
        name: myUpCommingAppoinmentScreen, page: () => const LabtestDetail()),
    GetPage(name: myAppointmentComplete, page: () => const LabTestComplete()),
    GetPage(name: checkAppointment, page: () => const MyAppointment()),
    GetPage(name: labDetailScreen, page: () => BookAppointment()),
    GetPage(name: labTileScreen, page: () => const LaboratoryDetail()),
    GetPage(name: allLabTests, page: () => const AllLabTests()),
  ];
}
