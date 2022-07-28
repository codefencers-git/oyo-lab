import 'package:get/get.dart';
import 'package:oyo_labs/screens/AboutUs/about_us.dart';
import 'package:oyo_labs/screens/Drawer/Help&FAQ%20screen/help_and_support.dart';
import 'package:oyo_labs/screens/Drawer/Member/update_member.dart';
import 'package:oyo_labs/screens/Drawer/My%20Prescription/my_prescription.dart';
import 'package:oyo_labs/screens/Drawer/Profile/change_password.dart';
import 'package:oyo_labs/screens/Drawer/Profile/my_profile.dart';
import 'package:oyo_labs/screens/Drawer/Terms%20&%20Privacy%20Policy/terms_privacy_screen.dart';
import 'package:oyo_labs/screens/Drawer/TestReport/my_test_report.dart';
import 'package:oyo_labs/screens/Drawer/My%20Prescription/prescription_detail.dart';
import 'package:oyo_labs/screens/Drawer/Member/members.dart';
import 'package:oyo_labs/screens/authentication/Signup/signup_screen.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/all_lab_tests_screen.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/lab_test_detail.dart';
import 'package:oyo_labs/screens/laboratory/all%20lab%20test/rating/rating_screen.dart';
import 'package:oyo_labs/screens/laboratory/book_success.dart';
import 'package:oyo_labs/screens/laboratory/complete_booking.dart';
import 'package:oyo_labs/screens/laboratory/lab_test_drawer_detail.dart';
import 'package:oyo_labs/screens/laboratory/my_appointment/my_appointment.dart';
import 'screens/ContactUs/contact_us.dart';
import 'screens/Drawer/ManageAddress/add_address.dart';
import 'screens/Drawer/ManageAddress/manage_address.dart';
import 'screens/Drawer/Member/add_new_member.dart';
import 'screens/Drawer/Refer and Earn/refer_and_earn.dart';
import 'screens/Drawer/Settings/setting.dart';
import 'screens/Drawer/Wallet/wallet_screen.dart';
import 'screens/authentication/Forgot Password/forgot_password_screen.dart';
import 'screens/authentication/Login/login.dart';
import 'screens/home/home_page.dart';
import 'screens/laboratory/book_appointment.dart';

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
  static const String myProfileScreen = '/myProfileScreen';
  static const String ratingScreen = '/ratingScreen';
  static const String drawerLabTestScreen = '/drawerLabTestScreen';
  static const String helpAndSupportScreen = '/helpAndSupportScreen';
  static const String termsAndPrivacyPolicy = '/termsAndPrivacyPolicy';

  static List<GetPage> gobalRoutes = [
    GetPage(name: splashRoute, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPassword()),
    GetPage(name: signupScreen, page: () => const SignupScreen()),
    GetPage(name: homeScreen, page: () => const HomePage()),
    GetPage(name: aboutUsScreen, page: () => AboutUs()),
    GetPage(name: contactUsScreen, page: () => const ContactUs()),
    GetPage(name: myUpCommingAppoinmentScreen, page: () => LabtestDetail()),
    GetPage(name: myAppointmentComplete, page: () => const LabTestComplete()),
    GetPage(name: checkAppointment, page: () => const MyAppointment()),
    GetPage(name: allLabTests, page: () => const AllLabTestsScreen()),
    GetPage(name: addMemberScreen, page: () => const AddNewMember()),
    GetPage(name: myPrescritionSreen, page: () => const MyPrescription()),
    GetPage(name: myTestReportScreen, page: () => const MyTestRepoer()),
    GetPage(name: prescriptionDetails, page: () => const PrescriptionDetail()),
    GetPage(name: manageAddressScreen, page: () => const ManageAddress()),
    GetPage(name: addNewAddressScreen, page: () => AddAddress()),
    GetPage(name: addNewMembers, page: () => const AddnewMemberScreen()),
    GetPage(name: referandEarnScreen, page: () => const ReferEarnScreen()),
    GetPage(name: walletScreen, page: () => const WalletScreen()),
    GetPage(name: settingScreen, page: () => const SettingScreen()),
    GetPage(name: myProfileScreen, page: () => const MyProfileScreen()),
   
    GetPage(
        name: helpAndSupportScreen, page: () => const HelpAndSupportScreen()),
    GetPage(
        name: termsAndPrivacyPolicy, page: () => const TermsAndPrivacyScreen()),
    GetPage(
        name: changePasswordScreen, page: () => const ChangePasswordScreen()),
  ];
}
