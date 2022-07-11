import 'package:get/get.dart';
import 'package:oyo_labs/screens/AboutUs/about_us.dart';
import 'package:oyo_labs/screens/Drawer/Member/update_member.dart';
import 'package:oyo_labs/screens/Drawer/My%20Prescription/my_prescription.dart';
import 'package:oyo_labs/screens/Drawer/TestReport/my_test_report.dart';
import 'package:oyo_labs/screens/Drawer/My%20Prescription/prescription_detail.dart';
import 'package:oyo_labs/screens/Drawer/Member/members.dart';

import 'package:oyo_labs/screens/authentication/Mobile%20Verification/mobile_verification_screen.dart';
import 'package:oyo_labs/screens/authentication/Signup/signup_screen.dart';
import 'package:oyo_labs/screens/laboratory/all_lab_tests.dart';
import 'package:oyo_labs/screens/laboratory/book_success.dart';
import 'package:oyo_labs/screens/laboratory/complete_booking.dart';
import 'package:oyo_labs/screens/laboratory/lab_test_detail.dart';
import 'package:oyo_labs/screens/laboratory/laboratory_detail.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment.dart';
import 'screens/ContactUs/contact_us.dart';
import 'screens/Drawer/ManageAddress/add_address.dart';
import 'screens/Drawer/ManageAddress/manage_address.dart';
import 'screens/Drawer/Member/add_new_member.dart';
import 'screens/Drawer/Refer and Earn/refer_and_earn.dart';
import 'screens/Drawer/Settings/setting.dart';
import 'screens/Drawer/Wallet/wallet_screen.dart';
import 'screens/authentication/Forgot Password/forgot_password_screen.dart';
import 'screens/authentication/Change Password/change_password_screen.dart';
import 'screens/authentication/Login/login.dart';
import 'screens/home/home_page.dart';
import 'screens/laboratory/book_appointment.dart';
import 'screens/Drawer/Settings/notification_setting.dart';
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
  static const String addMemberScreen = '/memberScreen';
  static const String myPrescritionSreen = '/myPrescription';
  static const String myTestReportScreen = '/myTestReport';
  static const String prescriptionDetails = '/prescriptionDetails';
  static const String manageAddressScreen = '/manageAddressScreen';
  static const String addNewAddressScreen = '/addNewAddressScreen';
  static const String addNewMembers = '/addNewMembers';
  static const String updateNewMemberScreen = '/updateNewMemberScreen';
  static const String referandEarnScreen = '/referandEarnScreen';
  static const String walletScreen = '/walletScreen';
  static const String settingScreen = '/settingScreen';

  static List<GetPage> gobalRoutes = [
    GetPage(name: splashRoute, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPassword()),
    GetPage(name: signupScreen, page: () => const SignupScreen()),
    GetPage(name: mobileVerificationScreen, page: () => MobileVerification()),
    GetPage(name: homeScreen, page: () => const HomePage()),
    GetPage(
        name: changePasswordScreen, page: () => const ChangePasswordScreen()),
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
    GetPage(name: labDetailScreen, page: () => const BookAppointment()),
    GetPage(name: labTileScreen, page: () => const LaboratoryDetail()),
    GetPage(name: allLabTests, page: () => const AllLabTests()),
    GetPage(name: addMemberScreen, page: () => const AddNewMember()),
    GetPage(name: myPrescritionSreen, page: () => const MyPrescription()),
    GetPage(name: myTestReportScreen, page: () => const MyTestRepoer()),
    GetPage(name: prescriptionDetails, page: () => const PrescriptionDetail()),
    GetPage(name: manageAddressScreen, page: () => const ManageAddress()),
    GetPage(name: addNewAddressScreen, page: () => const AddAddress()),
    GetPage(name: addNewMembers, page: () => const AddnewMemberScreen()),
    GetPage(name: updateNewMemberScreen, page: () => UpdateNewMemberScreen()),
    GetPage(name: referandEarnScreen, page: () => const ReferEarnScreen()),
    GetPage(name: walletScreen, page: () => const WalletScreen()),
    GetPage(name: settingScreen, page: () => const SettingScreen()),
  ];
}
