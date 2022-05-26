import 'package:get/get.dart';
import 'screens/authentication/login.dart';
import 'screens/onboarding_screen.dart';
import 'screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/splashScreen';
  static const String onboardingScreen = '/onBoarding';
  static const String loginScreen = '/login';

  static List<GetPage> gobalRoutes = [
    GetPage(name: splashRoute, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
  ];
}
