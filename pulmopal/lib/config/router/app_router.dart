import 'package:flutter/material.dart';
import 'package:pulmopal/config/router/route_name.dart';
import 'package:pulmopal/models/user_model.dart';
import 'package:pulmopal/pages/authentication/login_page.dart';
import 'package:pulmopal/pages/authentication/register_page.dart';
import 'package:pulmopal/pages/authentication/register_page_info.dart';
import 'package:pulmopal/pages/blog/blogeWrite/add_write.dart';
import 'package:pulmopal/pages/home/home_page.dart';

class AppRouter {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case AppRouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case AppRouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case AppRouteNames.signUpContinue:
        return MaterialPageRoute(builder: (_) => const RegisterPageInfo());
      case AppRouteNames.addArticle:
        final arguments = settings.arguments as Map<String, dynamic>;
        final currentUser = arguments['currentUser'] as UserModel;
        return MaterialPageRoute(
            builder: (_) => WriteArticle(
                  currentUser: currentUser,
                ));

      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
