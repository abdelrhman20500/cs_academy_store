import 'package:cs_academy_store/Features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
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
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

