import 'package:cs_academy_store/Core/Routing/app_route.dart';
import 'package:flutter/material.dart';
import 'Core/Routing/routes.dart';
import 'Core/Utilis/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  // "username": "emilys",
  // "password": "emilyspass"
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = SharedPref.getToken();
    final isLoggedIn = token != null && token.isNotEmpty;
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? Routes.homeView : Routes.loginView,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}

