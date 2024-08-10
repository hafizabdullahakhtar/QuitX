import 'package:beinghuman/features/Authentication/Screens/LoginScreen/login_screen.dart';
import 'package:beinghuman/features/Authentication/Screens/SignupScreen/signup_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  // Add more routes as needed

  static final routes = [
    GetPage(name: initialRoute, page: () => const LoginScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignupScreen()),
    // Define routes for other screens
  ];
}
