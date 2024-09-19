import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_store/features/dashboard/dashboard.dart';
import 'package:stardust_store/utils/theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stardust_store/features/authentication/screens/login/login.dart';

void main() async {
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stardust',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: StarTheme.lightTheme,
      darkTheme: StarTheme.darkTheme,
      home: const Dashboard(),
    );
  }
}
