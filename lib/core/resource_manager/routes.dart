import 'package:flutter/material.dart';
import 'package:investa/features/auth/presentation/forget%20password/change_password.dart';
import 'package:investa/features/auth/presentation/forget%20password/forget_password.dart';
import 'package:investa/features/auth/presentation/forget%20password/send_otp_code.dart';
import 'package:investa/features/auth/presentation/login_screen.dart';
import 'package:investa/features/auth/presentation/signup/sign_up.dart';
import 'package:investa/features/cart%20and%20orders/presentation/widgets/confirm_shipping.dart';
import 'package:investa/features/main_screen.dart';
import 'package:investa/features/profile/presentation/profile_screen.dart';

class Routes {
  static const String login = "/login";
  static const String main = "/main";
  static const String signUp = "/signUp";
  static const String forgetPassword = "/forgetPassword";
  static const String sendOTPCode = "/sendOTPCode";
  static const String changePassword = "/changePassword";
  static const String profile = "/profile";
  static const String confirmShippingAddress = "/Confirm Shipping Address";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MainScreen(),
            transitionsBuilder: customAnimate);
      case Routes.login:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder: customAnimate);

      case Routes.signUp:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SignUpScreen(),
            transitionsBuilder: customAnimate);
      case Routes.forgetPassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ForgetPassword(),
            transitionsBuilder: customAnimate);
      case Routes.sendOTPCode:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SendOTPCode(),
            transitionsBuilder: customAnimate);
      case Routes.changePassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ChangePassword(),
            transitionsBuilder: customAnimate);
      case Routes.profile:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ProfileScreen(),
            transitionsBuilder: customAnimate);
        case Routes.confirmShippingAddress:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ConfirmShipping(),
            transitionsBuilder: customAnimate);

    }
    return unDefinedRoute();
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

Widget customAnimate(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // var begin = Offset(1.0, 0.0);
  // var end = Offset.zero;
  // var curve = Curves.decelerate;
  //
  // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
