import 'package:cs_academy_store/Core/Routing/routes.dart';
import 'package:cs_academy_store/Features/auth/presentation/view/login_view.dart';
import 'package:cs_academy_store/Features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No Route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
