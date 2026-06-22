import 'package:cs_academy_store/Features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

import 'Core/Utilis/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  // LoginCubit(Dio())..login(userName: "emilys",
  // password: "emilyspass");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}

